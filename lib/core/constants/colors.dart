import 'package:flutter/material.dart';

/// App color palette following PulseCoach design specifications
class AppColors {
  AppColors._();

  // Dark mode background
  static const Color background = Color(0xFF121212);
  
  // Accent colors
  static const Color polarRed = Color(0xFFE31A21);
  static const Color neonGreen = Color(0xFFADFF2F);
  
  // Heart rate zone colors
  static const Color zoneRest = Colors.grey;
  static const Color zoneWarmup = Colors.blue;
  static const Color zoneFatBurn = Colors.green;
  static const Color zoneCardio = Colors.yellow;
  static const Color zonePeak = Colors.red;
  
  // UI elements
  static const Color cardBackground = Color(0xFF1E1E1E);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color divider = Colors.white24;
  
  // Phase colors
  static const Color phaseWalk = neonGreen;
  static const Color phaseRun = polarRed;
  static const Color phaseCompleted = Colors.green;
  static const Color phasePending = Colors.grey;
}
