import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/constants/text_styles.dart';
import '../../core/constants/colors.dart';
import '../../data/models/mission.dart';

/// Circular timer widget with progress arc
class CircularTimer extends StatelessWidget {
  final int remainingSeconds;
  final int totalSeconds;
  final PhaseType phaseType;

  const CircularTimer({
    Key? key,
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.phaseType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = totalSeconds > 0 ? 1.0 - (remainingSeconds / totalSeconds) : 0.0;
    final color = phaseType == PhaseType.walk ? AppColors.phaseWalk : AppColors.phaseRun;
    
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    final timeString = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          CustomPaint(
            size: const Size(280, 280),
            painter: _CircularTimerPainter(
              progress: progress,
              color: color,
            ),
          ),
          
          // Time and phase info
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                timeString,
                style: AppTextStyles.timerDisplay.copyWith(color: color),
              ),
              const SizedBox(height: 8),
              Text(
                phaseType.displayName,
                style: AppTextStyles.zoneLabel.copyWith(color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Custom painter for circular progress
class _CircularTimerPainter extends CustomPainter {
  final double progress;
  final Color color;

  _CircularTimerPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Background arc
    final backgroundPaint = Paint()
      ..color = Colors.white12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2; // Start at top
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularTimerPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
