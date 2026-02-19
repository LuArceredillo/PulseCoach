import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/training_session.dart';
import '../models/heart_rate_reading.dart';

/// Service for managing Isar database
class IsarService {
  static Isar? _isar;

  /// Get Isar instance (singleton)
  static Future<Isar> getInstance() async {
    if (_isar != null && _isar!.isOpen) {
      return _isar!;
    }

    final dir = await getApplicationDocumentsDirectory();
    
    _isar = await Isar.open(
      [TrainingSessionSchema, HeartRateReadingSchema],
      directory: dir.path,
    );

    return _isar!;
  }

  /// Close database
  static Future<void> close() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
      _isar = null;
    }
  }

  /// Clear all data (for testing)
  static Future<void> clearAll() async {
    final isar = await getInstance();
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
