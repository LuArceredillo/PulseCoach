import 'package:isar/isar.dart';

part 'heart_rate_reading.g.dart';

/// Individual heart rate reading stored in Isar database
@collection
class HeartRateReading {
  Id id = Isar.autoIncrement;

  late DateTime timestamp;

  late int bpm;

  @Index()
  late int sessionId;

  /// Constructor
  HeartRateReading({
    this.id = Isar.autoIncrement,
    DateTime? timestamp,
    required this.bpm,
    required this.sessionId,
  }) : timestamp = timestamp ?? DateTime.now();
}
