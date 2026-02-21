import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import '../../core/utils/heart_rate_zones.dart';
import '../../data/models/mission.dart';

class TrainingHeroDisplay extends StatelessWidget {
  final int bpm;
  final HRZone zone;
  final int remainingSeconds;
  final int totalSeconds;
  final PhaseType phaseType;

  const TrainingHeroDisplay({
    super.key,
    required this.bpm,
    required this.zone,
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.phaseType,
  });

  @override
  Widget build(BuildContext context) {
    final color = zone.color;
    final progress = totalSeconds > 0 ? (totalSeconds - remainingSeconds) / totalSeconds : 0.0;
    
    // Format mm:ss
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    final timeStr = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer progress circle (Phase progress)
          SizedBox(
            width: 320,
            height: 320,
            child: CustomPaint(
              painter: _ProgressCirclePainter(
                progress: progress,
                color: color,
                phaseType: phaseType,
              ),
            ),
          ),
          
          // Inner content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                phaseType == PhaseType.walk ? 'CAMINAR' : 'CORRER',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                  color: color.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                bpm.toString(),
                style: AppTextStyles.bpmDisplay.copyWith(
                  fontSize: 110, // Even bigger as requested
                  color: color,
                  height: 1.0,
                ),
              ),
              const Text(
                'BPM',
                style: AppTextStyles.bpmLabel,
              ),
              const SizedBox(height: 16),
              Text(
                timeStr,
                style: AppTextStyles.timerDisplay.copyWith(
                  fontSize: 32,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressCirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final PhaseType phaseType;

  _ProgressCirclePainter({
    required this.progress,
    required this.color,
    required this.phaseType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 15.0;

    // Background circle
    final bgPaint = Paint()
      ..color = AppColors.textSecondary.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius - strokeWidth / 2, bgPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius - strokeWidth / 2);
    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);

    // Add glowing dots or markers at key points?
    // Let's keep it clean but premium.
  }

  @override
  bool shouldRepaint(covariant _ProgressCirclePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
