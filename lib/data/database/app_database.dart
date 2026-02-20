import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// Training sessions table
class TrainingSessionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get missionId => integer()();
  IntColumn get userAge => integer()();
  IntColumn get avgHeartRate => integer().nullable()();
  IntColumn get maxHeartRate => integer().nullable()();
  RealColumn get caloriesBurned => real().nullable()();
  IntColumn get timeInZoneRest => integer().withDefault(const Constant(0))();
  IntColumn get timeInZoneWarmup => integer().withDefault(const Constant(0))();
  IntColumn get timeInZoneFat => integer().withDefault(const Constant(0))();
  IntColumn get timeInZoneCardio => integer().withDefault(const Constant(0))();
  IntColumn get timeInZonePeak => integer().withDefault(const Constant(0))();
  BoolColumn get completed =>
      boolean().withDefault(const Constant(false))();

  @override
  String get tableName => 'training_sessions';
}

/// Heart rate readings table
class HeartRateReadingsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get bpm => integer()();
  IntColumn get sessionId => integer().references(TrainingSessionsTable, #id)();

  @override
  String get tableName => 'heart_rate_readings';
}

/// App settings table (single-row settings)
class AppSettingsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get demoModeEnabled =>
      boolean().withDefault(const Constant(false))();

  @override
  String get tableName => 'app_settings';
}

@DriftDatabase(
    tables: [TrainingSessionsTable, HeartRateReadingsTable, AppSettingsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pulsecoach.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
