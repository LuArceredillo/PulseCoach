/// Individual heart rate reading plain data model
class HeartRateReading {
  final int id;
  final DateTime timestamp;
  final int bpm;
  final int sessionId;

  HeartRateReading({
    this.id = 0,
    DateTime? timestamp,
    required this.bpm,
    required this.sessionId,
  }) : timestamp = timestamp ?? DateTime.now();
}
