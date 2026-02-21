import '../../core/utils/audio_coach.dart';

/// Service for Text-to-Speech coaching
class TtsService {
  final AudioCoach _audioCoach = AudioCoach();

  /// Initialize TTS
  Future<void> initialize() async {
    await _audioCoach.initialize();
  }

  /// Announce phase change
  Future<void> announcePhaseChange(String phaseType, String zoneName) async {
    await _audioCoach.announcePhaseChange(phaseType, zoneName);
  }

  /// Announce mission completion
  Future<void> announceMissionComplete() async {
    await _audioCoach.announceMissionComplete();
  }

  /// Announce zone warning
  Future<void> announceZoneWarning(String currentZone, String targetZone) async {
    await _audioCoach.announceZoneWarning(currentZone, targetZone);
  }

  /// Stop speaking
  Future<void> stop() async {
    await _audioCoach.stop();
  }

  /// Dispose resources
  void dispose() {
    _audioCoach.dispose();
  }
}
