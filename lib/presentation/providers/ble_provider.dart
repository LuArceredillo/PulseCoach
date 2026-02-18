import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/ble_repository.dart';
import '../../domain/services/bluetooth_service.dart';

/// Provider for BLE repository
final bleRepositoryProvider = Provider<BleRepository>((ref) {
  final repository = BleRepository();
  ref.onDispose(() => repository.dispose());
  return repository;
});

/// Provider for Bluetooth service
final bluetoothServiceProvider = Provider<BluetoothService>((ref) {
  final repository = ref.watch(bleRepositoryProvider);
  final service = BluetoothService(repository);
  ref.onDispose(() => service.dispose());
  return service;
});

/// Provider for heart rate stream
final heartRateProvider = StreamProvider<int?>((ref) {
  final service = ref.watch(bluetoothServiceProvider);
  return service.heartRateStream;
});

/// Provider for battery level stream
final batteryLevelProvider = StreamProvider<int?>((ref) {
  final service = ref.watch(bluetoothServiceProvider);
  return service.batteryLevelStream;
});

/// Provider for connection status stream
final connectionStatusProvider = StreamProvider<bool>((ref) {
  final service = ref.watch(bluetoothServiceProvider);
  return service.isConnectedStream;
});
