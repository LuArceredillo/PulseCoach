import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/app_constants.dart';
import '../providers/missions_provider.dart';
import '../providers/training_provider.dart';
import '../widgets/bpm_display.dart';
import '../widgets/circular_timer.dart';
import '../widgets/zone_indicator.dart';
import '../../data/models/mission.dart';

/// Training console screen - active workout
class TrainingConsoleScreen extends ConsumerStatefulWidget {
  const TrainingConsoleScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TrainingConsoleScreen> createState() => _TrainingConsoleScreenState();
}

class _TrainingConsoleScreenState extends ConsumerState<TrainingConsoleScreen> {
  @override
  void initState() {
    super.initState();
    // Start mission when screen loads
    Future.microtask(() {
      final mission = ref.read(selectedMissionProvider);
      if (mission != null) {
        ref.read(trainingStateProvider.notifier).startMission(mission);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final trainingState = ref.watch(trainingStateProvider);
    final mission = trainingState.mission;

    if (mission == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Entrenamiento')),
        body: const Center(child: Text('No hay misión seleccionada')),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        
        // Confirm before leaving
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('¿Cancelar entrenamiento?'),
            content: const Text('¿Estás seguro de que quieres salir?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  ref.read(trainingStateProvider.notifier).stop();
                  Navigator.pop(context, true);
                },
                child: const Text('Sí'),
              ),
            ],
          ),
        );
        
        if (shouldPop == true && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(mission.title),
          actions: [
            if (trainingState.isCompleted)
              IconButton(
                icon: const Icon(Icons.check_circle, color: AppColors.neonGreen),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
        body: trainingState.isCompleted
            ? _buildCompletionView(trainingState)
            : _buildTrainingView(trainingState),
      ),
    );
  }

  Widget _buildTrainingView(dynamic trainingState) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // BPM Display
          Center(
            child: BpmDisplay(
              bpm: trainingState.currentBpm,
              zone: trainingState.currentZone,
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Circular Timer
          Center(
            child: CircularTimer(
              remainingSeconds: trainingState.phaseRemainingSeconds,
              totalSeconds: trainingState.currentPhase?.durationSeconds ?? 0,
              phaseType: trainingState.currentPhase?.type ?? PhaseType.walk,
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Phase progress bar
          _buildPhaseProgressBar(trainingState),
          
          const SizedBox(height: 32),
          
          // Controls
          _buildControls(trainingState),
          
          const SizedBox(height: 24),
          
          // Zone indicator
          ZoneIndicator(
            currentZone: trainingState.currentZone,
            age: AppConstants.defaultUserAge,
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseProgressBar(dynamic trainingState) {
    final mission = trainingState.mission;
    if (mission == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Progreso de Misión',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        
        // Phase segments
        Row(
          children: List.generate(mission.phases.length, (index) {
            final phase = mission.phases[index];
            final isCurrent = index == trainingState.currentPhaseIndex;
            final isCompleted = index < trainingState.currentPhaseIndex;
            
            Color color;
            if (isCompleted) {
              color = AppColors.phaseCompleted;
            } else if (isCurrent) {
              color = phase.type == PhaseType.walk 
                  ? AppColors.phaseWalk 
                  : AppColors.phaseRun;
            } else {
              color = AppColors.phasePending;
            }
            
            return Expanded(
              flex: phase.durationSeconds,
              child: Container(
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }),
        ),
        
        const SizedBox(height: 8),
        
        // Phase info
        Text(
          'Fase ${trainingState.currentPhaseIndex + 1} de ${mission.phases.length}',
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildControls(dynamic trainingState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!trainingState.isPaused)
          ElevatedButton.icon(
            onPressed: () {
              ref.read(trainingStateProvider.notifier).pause();
            },
            icon: const Icon(Icons.pause),
            label: const Text('Pausar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.polarRed,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          )
        else
          ElevatedButton.icon(
            onPressed: () {
              ref.read(trainingStateProvider.notifier).resume();
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text('Reanudar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neonGreen,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
      ],
    );
  }

  Widget _buildCompletionView(dynamic trainingState) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_events,
              color: AppColors.neonGreen,
              size: 120,
            ),
            const SizedBox(height: 24),
            const Text(
              '¡Misión Completada!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.neonGreen,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Excelente trabajo',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            
            // Stats
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  children: [
                    _buildStatRow('Duración', '${trainingState.elapsedSeconds ~/ 60} min'),
                    const Divider(),
                    _buildStatRow('FC Promedio', '${_calculateAvgBpm(trainingState)} BPM'),
                    const Divider(),
                    _buildStatRow('FC Máxima', '${_calculateMaxBpm(trainingState)} BPM'),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Text('Finalizar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  int _calculateAvgBpm(dynamic trainingState) {
    if (trainingState.readings.isEmpty) return 0;
    final sum = trainingState.readings.fold<int>(
      0,
      (prev, reading) => prev + reading.bpm,
    );
    return sum ~/ trainingState.readings.length;
  }

  int _calculateMaxBpm(dynamic trainingState) {
    if (trainingState.readings.isEmpty) return 0;
    return trainingState.readings.fold<int>(
      0,
      (max, reading) => reading.bpm > max ? reading.bpm : max,
    );
  }
}
