import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mission.dart';

/// Provider for available missions
final missionsProvider = Provider<List<Mission>>((ref) {
  return PredefinedMissions.allMissions;
});

/// Provider for selected mission
final selectedMissionProvider = StateProvider<Mission?>((ref) => null);
