# PulseCoach

**PulseCoach** es una aplicación Flutter completa que se conecta a bandas de frecuencia cardíaca Polar vía BLE (Bluetooth Low Energy) para guiar a usuarios principiantes en entrenamientos de intervalos tipo CACO (Caminar-Correr).

## 🎯 Características

- **Conectividad BLE**: Conexión automática a dispositivos Polar (H9, H10, OH1, Verity Sense)
- **Monitoreo en Tiempo Real**: Visualización de frecuencia cardíaca con zonas cardíacas codificadas por color
- **Entrenamientos CACO**: 3 misiones predefinidas de intervalos caminar-correr
- **Coaching por Voz**: Instrucciones de voz en español mediante TTS
- **Historial de Entrenamientos**: Almacenamiento local con Drift (SQLite)
- **Interfaz Dark Mode**: Diseño optimizado con tema oscuro y colores Polar

## 📱 Pantallas

### 1. Dashboard
- Estado de conexión BLE con indicador visual
- Nivel de batería de la banda Polar
- Frase motivacional
- Acceso rápido a misiones

### 2. Selector de Misiones
- Lista de 3 misiones CACO predefinidas
- Información de duración y descripción de cada misión

### 3. Consola de Entrenamiento
- Visualización gigante de BPM con color según zona cardíaca
- Cronómetro circular con progreso visual
- Barra de progreso segmentada por fases
- Controles de pausa/reanudar
- Pantalla de finalización con métricas

## 🚀 Instalación

### Requisitos Previos
- Flutter SDK 3.0.0 o superior
- Dart SDK 3.0.0 o superior
- Android Studio / Xcode (para desarrollo móvil)

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/LuArceredillo/PulseCoach.git
cd PulseCoach
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Generar código de Drift**
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. **Ejecutar la aplicación**
```bash
flutter run
```

## 📦 Dependencias Principales

- **flutter_riverpod**: Gestión de estado
- **flutter_blue_plus**: Conectividad Bluetooth Low Energy
- **drift**: Base de datos local SQLite (ORM type-safe)
- **flutter_tts**: Text-to-Speech para coaching por voz
- **flutter_animate**: Animaciones fluidas
- **permission_handler**: Manejo de permisos

## 🎨 Diseño

### Paleta de Colores
- **Fondo Dark Mode**: `#121212`
- **Rojo Polar**: `#E31A21` (intensidad)
- **Verde Neón**: `#ADFF2F` (zonas seguras)

### Tipografía
- **Fuente Orbitron**: Para elementos digitales y numéricos (BPM, cronómetros)
- **Fuente Sistema**: Para texto general

## 🔧 Arquitectura

El proyecto sigue una arquitectura limpia (Clean Architecture) con las siguientes capas:

```
lib/
├── core/              # Constantes, temas, utilidades
├── data/              # Modelos, repositorios, database
├── domain/            # Entidades y servicios
└── presentation/      # Providers, pantallas, widgets
```

## 🏃 Misiones CACO

### Misión 1 - Iniciación
- 4 ciclos de: 3min caminar + 1min trotar
- Duración total: 16 minutos
- Zona objetivo: Calentamiento / Quema Grasa

### Misión 2 - Progresión
- 5 ciclos de: 2min caminar + 2min trotar
- Duración total: 20 minutos
- Zona objetivo: Calentamiento / Cardio

### Misión 3 - Desafío
- 6 ciclos de: 1min caminar + 2min correr
- Duración total: 18 minutos
- Zona objetivo: Cardio / Pico

## 💓 Zonas Cardíacas

Basadas en la fórmula de Tanaka: `FCMax = 208 - (0.7 × edad)`

1. **Zona Reposo** (< 60% FCMax) - Color Gris
2. **Zona Calentamiento** (60-70% FCMax) - Color Azul
3. **Zona Quema Grasa** (70-80% FCMax) - Color Verde
4. **Zona Cardio** (80-90% FCMax) - Color Amarillo
5. **Zona Pico** (90-100% FCMax) - Color Rojo

## 🔐 Permisos

### Android
Se requieren los siguientes permisos en `AndroidManifest.xml`:
- `BLUETOOTH`
- `BLUETOOTH_ADMIN`
- `BLUETOOTH_SCAN`
- `BLUETOOTH_CONNECT`
- `ACCESS_FINE_LOCATION`

### iOS
Se requieren las siguientes descripciones en `Info.plist`:
- `NSBluetoothAlwaysUsageDescription`
- `NSBluetoothPeripheralUsageDescription`

## 🧪 Modo de Prueba

La aplicación incluye un **modo mock** que simula:
- Conexión BLE instantánea
- BPM aleatorio entre 60-140
- Nivel de batería al 85%

Este modo permite desarrollar y probar sin hardware físico.

## 📱 Compatibilidad

- **Android**: 6.0 (API 23) o superior
- **iOS**: 13.0 o superior

### Dispositivos Soportados
- Polar H9
- Polar H10
- Polar OH1
- Polar Verity Sense

## 🤝 Contribución

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo LICENSE para más detalles.

## 👨‍💻 Autor

**LuArceredillo**

## 🙏 Agradecimientos

- Google Fonts por la fuente Orbitron
- Polar por la documentación de su BLE SDK
- La comunidad de Flutter por los excelentes paquetes

---

**Nota**: Este es un proyecto de demostración. Para uso en producción, se recomienda agregar:
- Autenticación de usuarios
- Sincronización en la nube
- Análisis detallado de métricas
- Personalización de planes de entrenamiento
- Integración con wearables adicionales
