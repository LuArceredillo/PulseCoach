import 'dart:math';
import 'package:isar/isar.dart';
import '../database/isar_service.dart';
import '../models/training_session.dart';
import '../models/heart_rate_reading.dart';
import '../../core/utils/heart_rate_zones.dart';

/// Repository for managing training sessions
class SessionRepository {
  /// Save a training session with heart rate readings
  Future<int> saveSession({
    required int missionId,
    required int userAge,
    required DateTime startTime,
    required DateTime endTime,
    required List<HeartRateReading> readings,
  }) async {
    final isar = await IsarService.getInstance();

    // Calculate metrics
    final avgBpm = readings.isEmpty 
        ? 0 
        : readings.map((r) => r.bpm).reduce((a, b) => a + b) ~/ readings.length;
    
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
    final calories = durationMinutes * 10.0; // Simplified calculation

    // Create session
    final session = TrainingSession(
      missionId: missionId,
      userAge: userAge,
      startTime: startTime,
      endTime: endTime,
      avgHeartRate: avgBpm,
      maxHeartRate: maxBpm,
      caloriesBurned: calories,
      timeInZoneRest: timeInZones[HRZone.rest] ?? 0,
      timeInZoneWarmup: timeInZones[HRZone.warmup] ?? 0,
      timeInZoneFat: timeInZones[HRZone.fatBurn] ?? 0,
      timeInZoneCardio: timeInZones[HRZone.cardio] ?? 0,
      timeInZonePeak: timeInZones[HRZone.peak] ?? 0,
      completed: true,
    );

    // Save to database
    int sessionId = 0;
    await isar.writeTxn(() async {
      sessionId = await isar.trainingSessions.put(session);
      
      // Update readings with session ID and save
      for (final reading in readings) {
        reading.sessionId = sessionId;
      }
      await isar.heartRateReadings.putAll(readings);
    });

    return sessionId;
  }

  /// Get all completed sessions
  Future<List<TrainingSession>> getCompletedSessions() async {
    final isar = await IsarService.getInstance();
    return await isar.trainingSessions
        .filter()
        .completedEqualTo(true)
        .sortByStartTimeDesc()
        .findAll();
  }

  /// Get session by ID
  Future<TrainingSession?> getSessionById(int id) async {
    final isar = await IsarService.getInstance();
    return await isar.trainingSessions.get(id);
  }

  /// Get heart rate readings for a session
  Future<List<HeartRateReading>> getReadingsForSession(int sessionId) async {
    final isar = await IsarService.getInstance();
    return await isar.heartRateReadings
        .filter()
        .sessionIdEqualTo(sessionId)
        .sortByTimestamp()
        .findAll();
  }

  /// Get last completed session
  Future<TrainingSession?> getLastSession() async {
    final isar = await IsarService.getInstance();
    final sessions = await isar.trainingSessions
        .filter()
        .completedEqualTo(true)
        .sortByStartTimeDesc()
        .limit(1)
        .findAll();
    
    return sessions.isEmpty ? null : sessions.first;
  }

  /// Delete session and its readings
  Future<void> deleteSession(int id) async {
    final isar = await IsarService.getInstance();
    await isar.writeTxn(() async {
      // Delete associated readings
      await isar.heartRateReadings
          .filter()
          .sessionIdEqualTo(id)
          .deleteAll();
      
      // Delete session
      await isar.trainingSessions.delete(id);
    });
  }
}
