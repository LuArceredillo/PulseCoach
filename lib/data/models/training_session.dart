import 'package:isar/isar.dart';

part 'training_session.g.dart';

/// Training session stored in Isar database
@collection
class TrainingSession {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime startTime;

  DateTime? endTime;

  late int missionId;

  late int userAge;

  int? avgHeartRate;

  int? maxHeartRate;

  double? caloriesBurned;

  // Time in each zone (seconds)
  int timeInZoneRest = 0;
  int timeInZoneWarmup = 0;
  int timeInZoneFat = 0;
  int timeInZoneCardio = 0;
  int timeInZonePeak = 0;

  @Index()
  bool completed = false;

  /// Constructor
  TrainingSession({
    this.id = Isar.autoIncrement,
    DateTime? startTime,
    this.endTime,
    required this.missionId,
    required this.userAge,
    this.avgHeartRate,
    this.maxHeartRate,
    this.caloriesBurned,
    this.timeInZoneRest = 0,
    this.timeInZoneWarmup = 0,
    this.timeInZoneFat = 0,
    this.timeInZoneCardio = 0,
    this.timeInZonePeak = 0,
    this.completed = false,
  }) : startTime = startTime ?? DateTime.now();

  /// Get total duration in seconds
  int get durationSeconds {
    if (endTime == null) return 0;
    return endTime!.difference(startTime).inSeconds;
  }
}
