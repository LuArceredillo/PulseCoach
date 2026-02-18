import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/colors.dart';
import '../providers/missions_provider.dart';
import '../widgets/mission_card.dart';
import 'training_console_screen.dart';

/// Missions selector screen
class MissionsScreen extends ConsumerWidget {
  const MissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missions = ref.watch(missionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona tu Misión'),
      ),
      body: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          final mission = missions[index];
          return MissionCard(
            mission: mission,
            onTap: () {
              ref.read(selectedMissionProvider.notifier).state = mission;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TrainingConsoleScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
