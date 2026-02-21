import 'dart:async';
import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:rxdart/rxdart.dart';
import '../../core/constants/app_constants.dart';

/// Repository for Bluetooth Low Energy operations
class BleRepository {
  final BehaviorSubject<int?> _heartRateController = BehaviorSubject<int?>.seeded(null);
  final BehaviorSubject<int?> _batteryLevelController = BehaviorSubject<int?>.seeded(null);
  final BehaviorSubject<bool> _isConnectedController = BehaviorSubject<bool>.seeded(false);
  
  BluetoothDevice? _connectedDevice;
  StreamSubscription? _deviceStateSubscription;
  StreamSubscription? _hrCharacteristicSubscription;

  // Mock mode for testing without physical device
  bool _useMockData = false;
  Timer? _mockTimer;
  final Random _random = Random();
  
  // Mock data constants
  static const int mockBpmMin = 60;
  static const int mockBpmRange = 80; // Generates BPM between 60 and 140

  /// Stream of heart rate values
  Stream<int?> get heartRateStream => _heartRateController.stream;

  /// Current heart rate value
  int? get currentHeartRate => _heartRateController.value;

  /// Stream of battery level
  Stream<int?> get batteryLevelStream => _batteryLevelController.stream;

  /// Current battery level
  int? get currentBatteryLevel => _batteryLevelController.value;

  /// Stream of connection status
  Stream<bool> get isConnectedStream => _isConnectedController.stream;

  /// Current connection status
  bool get isConnected => _isConnectedController.value;

  /// Enable mock mode (for testing without device)
  void enableMockMode() {
    _useMockData = true;
    _startMockData();
  }

  /// Start scanning for Polar devices
  Future<void> startScan() async {
    if (_useMockData) {
      // Simulate connection in mock mode
      await Future.delayed(const Duration(seconds: 1));
      _isConnectedController.add(true);
      _batteryLevelController.add(85);
      return;
    }

    try {
      // Check if Bluetooth is available
      if (await FlutterBluePlus.isSupported == false) {
        throw Exception('Bluetooth no está disponible en este dispositivo');
      }

      // First check already connected devices
      List<BluetoothDevice> connectedDevices = FlutterBluePlus.connectedDevices;
      for (var device in connectedDevices) {
        final name = device.advName.isNotEmpty ? device.advName : device.platformName;
        if (name.contains(AppConstants.polarDevicePrefix)) {
          debugPrint('Banda Polar ya conectada encontrada: $name. Usando esta...');
          _connectToDevice(device);
          return;
        }
      }

      // Start scanning
      await FlutterBluePlus.startScan(
        timeout: AppConstants.scanTimeout,
        withServices: [Guid(AppConstants.heartRateServiceUuid)],
      );

      // Listen for scan results
      FlutterBluePlus.scanResults.listen((results) {
        for (ScanResult result in results) {
          final deviceName = result.device.advName.isNotEmpty 
              ? result.device.advName 
              : result.device.platformName;
          
          debugPrint('Dispositivo encontrado: $deviceName (${result.device.remoteId})');
          
          if (deviceName.contains(AppConstants.polarDevicePrefix)) {
            debugPrint('Banda Polar detectada! Conectando...');
            _connectToDevice(result.device);
            FlutterBluePlus.stopScan();
            break;
          }
        }
      });
    } catch (e) {
      debugPrint('Error al escanear dispositivos BLE: $e');
      // Fall back to mock mode on error
      enableMockMode();
    }
  }

  /// Connect to a specific device
  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      debugPrint('Intentando conectar a ${device.remoteId}...');
      await device.connect();
      _connectedDevice = device;
      _isConnectedController.add(true);
      debugPrint('Conexión establecida');

      // Listen to device state
      _deviceStateSubscription = device.connectionState.listen((state) {
        debugPrint('Estado de conexión cambiado: $state');
        _isConnectedController.add(state == BluetoothConnectionState.connected);
        if (state == BluetoothConnectionState.disconnected) {
          _handleDisconnection();
        }
      });

      // Small delay after connection often helps with service discovery
      await Future.delayed(const Duration(milliseconds: 500));

      // Discover services
      debugPrint('Descubriendo servicios...');
      List<BluetoothService> services = await device.discoverServices();
      debugPrint('Se encontraron ${services.length} servicios');
      
      final hrServiceUuid = Guid(AppConstants.heartRateServiceUuid);
      final hrCharUuid = Guid(AppConstants.heartRateMeasurementUuid);
      final batteryServiceUuid = Guid(AppConstants.batteryServiceUuid);
      final batteryCharUuid = Guid(AppConstants.batteryLevelUuid);

      // Subscribe to heart rate characteristic
      for (BluetoothService service in services) {
        if (service.uuid == hrServiceUuid) {
          debugPrint('Servicio de Frecuencia Cardíaca encontrado');
          for (BluetoothCharacteristic characteristic in service.characteristics) {
            if (characteristic.uuid == hrCharUuid) {
              debugPrint('Característica de medición de FC encontrada. Suscribiendo...');
              await characteristic.setNotifyValue(true);
              _hrCharacteristicSubscription = characteristic.lastValueStream.listen((value) {
                // debugPrint('Datos de FC recibidos: $value');
                _parseHeartRate(value);
              });
            }
          }
        }
        
        // Read battery level
        if (service.uuid == batteryServiceUuid) {
          debugPrint('Servicio de Batería encontrado');
          for (BluetoothCharacteristic characteristic in service.characteristics) {
            if (characteristic.uuid == batteryCharUuid) {
              debugPrint('Característica de nivel de batería encontrada');
              final value = await characteristic.read();
              if (value.isNotEmpty) {
                debugPrint('Nivel de batería: ${value[0]}%');
                _batteryLevelController.add(value[0]);
              }
            }
          }
        }
      }
    } catch (e) {
      debugPrint('Error al conectar con el dispositivo: $e');
      _isConnectedController.add(false);
    }
  }

  /// Parse heart rate from BLE characteristic value
  void _parseHeartRate(List<int> value) {
    if (value.isEmpty) {
      debugPrint('Datos de FC vacíos recibidos');
      return;
    }
    debugPrint('Parseando datos de FC: $value');

    // Parse according to Heart Rate Measurement characteristic format
    int flags = value[0];
    bool isUint16 = (flags & 0x01) == 1;

    int bpm;
    if (isUint16) {
      // Heart rate is UINT16
      bpm = value[1] + (value[2] << 8);
    } else {
      // Heart rate is UINT8
      bpm = value[1];
    }

    _heartRateController.add(bpm);
  }

  /// Handle device disconnection
  void _handleDisconnection() {
    _heartRateController.add(null);
    _hrCharacteristicSubscription?.cancel();
    _deviceStateSubscription?.cancel();
    
    // Attempt reconnection after delay
    Future.delayed(const Duration(seconds: 3), () {
      if (_connectedDevice != null && !_isConnectedController.value) {
        _connectToDevice(_connectedDevice!);
      }
    });
  }

  /// Start generating mock heart rate data
  void _startMockData() {
    _mockTimer?.cancel();
    _mockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Generate random heart rate between mockBpmMin and mockBpmMin + mockBpmRange
      final mockBpm = mockBpmMin + _random.nextInt(mockBpmRange + 1);
      _heartRateController.add(mockBpm);
    });
  }

  /// Disconnect from device
  Future<void> disconnect() async {
    _mockTimer?.cancel();
    
    if (_connectedDevice != null) {
      await _hrCharacteristicSubscription?.cancel();
      await _deviceStateSubscription?.cancel();
      await _connectedDevice!.disconnect();
      _connectedDevice = null;
    }
    
    _heartRateController.add(null);
    _isConnectedController.add(false);
  }

  /// Dispose resources
  void dispose() {
    _mockTimer?.cancel();
    _hrCharacteristicSubscription?.cancel();
    _deviceStateSubscription?.cancel();
    _heartRateController.close();
    _batteryLevelController.close();
    _isConnectedController.close();
  }
}
