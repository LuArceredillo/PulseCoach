import '../../data/repositories/ble_repository.dart';
import '../../core/constants/app_constants.dart';

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
      await _repository.startScan();
    }
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
