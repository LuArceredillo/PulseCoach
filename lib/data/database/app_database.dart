import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

/// Table for training sessions
class TrainingSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get missionId => integer()();
  IntColumn get userAge => integer()();
  IntColumn get avgHeartRate => integer().nullable()();
  IntColumn get maxHeartRate => integer().nullable()();
  RealColumn get caloriesBurned => real().nullable()();
  
  // Time in zones
  IntColumn get timeInZoneRest => integer().withDefault(const Constant(0))();
  IntColumn get timeInZoneWarmup => integer().withDefault(const Constant(0))();
  IntColumn get timeInZoneFat => integer().withDefault(const Constant(0))();
  IntColumn get timeInZoneCardio => integer().withDefault(const Constant(0))();
  IntColumn get timeInZonePeak => integer().withDefault(const Constant(0))();
  
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

/// Table for heart rate readings
class HeartRateReadings extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get bpm => integer()();
  IntColumn get sessionId => integer().references(TrainingSessions, #id)();
}

@DriftDatabase(tables: [TrainingSessions, HeartRateReadings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Simple singleton pattern or use a Provider
  static AppDatabase? _instance;
  static AppDatabase get instance => _instance ??= AppDatabase();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
