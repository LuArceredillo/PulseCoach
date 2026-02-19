/// Application-wide constants
class AppConstants {
  AppConstants._();

  // Bluetooth UUIDs
  static const String heartRateServiceUuid = '0000180d-0000-1000-8000-00805f9b34fb';
  static const String heartRateMeasurementUuid = '00002a37-0000-1000-8000-00805f9b34fb';
  static const String batteryServiceUuid = '0000180f-0000-1000-8000-00805f9b34fb';
  static const String batteryLevelUuid = '00002a19-0000-1000-8000-00805f9b34fb';

  // BLE Settings
  static const Duration scanTimeout = Duration(seconds: 10);
  static const String polarDevicePrefix = 'Polar';

  // TTS Settings
  static const String ttsLanguage = 'es-ES';
  static const double ttsRate = 0.5;
  static const double ttsVolume = 1.0;

  // Training defaults
  static const int defaultUserAge = 30;
  static const double caloriesPerMinuteBase = 10.0; // Simplified calculation

  // Heart Rate Zone Percentages
  static const double zoneRestMax = 0.60;
  static const double zoneWarmupMin = 0.60;
  static const double zoneWarmupMax = 0.70;
  static const double zoneFatBurnMin = 0.70;
  static const double zoneFatBurnMax = 0.80;
  static const double zoneCardioMin = 0.80;
  static const double zoneCardioMax = 0.90;
  static const double zonePeakMin = 0.90;

  // UI
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const double cardBorderRadius = 16.0;
  static const double defaultPadding = 16.0;
}
