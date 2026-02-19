import 'package:flutter_tts/flutter_tts.dart';
import '../constants/app_constants.dart';

/// Service for providing audio coaching instructions via TTS
class AudioCoach {
  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;

  /// Initialize TTS with Spanish language settings
  Future<void> initialize() async {
    if (_initialized) return;

    await _tts.setLanguage(AppConstants.ttsLanguage);
    await _tts.setSpeechRate(AppConstants.ttsRate);
    await _tts.setVolume(AppConstants.ttsVolume);
    _initialized = true;
  }

  /// Announce phase change
  Future<void> announcePhaseChange(String phaseType, String zoneName) async {
    await initialize();
    final action = phaseType.toLowerCase() == 'walk' ? 'caminar' : 'correr';
    await _tts.speak('Empieza a $action ahora, mantente en zona $zoneName');
  }

  /// Announce mission completion
  Future<void> announceMissionComplete() async {
    await initialize();
    await _tts.speak('¡Misión completada! Excelente trabajo');
  }

  /// Announce zone warning
  Future<void> announceZoneWarning(String currentZone, String targetZone) async {
    await initialize();
    await _tts.speak('Estás en zona $currentZone, intenta mantener zona $targetZone');
  }

  /// Stop speaking
  Future<void> stop() async {
    await _tts.stop();
  }

  /// Dispose resources
  void dispose() {
    _tts.stop();
  }
}
