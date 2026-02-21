import 'dart:math';
import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../../core/utils/heart_rate_zones.dart';

/// Repository for managing training sessions using Drift (SQLite)
class SessionRepository {
  final AppDatabase _db = AppDatabase.instance;

  /// Save a training session with heart rate readings
  Future<int> saveSession({
    required int missionId,
    required int userAge,
    required DateTime startTime,
    required DateTime endTime,
    required List<HeartRateReadingData> readings, // Using Drift generated data class
  }) async {
    // Calculate metrics
    final avgBpm = readings.isEmpty
        ? 0
        : readings.map((r) => r.bpm).reduce((a, b) => a + b) ~/ readings.length;

    final maxBpm = readings.isEmpty ? 0 : readings.map((r) => r.bpm).reduce(max);

    // Calculate time in zones
    final Map<HRZone, int> timeInZones = {
      HRZone.rest: 0,
      HRZone.warmup: 0,
      HRZone.fatBurn: 0,
      HRZone.cardio: 0,
      HRZone.peak: 0,
    };

    for (final reading in readings) {
      final zone = HeartRateZones.getZoneForBPM(reading.bpm, userAge);
      timeInZones[zone] = (timeInZones[zone] ?? 0) + 1;
    }

    // Calculate calories (simplified)
    final durationMinutes = endTime.difference(startTime).inMinutes;
    final calories = durationMinutes * 10.0;

    // Create session
    final sessionId = await _db.into(_db.trainingSessions).insert(
          TrainingSessionsCompanion.insert(
            startTime: startTime,
            endTime: Value(endTime),
            missionId: missionId,
            userAge: userAge,
            avgHeartRate: Value(avgBpm),
            maxHeartRate: Value(maxBpm),
            caloriesBurned: Value(calories),
            timeInZoneRest: Value(timeInZones[HRZone.rest] ?? 0),
            timeInZoneWarmup: Value(timeInZones[HRZone.warmup] ?? 0),
            timeInZoneFat: Value(timeInZones[HRZone.fatBurn] ?? 0),
            timeInZoneCardio: Value(timeInZones[HRZone.cardio] ?? 0),
            timeInZonePeak: Value(timeInZones[HRZone.peak] ?? 0),
            completed: const Value(true),
          ),
        );

    // Save readings
    for (final reading in readings) {
      await _db.into(_db.heartRateReadings).insert(
            HeartRateReadingsCompanion.insert(
              timestamp: reading.timestamp,
              bpm: reading.bpm,
              sessionId: sessionId,
            ),
          );
    }

    return sessionId;
  }

  /// Get all completed sessions
  Future<List<TrainingSession>> getCompletedSessions() async {
    return await (_db.select(_db.trainingSessions)
          ..where((t) => t.completed.equals(true))
          ..orderBy([(t) => OrderingTerm(expression: t.startTime, mode: OrderingMode.desc)]))
        .get();
  }

  /// Get session by ID
  Future<TrainingSession?> getSessionById(int id) async {
    return await (_db.select(_db.trainingSessions)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Get heart rate readings for a session
  Future<List<HeartRateReading>> getReadingsForSession(int sessionId) async {
    return await (_db.select(_db.heartRateReadings)
          ..where((t) => t.sessionId.equals(sessionId))
          ..orderBy([(t) => OrderingTerm(expression: t.timestamp)]))
        .get();
  }

  /// Delete session and its readings
  Future<void> deleteSession(int id) async {
    await _db.transaction(() async {
      await (_db.delete(_db.heartRateReadings)..where((t) => t.sessionId.equals(id))).go();
      await (_db.delete(_db.trainingSessions)..where((t) => t.id.equals(id))).go();
    });
  }
}

// Extension to bridge Drift data classes with what the UI expects if needed
// Or just use Drift's generated classes directly as I did above.
typedef HeartRateReadingData = HeartRateReading;
