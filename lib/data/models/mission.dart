/// Types of training phases
enum PhaseType {
  walk,
  run;

  String get displayName {
    switch (this) {
      case PhaseType.walk:
        return 'CAMINAR';
      case PhaseType.run:
        return 'CORRER';
    }
  }
}

/// Individual phase in a mission
class MissionPhase {
  final PhaseType type;
  final int durationSeconds;
  final String targetZone;

  const MissionPhase({
    required this.type,
    required this.durationSeconds,
    required this.targetZone,
  });

  /// Get duration in minutes
  double get durationMinutes => durationSeconds / 60.0;
}

/// Training mission (CACO plan)
class Mission {
  final int id;
  final String title;
  final String description;
  final List<MissionPhase> phases;

  const Mission({
    required this.id,
    required this.title,
    required this.description,
    required this.phases,
  });

  /// Get total duration in seconds
  int get totalDurationSeconds {
    return phases.fold(0, (sum, phase) => sum + phase.durationSeconds);
  }

  /// Get total duration in minutes
  int get totalDurationMinutes {
    return (totalDurationSeconds / 60).ceil();
  }

  /// Get formatted duration string
  String get durationString {
    final minutes = totalDurationMinutes;
    return '$minutes min';
  }
}

/// Predefined missions
class PredefinedMissions {
  PredefinedMissions._();

  static const Mission mission1 = Mission(
    id: 1,
    title: 'Misión 1 - Iniciación CACO',
    description: '4 ciclos de 3min caminar + 1min trotar',
    phases: [
      MissionPhase(type: PhaseType.walk, durationSeconds: 180, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 60, targetZone: 'Quema Grasa'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 180, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 60, targetZone: 'Quema Grasa'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 180, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 60, targetZone: 'Quema Grasa'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 180, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 60, targetZone: 'Quema Grasa'),
    ],
  );

  static const Mission mission2 = Mission(
    id: 2,
    title: 'Misión 2 - Progresión',
    description: '5 ciclos de 2min caminar + 2min trotar',
    phases: [
      MissionPhase(type: PhaseType.walk, durationSeconds: 120, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 120, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 120, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 120, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 120, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio'),
    ],
  );

  static const Mission mission3 = Mission(
    id: 3,
    title: 'Misión 3 - Desafío',
    description: '6 ciclos de 1min caminar + 2min correr',
    phases: [
      MissionPhase(type: PhaseType.walk, durationSeconds: 60, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio-Pico'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 60, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio-Pico'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 60, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio-Pico'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 60, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio-Pico'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 60, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio-Pico'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 60, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Cardio-Pico'),
    ],
  );

  static List<Mission> get allMissions => [mission1, mission2, mission3];
}
