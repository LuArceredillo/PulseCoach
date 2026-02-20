/// Training session plain data model
class TrainingSession {
  final int id;
  final DateTime startTime;
  final DateTime? endTime;
  final int missionId;
  final int userAge;
  final int? avgHeartRate;
  final int? maxHeartRate;
  final double? caloriesBurned;
  final int timeInZoneRest;
  final int timeInZoneWarmup;
  final int timeInZoneFat;
  final int timeInZoneCardio;
  final int timeInZonePeak;
  final bool completed;

  TrainingSession({
    this.id = 0,
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
