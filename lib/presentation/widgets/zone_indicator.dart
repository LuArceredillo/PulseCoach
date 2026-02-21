import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/heart_rate_zones.dart';

/// Widget to display current heart rate zone
class ZoneIndicator extends StatelessWidget {
  final HRZone? currentZone;
  final int age;

  const ZoneIndicator({
    super.key,
    required this.currentZone,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Zonas Cardíacas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        ...HRZone.values.map((zone) => _buildZoneRow(zone)),
      ],
    );
  }

  Widget _buildZoneRow(HRZone zone) {
    final isActive = zone == currentZone;
    final (min, max) = HeartRateZones.getZoneRange(zone, age);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? zone.color.withValues(alpha: 0.2) : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive ? zone.color : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: zone.color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              zone.displayName,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            '$min-$max',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
