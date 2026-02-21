import '../constants/app_constants.dart';
import '../constants/colors.dart';
import 'package:flutter/material.dart';

/// Heart rate zone enumeration
enum HRZone {
  rest,
  warmup,
  fatBurn,
  cardio,
  peak;

  /// Get zone name in Spanish
  String get displayName {
    switch (this) {
      case HRZone.rest:
        return 'Reposo';
      case HRZone.warmup:
        return 'Calentamiento';
      case HRZone.fatBurn:
        return 'Quema Grasa';
      case HRZone.cardio:
        return 'Cardio';
      case HRZone.peak:
        return 'Pico Máximo';
    }
  }

  /// Get zone color
  Color get color {
    switch (this) {
      case HRZone.rest:
        return AppColors.zoneRest;
      case HRZone.warmup:
        return AppColors.zoneWarmup;
      case HRZone.fatBurn:
        return AppColors.zoneFatBurn;
      case HRZone.cardio:
        return AppColors.zoneCardio;
      case HRZone.peak:
        return AppColors.zonePeak;
    }
  }
}

/// Utilities for calculating heart rate zones
class HeartRateZones {
  HeartRateZones._();

  /// Calculate maximum heart rate using Tanaka formula
  /// FCMax = 208 - (0.7 × edad)
  static int calculateMaxHeartRate(int age) {
    return (208 - (0.7 * age)).round();
  }

  /// Get heart rate zone for a given BPM and age
  static HRZone getZoneForBPM(int bpm, int age) {
    final maxHR = calculateMaxHeartRate(age);
    final percentage = bpm / maxHR;

    if (percentage < AppConstants.zoneRestMax) {
      return HRZone.rest;
    } else if (percentage < AppConstants.zoneWarmupMax) {
      return HRZone.warmup;
    } else if (percentage < AppConstants.zoneFatBurnMax) {
      return HRZone.fatBurn;
    } else if (percentage < AppConstants.zoneCardioMax) {
      return HRZone.cardio;
    } else {
      return HRZone.peak;
    }
  }

  /// Get target BPM range for a zone
  static (int min, int max) getZoneRange(HRZone zone, int age) {
    final maxHR = calculateMaxHeartRate(age);
    
    switch (zone) {
      case HRZone.rest:
        return (0, (maxHR * AppConstants.zoneRestMax).round());
      case HRZone.warmup:
        return (
          (maxHR * AppConstants.zoneWarmupMin).round(),
          (maxHR * AppConstants.zoneWarmupMax).round(),
        );
      case HRZone.fatBurn:
        return (
          (maxHR * AppConstants.zoneFatBurnMin).round(),
          (maxHR * AppConstants.zoneFatBurnMax).round(),
        );
      case HRZone.cardio:
        return (
          (maxHR * AppConstants.zoneCardioMin).round(),
          (maxHR * AppConstants.zoneCardioMax).round(),
        );
      case HRZone.peak:
        return (
          (maxHR * AppConstants.zonePeakMin).round(),
          maxHR,
        );
    }
  }
}
