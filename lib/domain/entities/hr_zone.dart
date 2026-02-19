import 'package:flutter/material.dart';
import '../../core/utils/heart_rate_zones.dart';

/// Entity representing a heart rate zone with additional metadata
class HRZoneEntity {
  final HRZone zone;
  final int minBpm;
  final int maxBpm;
  final String name;
  final Color color;

  const HRZoneEntity({
    required this.zone,
    required this.minBpm,
    required this.maxBpm,
    required this.name,
    required this.color,
  });

  /// Create from zone and age
  factory HRZoneEntity.fromZone(HRZone zone, int age) {
    final (min, max) = HeartRateZones.getZoneRange(zone, age);
    return HRZoneEntity(
      zone: zone,
      minBpm: min,
      maxBpm: max,
      name: zone.name,
      color: zone.color,
    );
  }

  /// Get range string
  String get rangeString => '$minBpm - $maxBpm BPM';
}
