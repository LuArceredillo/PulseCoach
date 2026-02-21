import 'package:permission_handler/permission_handler.dart';
import '../../data/repositories/ble_repository.dart';

/// Service for managing Bluetooth connectivity
class BluetoothService {
  final BleRepository _repository;

  BluetoothService(this._repository);

  /// Stream of heart rate values
  Stream<int?> get heartRateStream => _repository.heartRateStream;

  /// Current heart rate value
  int? get currentHeartRate => _repository.currentHeartRate;

  /// Stream of battery level
  Stream<int?> get batteryLevelStream => _repository.batteryLevelStream;

  /// Current battery level
  int? get currentBatteryLevel => _repository.currentBatteryLevel;

  /// Stream of connection status
  Stream<bool> get isConnectedStream => _repository.isConnectedStream;

  /// Current connection status
  bool get isConnected => _repository.isConnected;

  /// Start scanning and auto-connect to Polar device
  Future<void> connectToDevice({bool useMockData = false}) async {
    if (useMockData) {
      _repository.enableMockMode();
    } else {
      final hasPermission = await _requestPermissions();
      if (hasPermission) {
        await _repository.startScan();
      }
    }
  }

  /// Request required Bluetooth permissions
  Future<bool> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    return statuses.values.every((status) => status.isGranted);
  }

  /// Disconnect from device
  Future<void> disconnect() async {
    await _repository.disconnect();
  }

  /// Dispose resources
  void dispose() {
    _repository.dispose();
  }
}
