import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/session_repository.dart';
import '../../presentation/providers/training_provider.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/heart_rate_zones.dart';
import 'package:intl/intl.dart';

class HistoryDetailScreen extends ConsumerWidget {
  final TrainingSession session;

  const HistoryDetailScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readingsAsync = ref.watch(sessionReadingsProvider(session.id));
    final duration = session.endTime != null 
        ? session.endTime!.difference(session.startTime).inMinutes 
        : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Entrenamiento'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSummaryCard(duration),
            const SizedBox(height: 24),
            _buildZonesCard(),
            const SizedBox(height: 24),
            const Text(
              'Gráfico de Frecuencia Cardíaca',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: readingsAsync.when(
                data: (readings) => _buildSimpleChart(readings),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(int duration) {
    final dateStr = DateFormat('EEEE d MMMM, yyyy').format(session.startTime);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            Text(dateStr, style: const TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMetric('DURACIÓN', '$duration', 'MIN'),
                _buildMetric('FC MEDIA', '${session.avgHeartRate}', 'BPM'),
                _buildMetric('CALORÍAS', '${session.caloriesBurned?.toInt()}', 'KCAL'),
              ],
            ),
            const Divider(height: 32),
            _buildMetric('FC MÁXIMA', '${session.maxHeartRate}', 'BPM'),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value, String unit) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.neonGreen),
            ),
            const SizedBox(width: 2),
            Text(unit, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          ],
        ),
      ],
    );
  }

  Widget _buildZonesCard() {
    final total = (session.timeInZoneRest ?? 0) + 
                  (session.timeInZoneWarmup ?? 0) + 
                  (session.timeInZoneFat ?? 0) + 
                  (session.timeInZoneCardio ?? 0) + 
                  (session.timeInZonePeak ?? 0);
    
    if (total == 0) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tiempo en Zonas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildZoneBar('Pico', session.timeInZonePeak ?? 0, total, AppColors.zonePeak),
            _buildZoneBar('Cardio', session.timeInZoneCardio ?? 0, total, AppColors.zoneCardio),
            _buildZoneBar('Quema Grasa', session.timeInZoneFat ?? 0, total, AppColors.zoneFatBurn),
            _buildZoneBar('Calentamiento', session.timeInZoneWarmup ?? 0, total, AppColors.zoneWarmup),
            _buildZoneBar('Reposo', session.timeInZoneRest ?? 0, total, AppColors.zoneRest),
          ],
        ),
      ),
    );
  }

  Widget _buildZoneBar(String label, int value, int total, Color color) {
    final percentage = value / total;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 12)),
              Text('${(percentage * 100).toStringAsFixed(1)}%', style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: color.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleChart(List<HeartRateReading> readings) {
    if (readings.isEmpty) return const Center(child: Text('Sin datos de FC'));
    
    return CustomPaint(
      painter: _PulseChartPainter(readings),
      size: Size.infinite,
    );
  }
}

class _PulseChartPainter extends CustomPainter {
  final List<HeartRateReading> readings;
  _PulseChartPainter(this.readings);

  @override
  void paint(Canvas canvas, Size size) {
    if (readings.isEmpty) return;

    final paint = Paint()
      ..color = AppColors.neonGreen
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final maxBpm = readings.map((r) => r.bpm).reduce((a, b) => a > b ? a : b).toDouble();
    final minBpm = readings.map((r) => r.bpm).reduce((a, b) => a < b ? a : b).toDouble();
    final range = (maxBpm - minBpm).clamp(20.0, 200.0);

    for (var i = 0; i < readings.length; i++) {
      final x = (i / (readings.length - 1)) * size.width;
      final y = size.height - ((readings[i].bpm - minBpm + 10) / (range + 20)) * size.height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
    
    // Fill background
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.neonGreen.withOpacity(0.3), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

final sessionReadingsProvider = FutureProvider.family<List<HeartRateReading>, int>((ref, sessionId) async {
  final repository = ref.watch(sessionRepositoryProvider);
  return repository.getReadingsForSession(sessionId);
});
