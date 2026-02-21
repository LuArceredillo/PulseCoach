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
    title: 'Iniciación CACO',
    description: 'Ideal para empezar. 4 ciclos de 3 min caminar + 1 min trotar suave.',
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
    title: 'Quema Grasa Intenso',
    description: 'Mantente en la zona ideal para quemar calorías. 20 min constantes.',
    phases: [
      MissionPhase(type: PhaseType.walk, durationSeconds: 300, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 900, targetZone: 'Quema Grasa'),
    ],
  );

  static const Mission mission3 = Mission(
    id: 3,
    title: 'Intervalos HIIT',
    description: 'Alta intensidad para mejorar tu potencia aeróbica.',
    phases: [
      MissionPhase(type: PhaseType.walk, durationSeconds: 300, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Pico'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 120, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Pico'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 120, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 120, targetZone: 'Pico'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 300, targetZone: 'Enfriamiento'),
    ],
  );

  static const Mission mission4 = Mission(
    id: 4,
    title: 'Resistencia Pura',
    description: 'Entrenamiento de larga duración en zona aeróbica.',
    phases: [
      MissionPhase(type: PhaseType.walk, durationSeconds: 600, targetZone: 'Calentamiento'),
      MissionPhase(type: PhaseType.run, durationSeconds: 1800, targetZone: 'Cardio'),
      MissionPhase(type: PhaseType.walk, durationSeconds: 600, targetZone: 'Enfriamiento'),
    ],
  );

  static List<Mission> get allMissions => [mission1, mission2, mission3, mission4];
}
