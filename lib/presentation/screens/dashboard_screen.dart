import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/app_constants.dart';
import '../providers/ble_provider.dart';
import '../providers/missions_provider.dart';
import 'missions_screen.dart';

/// Dashboard home screen
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Auto-connect on startup (using mock data for now)
    Future.microtask(() {
      ref.read(bluetoothServiceProvider).connectToDevice(useMockData: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectionStatusProvider);
    final batteryLevel = ref.watch(batteryLevelProvider);
    final heartRate = ref.watch(heartRateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PulseCoach'),
        actions: [
          // Connection status indicator
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isConnected.value == true 
                      ? AppColors.neonGreen.withOpacity(0.2)
                      : AppColors.polarRed.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isConnected.value == true 
                        ? AppColors.neonGreen
                        : AppColors.polarRed,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isConnected.value == true 
                            ? AppColors.neonGreen
                            : AppColors.polarRed,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isConnected.value == true ? 'Conectado' : 'Desconectado',
                      style: TextStyle(
                        color: isConnected.value == true 
                            ? AppColors.neonGreen
                            : AppColors.polarRed,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Connection status card
            _buildConnectionCard(isConnected.value, batteryLevel.value, heartRate.value),
            
            const SizedBox(height: 24),
            
            // Motivational quote
            _buildMotivationalCard(),
            
            const SizedBox(height: 24),
            
            // Quick access to missions
            _buildQuickAccessCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionCard(bool? isConnected, int? battery, int? hr) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.bluetooth,
                  color: isConnected == true ? AppColors.neonGreen : AppColors.textSecondary,
                  size: 32,
                ),
                const SizedBox(width: 12),
                const Text(
                  'Banda Polar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            if (isConnected == true) ...[
              // Battery level
              Row(
                children: [
                  const Icon(Icons.battery_std, color: AppColors.textSecondary),
                  const SizedBox(width: 8),
                  Text(
                    'Batería: ${battery ?? '--'}%',
                    style: const TextStyle(color: AppColors.textPrimary),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Current heart rate
              Row(
                children: [
                  const Icon(Icons.favorite, color: AppColors.polarRed),
                  const SizedBox(width: 8),
                  Text(
                    'FC Actual: ${hr ?? '--'} BPM',
                    style: const TextStyle(color: AppColors.textPrimary),
                  ),
                ],
              ),
            ] else ...[
              Text(
                'No hay dispositivo conectado',
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(bluetoothServiceProvider).connectToDevice(useMockData: true);
                },
                icon: const Icon(Icons.bluetooth_searching),
                label: const Text('Buscar dispositivo'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMotivationalCard() {
    return Card(
      color: AppColors.polarRed.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            const Icon(
              Icons.emoji_events,
              color: AppColors.neonGreen,
              size: 48,
            ),
            const SizedBox(height: 12),
            const Text(
              '¡Hoy es un gran día para entrenar!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cada paso cuenta hacia tu objetivo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Entrenamientos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MissionsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow),
                  SizedBox(width: 8),
                  Text('Iniciar Misión CACO', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
