import 'dart:async';
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
      if (await FlutterBluePlus.isAvailable == false) {
        throw Exception('Bluetooth no está disponible en este dispositivo');
      }

      // Start scanning
      await FlutterBluePlus.startScan(
        timeout: AppConstants.scanTimeout,
        withServices: [Guid(AppConstants.heartRateServiceUuid)],
      );

      // Listen for scan results
      FlutterBluePlus.scanResults.listen((results) {
        for (ScanResult result in results) {
          if (result.device.platformName.contains(AppConstants.polarDevicePrefix)) {
            _connectToDevice(result.device);
            FlutterBluePlus.stopScan();
            break;
          }
        }
      });
    } catch (e) {
      print('Error al escanear dispositivos BLE: $e');
      // Fall back to mock mode on error
      enableMockMode();
    }
  }

  /// Connect to a specific device
  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      _connectedDevice = device;
      _isConnectedController.add(true);

      // Listen to device state
      _deviceStateSubscription = device.connectionState.listen((state) {
        _isConnectedController.add(state == BluetoothConnectionState.connected);
        if (state == BluetoothConnectionState.disconnected) {
          _handleDisconnection();
        }
      });

      // Discover services
      List<BluetoothService> services = await device.discoverServices();
      
      // Subscribe to heart rate characteristic
      for (BluetoothService service in services) {
        if (service.uuid.toString().toLowerCase() == AppConstants.heartRateServiceUuid) {
          for (BluetoothCharacteristic characteristic in service.characteristics) {
            if (characteristic.uuid.toString().toLowerCase() == AppConstants.heartRateMeasurementUuid) {
              await characteristic.setNotifyValue(true);
              _hrCharacteristicSubscription = characteristic.lastValueStream.listen(_parseHeartRate);
            }
          }
        }
        
        // Read battery level
        if (service.uuid.toString().toLowerCase() == AppConstants.batteryServiceUuid) {
          for (BluetoothCharacteristic characteristic in service.characteristics) {
            if (characteristic.uuid.toString().toLowerCase() == AppConstants.batteryLevelUuid) {
              final value = await characteristic.read();
              if (value.isNotEmpty) {
                _batteryLevelController.add(value[0]);
              }
            }
          }
        }
      }
    } catch (e) {
      print('Error al conectar con el dispositivo: $e');
      _isConnectedController.add(false);
    }
  }

  /// Parse heart rate from BLE characteristic value
  void _parseHeartRate(List<int> value) {
    if (value.isEmpty) return;

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
