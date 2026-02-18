import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mission.dart';
import '../../data/models/heart_rate_reading.dart';
import '../../data/repositories/session_repository.dart';
import '../../domain/services/tts_service.dart';
import '../../core/utils/heart_rate_zones.dart';
import '../../core/constants/app_constants.dart';
import 'ble_provider.dart';

/// Training state
class TrainingState {
  final Mission? mission;
  final int currentPhaseIndex;
  final int elapsedSeconds;
  final int? currentBpm;
  final HRZone? currentZone;
  final bool isActive;
  final bool isPaused;
  final List<HeartRateReading> readings;

  const TrainingState({
    this.mission,
    this.currentPhaseIndex = 0,
    this.elapsedSeconds = 0,
    this.currentBpm,
    this.currentZone,
    this.isActive = false,
    this.isPaused = false,
    this.readings = const [],
  });

  TrainingState copyWith({
    Mission? mission,
    int? currentPhaseIndex,
    int? elapsedSeconds,
    int? currentBpm,
    HRZone? currentZone,
    bool? isActive,
    bool? isPaused,
    List<HeartRateReading>? readings,
  }) {
    return TrainingState(
      mission: mission ?? this.mission,
      currentPhaseIndex: currentPhaseIndex ?? this.currentPhaseIndex,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      currentBpm: currentBpm ?? this.currentBpm,
      currentZone: currentZone ?? this.currentZone,
      isActive: isActive ?? this.isActive,
      isPaused: isPaused ?? this.isPaused,
      readings: readings ?? this.readings,
    );
  }

  /// Get current phase
  MissionPhase? get currentPhase {
    if (mission == null || currentPhaseIndex >= mission!.phases.length) {
      return null;
    }
    return mission!.phases[currentPhaseIndex];
  }

  /// Get elapsed seconds in current phase
  int get phaseElapsedSeconds {
    int totalSeconds = 0;
    for (int i = 0; i < currentPhaseIndex; i++) {
      totalSeconds += mission!.phases[i].durationSeconds;
    }
    return elapsedSeconds - totalSeconds;
  }

  /// Get remaining seconds in current phase
  int get phaseRemainingSeconds {
    if (currentPhase == null) return 0;
    return currentPhase!.durationSeconds - phaseElapsedSeconds;
  }

  /// Get total remaining seconds
  int get totalRemainingSeconds {
    if (mission == null) return 0;
    return mission!.totalDurationSeconds - elapsedSeconds;
  }

  /// Check if mission is completed
  bool get isCompleted {
    if (mission == null) return false;
    return elapsedSeconds >= mission!.totalDurationSeconds;
  }
}

/// Training state notifier
class TrainingStateNotifier extends StateNotifier<TrainingState> {
  final TtsService _ttsService;
  final SessionRepository _sessionRepository;
  final Ref _ref;
  Timer? _timer;
  StreamSubscription? _hrSubscription;

  TrainingStateNotifier(
    this._ttsService,
    this._sessionRepository,
    this._ref,
  ) : super(const TrainingState()) {
    _ttsService.initialize();
  }

  /// Start a mission
  Future<void> startMission(Mission mission) async {
    state = TrainingState(
      mission: mission,
      currentPhaseIndex: 0,
      elapsedSeconds: 0,
      isActive: true,
      isPaused: false,
      readings: [],
    );

    // Subscribe to heart rate updates
    _hrSubscription?.cancel();
    _hrSubscription = _ref.read(heartRateProvider.stream).listen((bpm) {
      if (bpm != null && state.isActive && !state.isPaused) {
        _updateHeartRate(bpm);
      }
    });

    // Announce first phase
    final firstPhase = mission.phases[0];
    await _ttsService.announcePhaseChange(
      firstPhase.type == PhaseType.walk ? 'walk' : 'run',
      firstPhase.targetZone,
    );

    // Start timer
    _startTimer();
  }

  /// Start timer
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!state.isPaused) {
        _tick();
      }
    });
  }

  /// Timer tick
  void _tick() {
    final newElapsed = state.elapsedSeconds + 1;
    
    // Check if phase changed
    int phaseSeconds = 0;
    int newPhaseIndex = state.currentPhaseIndex;
    
    for (int i = 0; i <= state.currentPhaseIndex; i++) {
      phaseSeconds += state.mission!.phases[i].durationSeconds;
    }
    
    if (newElapsed >= phaseSeconds) {
      newPhaseIndex++;
      
      // Check if mission completed
      if (newPhaseIndex >= state.mission!.phases.length) {
        _completeMission();
        return;
      }
      
      // Announce phase change
      final nextPhase = state.mission!.phases[newPhaseIndex];
      _ttsService.announcePhaseChange(
        nextPhase.type == PhaseType.walk ? 'walk' : 'run',
        nextPhase.targetZone,
      );
      
      state = state.copyWith(
        currentPhaseIndex: newPhaseIndex,
        elapsedSeconds: newElapsed,
      );
    } else {
      state = state.copyWith(elapsedSeconds: newElapsed);
    }
  }

  /// Update heart rate
  void _updateHeartRate(int bpm) {
    final zone = HeartRateZones.getZoneForBPM(bpm, AppConstants.defaultUserAge);
    
    // Create reading (will be saved when session completes)
    final reading = HeartRateReading(
      bpm: bpm,
      sessionId: 0, // Will be updated when saving
      timestamp: DateTime.now(),
    );
    
    state = state.copyWith(
      currentBpm: bpm,
      currentZone: zone,
      readings: [...state.readings, reading],
    );
  }

  /// Pause training
  void pause() {
    state = state.copyWith(isPaused: true);
  }

  /// Resume training
  void resume() {
    state = state.copyWith(isPaused: false);
  }

  /// Stop training
  void stop() {
    _timer?.cancel();
    _hrSubscription?.cancel();
    state = const TrainingState();
  }

  /// Complete mission
  Future<void> _completeMission() async {
    _timer?.cancel();
    _hrSubscription?.cancel();
    
    // Announce completion
    await _ttsService.announceMissionComplete();
    
    // Save session
    if (state.mission != null && state.readings.isNotEmpty) {
      final startTime = DateTime.now().subtract(Duration(seconds: state.elapsedSeconds));
      await _sessionRepository.saveSession(
        missionId: state.mission!.id,
        userAge: AppConstants.defaultUserAge,
        startTime: startTime,
        endTime: DateTime.now(),
        readings: state.readings,
      );
    }
    
    state = state.copyWith(isActive: false);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _hrSubscription?.cancel();
    _ttsService.dispose();
    super.dispose();
  }
}

/// Provider for TTS service
final ttsServiceProvider = Provider<TtsService>((ref) {
  final service = TtsService();
  ref.onDispose(() => service.dispose());
  return service;
});

/// Provider for session repository
final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionRepository();
});

/// Provider for training state
final trainingStateProvider = StateNotifierProvider<TrainingStateNotifier, TrainingState>((ref) {
  final ttsService = ref.watch(ttsServiceProvider);
  final sessionRepository = ref.watch(sessionRepositoryProvider);
  return TrainingStateNotifier(ttsService, sessionRepository, ref);
});
