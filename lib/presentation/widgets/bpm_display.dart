import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/text_styles.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/heart_rate_zones.dart';

/// Large BPM display widget with zone-based coloring
class BpmDisplay extends StatelessWidget {
  final int? bpm;
  final HRZone? zone;

  const BpmDisplay({
    super.key,
    required this.bpm,
    this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final color = zone?.color ?? AppColors.textSecondary;
    final displayBpm = bpm ?? 0;
    final zoneName = zone?.displayName ?? 'Sin señal';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Pulsing indicator
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        )
            .animate(onPlay: (controller) => controller.repeat())
            .scale(
              begin: const Offset(1.0, 1.0),
              end: const Offset(1.3, 1.3),
              duration: const Duration(milliseconds: 500),
            )
            .then()
            .scale(
              begin: const Offset(1.3, 1.3),
              end: const Offset(1.0, 1.0),
              duration: const Duration(milliseconds: 500),
            ),
        const SizedBox(height: 16),
        
        // BPM value
        Text(
          displayBpm.toString(),
          style: AppTextStyles.bpmDisplay.copyWith(color: color),
        ),
        
        // BPM label
        const Text(
          'BPM',
          style: AppTextStyles.bpmLabel,
        ),
        
        const SizedBox(height: 8),
        
        // Zone name
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color, width: 2),
          ),
          child: Text(
            zoneName,
            style: AppTextStyles.zoneLabel.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
