# PulseCoach - Quick Start Guide

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio or Xcode for mobile development

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/LuArceredillo/PulseCoach.git
   cd PulseCoach
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Isar database code** (optional - already included)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For specific device
   flutter devices  # List available devices
   flutter run -d <device_id>
   ```

## 📱 App Flow

### First Launch
```
App Start
   ↓
Dashboard Screen
   ├─ Auto-connects to Polar (mock mode enabled)
   ├─ Shows connection status
   ├─ Displays current heart rate
   └─ "Iniciar Misión CACO" button
```

### Starting a Mission
```
Dashboard → Tap "Iniciar Misión CACO"
   ↓
Missions Screen
   ├─ Misión 1: Iniciación (16 min)
   ├─ Misión 2: Progresión (20 min)
   └─ Misión 3: Desafío (18 min)
   ↓ (Select a mission)
Training Console
   ├─ Large BPM display with zone color
   ├─ Circular countdown timer
   ├─ Phase progress bar
   ├─ Pause/Resume button
   └─ Zone indicator list
   ↓ (Mission completes)
Completion Screen
   ├─ Statistics (duration, avg HR, max HR)
   └─ "Finalizar" button → Back to Dashboard
```

## 🎮 Using Mock Mode

The app automatically starts in **mock mode** (no physical Polar device needed):
- Simulates BLE connection
- Generates random heart rate (60-140 BPM)
- Updates every second
- Battery level fixed at 85%

This allows you to test all features without hardware!

## 🎨 UI Features to Explore

### Dashboard Screen
- **Connection Badge**: Green when connected, red when disconnected
- **Battery Icon**: Shows Polar device battery level
- **Heart Rate**: Real-time BPM display
- **Motivational Card**: Encouragement message
- **Start Button**: Launch mission selector

### Missions Screen
- **Mission Cards**: 3 cards with mission details
- **Duration Badge**: Shows total workout time
- **Runner Icon**: Visual indicator
- **Tap to Select**: Choose your mission

### Training Console
- **BPM Display**: 
  - Large 96px Orbitron font
  - Pulsing indicator dot
  - Color changes by zone
  - Zone name badge
  
- **Circular Timer**:
  - MM:SS countdown
  - Circular progress arc
  - Phase type label (CAMINAR/CORRER)
  - Green for walk, red for run
  
- **Progress Bar**:
  - Segmented by phases
  - Current phase highlighted
  - Completed phases in green
  - Pending phases in gray
  
- **Zone List**:
  - All 5 zones displayed
  - Current zone highlighted
  - BPM range for your age

## 🎯 Testing the App

### Test Scenarios

1. **Test Mission 1** (Shortest - 16 min)
   - Start mission
   - Observe BPM changes
   - Listen to TTS announcements
   - Watch phase transitions
   - Pause and resume
   - Complete mission

2. **Test Pause/Resume**
   - Start any mission
   - Tap "Pausar"
   - Verify timer stops
   - Tap "Reanudar"
   - Verify timer continues

3. **Test Back Navigation**
   - Start a mission
   - Press back button
   - Confirm cancellation dialog
   - Choose "Sí" to exit

4. **Test Zone Changes**
   - Watch BPM display
   - Observe color changes:
     - Gray (< 60% max HR)
     - Blue (60-70%)
     - Green (70-80%)
     - Yellow (80-90%)
     - Red (90-100%)

## 🔊 Audio Features

The app announces (in Spanish):
- **Phase Start**: "Empieza a [caminar/correr] ahora, mantente en zona [color]"
- **Mission Complete**: "¡Misión completada! Excelente trabajo"

Volume is at 100%, speed at 0.5 (clear and understandable).

## 📊 Heart Rate Zones Explained

Based on age 30 (default):
- **FCMax** = 208 - (0.7 × 30) = 187 BPM

| Zone | Name | BPM Range | % of Max | Color |
|------|------|-----------|----------|-------|
| 1 | Reposo | 0-112 | <60% | Gray |
| 2 | Calentamiento | 112-131 | 60-70% | Blue |
| 3 | Quema Grasa | 131-150 | 70-80% | Green |
| 4 | Cardio | 150-168 | 80-90% | Yellow |
| 5 | Pico Máximo | 168-187 | 90-100% | Red |

## 🎨 Color Scheme

- **Background**: #121212 (Dark gray)
- **Polar Red**: #E31A21 (Accent, intensity)
- **Neon Green**: #ADFF2F (Safety, success)
- **Text Primary**: White
- **Text Secondary**: White 70%
- **Cards**: #1E1E1E (Slightly lighter than background)

## 🗂️ Data Storage

All completed missions are saved in the Isar database:
- Mission ID and duration
- Average and maximum heart rate
- Calories burned (estimated)
- Time spent in each zone
- Individual BPM readings every second

(Note: No UI yet to view history, but data is stored for future features)

## 🐛 Troubleshooting

### App won't compile
- Run `flutter clean`
- Run `flutter pub get`
- Ensure Flutter SDK is updated: `flutter upgrade`

### No heart rate showing
- App is in mock mode by default
- Heart rate updates every second (random 60-140)
- Check Dashboard for connection status

### TTS not working
- Check device volume
- Ensure TTS engine is available on device
- Android: Google TTS should be installed
- iOS: Built-in TTS should work

## 📝 Next Steps

### For Development
1. Test with a real Polar device:
   - Modify `dashboard_screen.dart` line 24
   - Change `useMockData: true` to `useMockData: false`
   - Ensure Bluetooth is on
   - Place Polar device nearby

2. Add user profile:
   - Create age input screen
   - Store in local storage
   - Update heart rate calculations

3. Add history view:
   - Create new screen
   - Query Isar database
   - Display past sessions

### For Production
- Add proper error handling
- Implement permission requests
- Add app icons
- Test on physical devices
- Submit to stores

## 🎉 Enjoy Your Workout!

PulseCoach is ready to guide you through interval training. Whether you're testing with mock data or connected to a real Polar device, the app provides:

✅ Real-time heart rate monitoring  
✅ Zone-based guidance  
✅ Voice coaching  
✅ Progress tracking  
✅ Mission-based training  

Happy training! 🏃‍♂️💪
