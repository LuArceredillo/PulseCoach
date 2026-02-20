import 'dart:math';
import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/training_session.dart';
import '../models/heart_rate_reading.dart';
import '../../core/utils/heart_rate_zones.dart';

/// Repository for managing training sessions using Drift
class SessionRepository {
  final AppDatabase _db;

  SessionRepository(this._db);

  /// Save a training session with heart rate readings
  Future<int> saveSession({
    required int missionId,
    required int userAge,
    required DateTime startTime,
    required DateTime endTime,
    required List<HeartRateReading> readings,
  }) async {
    // Calculate metrics
    final avgBpm = readings.isEmpty
        ? 0
        : readings.map((r) => r.bpm).reduce((a, b) => a + b) ~/
            readings.length;

    final maxBpm = readings.isEmpty
        ? 0
        : readings.map((r) => r.bpm).reduce(max);

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

    // Insert session
    final sessionId = await _db.into(_db.trainingSessionsTable).insert(
          TrainingSessionsTableCompanion.insert(
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
            completed: Value(true),
          ),
        );

    // Insert readings in a batch for efficiency
    await _db.batch((batch) {
      for (final reading in readings) {
        batch.insert(
          _db.heartRateReadingsTable,
          HeartRateReadingsTableCompanion.insert(
            timestamp: reading.timestamp,
            bpm: reading.bpm,
            sessionId: sessionId,
          ),
        );
      }
    });

    return sessionId;
  }

  /// Get all completed sessions
  Future<List<TrainingSession>> getCompletedSessions() async {
    final rows = await (_db.select(_db.trainingSessionsTable)
          ..where((t) => t.completed.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)]))
        .get();
    return rows.map(_rowToSession).toList();
  }

  /// Get session by ID
  Future<TrainingSession?> getSessionById(int id) async {
    final row = await (_db.select(_db.trainingSessionsTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row != null ? _rowToSession(row) : null;
  }

  /// Get heart rate readings for a session
  Future<List<HeartRateReading>> getReadingsForSession(int sessionId) async {
    final rows = await (_db.select(_db.heartRateReadingsTable)
          ..where((t) => t.sessionId.equals(sessionId))
          ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
        .get();
    return rows
        .map((r) => HeartRateReading(
              id: r.id,
              timestamp: r.timestamp,
              bpm: r.bpm,
              sessionId: r.sessionId,
            ))
        .toList();
  }

  /// Get last completed session
  Future<TrainingSession?> getLastSession() async {
    final row = await (_db.select(_db.trainingSessionsTable)
          ..where((t) => t.completed.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)])
          ..limit(1))
        .getSingleOrNull();
    return row != null ? _rowToSession(row) : null;
  }

  /// Delete session and its readings
  Future<void> deleteSession(int id) async {
    await (_db.delete(_db.heartRateReadingsTable)
          ..where((t) => t.sessionId.equals(id)))
        .go();
    await (_db.delete(_db.trainingSessionsTable)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  TrainingSession _rowToSession(TrainingSessionsTableData row) {
    return TrainingSession(
      id: row.id,
      startTime: row.startTime,
      endTime: row.endTime,
      missionId: row.missionId,
      userAge: row.userAge,
      avgHeartRate: row.avgHeartRate,
      maxHeartRate: row.maxHeartRate,
      caloriesBurned: row.caloriesBurned,
      timeInZoneRest: row.timeInZoneRest,
      timeInZoneWarmup: row.timeInZoneWarmup,
      timeInZoneFat: row.timeInZoneFat,
      timeInZoneCardio: row.timeInZoneCardio,
      timeInZonePeak: row.timeInZonePeak,
      completed: row.completed,
    );
  }
}
