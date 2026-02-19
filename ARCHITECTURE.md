# PulseCoach Architecture Documentation

## Overview
PulseCoach is a Flutter mobile application designed to help beginner runners with interval training (CACO - Walk-Run method) using Polar heart rate monitors via Bluetooth Low Energy.

## Technology Stack
- **Framework**: Flutter 3.0+
- **State Management**: Riverpod 2.4+
- **Database**: Isar 3.1.0+ (NoSQL local database)
- **BLE**: flutter_blue_plus 1.31.0
- **TTS**: flutter_tts 4.0.0
- **Animations**: flutter_animate 4.5.0

## Architecture

### Clean Architecture Layers

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (Screens, Widgets, Providers)          │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│          Domain Layer                   │
│  (Services, Entities, Business Logic)   │
└─────────────────┬───────────────────────┘
                  │
┌─────────────────▼───────────────────────┐
│          Data Layer                     │
│  (Models, Repositories, Database)       │
└─────────────────────────────────────────┘
```

### Directory Structure

```
lib/
├── core/
│   ├── constants/        # App-wide constants (colors, styles, constants)
│   ├── theme/           # Dark theme configuration
│   └── utils/           # Utility classes (heart rate zones, audio coach)
├── data/
│   ├── models/          # Isar database models + Mission model
│   ├── repositories/    # Data access layer (BLE, Sessions)
│   └── database/        # Isar service
├── domain/
│   ├── entities/        # Business entities (HR Zone)
│   └── services/        # Business logic services (Bluetooth, TTS)
└── presentation/
    ├── providers/       # Riverpod state providers
    ├── screens/         # UI screens (Dashboard, Missions, Training Console)
    └── widgets/         # Reusable widgets (BPM display, Circular timer, etc.)
```

## Key Features

### 1. Bluetooth Low Energy (BLE) Integration
- **Auto-connection** to Polar devices
- **Real-time heart rate monitoring** via BLE Heart Rate Service (UUID: 0x180D)
- **Battery level reading** from BLE Battery Service (UUID: 0x180F)
- **Automatic reconnection** on disconnect
- **Mock mode** for development without physical device

### 2. Heart Rate Zones
Based on **Tanaka Formula**: `FCMax = 208 - (0.7 × age)`

- **Zone 1 (Rest)**: < 60% FCMax - Gray
- **Zone 2 (Warmup)**: 60-70% FCMax - Blue
- **Zone 3 (Fat Burn)**: 70-80% FCMax - Green
- **Zone 4 (Cardio)**: 80-90% FCMax - Yellow
- **Zone 5 (Peak)**: 90-100% FCMax - Red

### 3. CACO Training Missions

#### Mission 1 - Initiación (16 min)
- 4 cycles: 3min walk + 1min jog
- Target zones: Warmup / Fat Burn

#### Mission 2 - Progresión (20 min)
- 5 cycles: 2min walk + 2min jog
- Target zones: Warmup / Cardio

#### Mission 3 - Desafío (18 min)
- 6 cycles: 1min walk + 2min run
- Target zones: Cardio / Peak

### 4. Voice Coaching (TTS)
- **Spanish language** instructions
- Phase change announcements
- Mission completion celebration
- Zone warnings (optional)

### 5. Local Data Persistence
Using **Isar** NoSQL database:
- **TrainingSession**: Stores completed workouts with metrics
- **HeartRateReading**: Individual BPM readings linked to sessions
- Calculates: avg HR, max HR, calories, time in each zone

## State Management

### Riverpod Providers

1. **bleRepositoryProvider** - Singleton BLE repository
2. **bluetoothServiceProvider** - Bluetooth service wrapper
3. **heartRateProvider** - StreamProvider for real-time BPM
4. **batteryLevelProvider** - StreamProvider for battery level
5. **connectionStatusProvider** - StreamProvider for connection status
6. **missionsProvider** - List of available missions
7. **selectedMissionProvider** - Currently selected mission
8. **trainingStateProvider** - Active training session state

## Data Flow

### BLE Heart Rate Monitoring
```
Polar Device → BLE Characteristic (0x2A37)
             ↓
        BleRepository (parse bytes)
             ↓
      BehaviorSubject<int>
             ↓
    StreamProvider (heartRateProvider)
             ↓
       UI Widgets (BPM Display)
```

### Training Session Flow
```
User selects mission → trainingStateProvider
                    ↓
              Timer starts (1s interval)
                    ↓
         Phase progress tracking
                    ↓
    TTS announces phase changes
                    ↓
      HR readings collected
                    ↓
  Mission complete → Save to Isar
```

## UI Components

### Custom Widgets

1. **BpmDisplay**
   - Large Orbitron font (96px)
   - Animated pulsing indicator
   - Zone-based color coding
   - Current zone badge

2. **CircularTimer**
   - CustomPainter circular progress
   - MM:SS countdown display
   - Phase type indicator (CAMINAR/CORRER)
   - Dynamic color (green for walk, red for run)

3. **ZoneIndicator**
   - List of all 5 HR zones
   - Highlights current zone
   - Shows BPM range for user's age

4. **MissionCard**
   - Mission title and description
   - Total duration badge
   - Ripple effect on tap
   - Runner icon

## Performance Considerations

- **BehaviorSubject** for BLE streams (last value replay)
- **Timer.periodic** for training countdown (lightweight)
- **Lazy loading** of Isar database
- **Dispose pattern** for all services and subscriptions

## Testing Strategy

### Mock BLE Service
The app includes a mock mode that:
- Simulates instant connection
- Generates random BPM (60-140)
- Fixed battery level (85%)
- Allows UI/UX testing without hardware

## Security & Permissions

### Android
- BLUETOOTH, BLUETOOTH_ADMIN
- BLUETOOTH_SCAN, BLUETOOTH_CONNECT (Android 12+)
- ACCESS_FINE_LOCATION (required for BLE scanning)

### iOS
- NSBluetoothAlwaysUsageDescription
- NSBluetoothPeripheralUsageDescription

## Future Enhancements

Potential improvements:
- User authentication and profiles
- Cloud sync of training history
- Custom mission builder
- Social features (challenges, leaderboards)
- Integration with other fitness platforms
- Advanced analytics and charts
- Workout reminders and scheduling
- Multi-language support

## Known Limitations

1. **User Age**: Currently hardcoded to 30 (AppConstants.defaultUserAge)
2. **Calorie Calculation**: Simplified (10 cal/min)
3. **Single User**: No multi-user support
4. **No Export**: No data export functionality yet
5. **Portrait Only**: App locked to portrait orientation

## Contributing

To contribute:
1. Ensure Flutter SDK 3.0+ is installed
2. Run `flutter pub get` to install dependencies
3. Generate Isar code: `flutter pub run build_runner build --delete-conflicting-outputs`
4. Follow the existing architecture patterns
5. Test with mock mode before committing

## Deployment Notes

### Before Release
- [ ] Replace hardcoded user age with user input
- [ ] Add proper error handling for BLE failures
- [ ] Implement proper permission request flow
- [ ] Add onboarding screens
- [ ] Test on real Polar devices (H9, H10, OH1, Verity Sense)
- [ ] Add app icons and splash screens
- [ ] Set up proper signing for Android/iOS
- [ ] Review and optimize for production

---

**Last Updated**: 2024-02-18
**Version**: 1.0.0
