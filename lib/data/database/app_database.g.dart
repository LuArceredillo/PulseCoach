// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TrainingSessionsTableTable extends TrainingSessionsTable
    with TableInfo<$TrainingSessionsTableTable, TrainingSessionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingSessionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _missionIdMeta =
      const VerificationMeta('missionId');
  @override
  late final GeneratedColumn<int> missionId = GeneratedColumn<int>(
      'mission_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userAgeMeta =
      const VerificationMeta('userAge');
  @override
  late final GeneratedColumn<int> userAge = GeneratedColumn<int>(
      'user_age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _avgHeartRateMeta =
      const VerificationMeta('avgHeartRate');
  @override
  late final GeneratedColumn<int> avgHeartRate = GeneratedColumn<int>(
      'avg_heart_rate', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maxHeartRateMeta =
      const VerificationMeta('maxHeartRate');
  @override
  late final GeneratedColumn<int> maxHeartRate = GeneratedColumn<int>(
      'max_heart_rate', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _caloriesBurnedMeta =
      const VerificationMeta('caloriesBurned');
  @override
  late final GeneratedColumn<double> caloriesBurned = GeneratedColumn<double>(
      'calories_burned', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _timeInZoneRestMeta =
      const VerificationMeta('timeInZoneRest');
  @override
  late final GeneratedColumn<int> timeInZoneRest = GeneratedColumn<int>(
      'time_in_zone_rest', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timeInZoneWarmupMeta =
      const VerificationMeta('timeInZoneWarmup');
  @override
  late final GeneratedColumn<int> timeInZoneWarmup = GeneratedColumn<int>(
      'time_in_zone_warmup', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timeInZoneFatMeta =
      const VerificationMeta('timeInZoneFat');
  @override
  late final GeneratedColumn<int> timeInZoneFat = GeneratedColumn<int>(
      'time_in_zone_fat', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timeInZoneCardioMeta =
      const VerificationMeta('timeInZoneCardio');
  @override
  late final GeneratedColumn<int> timeInZoneCardio = GeneratedColumn<int>(
      'time_in_zone_cardio', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _timeInZonePeakMeta =
      const VerificationMeta('timeInZonePeak');
  @override
  late final GeneratedColumn<int> timeInZonePeak = GeneratedColumn<int>(
      'time_in_zone_peak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        startTime,
        endTime,
        missionId,
        userAge,
        avgHeartRate,
        maxHeartRate,
        caloriesBurned,
        timeInZoneRest,
        timeInZoneWarmup,
        timeInZoneFat,
        timeInZoneCardio,
        timeInZonePeak,
        completed
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_sessions';
  @override
  VerificationContext validateIntegrity(
      Insertable<TrainingSessionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('mission_id')) {
      context.handle(_missionIdMeta,
          missionId.isAcceptableOrUnknown(data['mission_id']!, _missionIdMeta));
    } else if (isInserting) {
      context.missing(_missionIdMeta);
    }
    if (data.containsKey('user_age')) {
      context.handle(_userAgeMeta,
          userAge.isAcceptableOrUnknown(data['user_age']!, _userAgeMeta));
    } else if (isInserting) {
      context.missing(_userAgeMeta);
    }
    if (data.containsKey('avg_heart_rate')) {
      context.handle(
          _avgHeartRateMeta,
          avgHeartRate.isAcceptableOrUnknown(
              data['avg_heart_rate']!, _avgHeartRateMeta));
    }
    if (data.containsKey('max_heart_rate')) {
      context.handle(
          _maxHeartRateMeta,
          maxHeartRate.isAcceptableOrUnknown(
              data['max_heart_rate']!, _maxHeartRateMeta));
    }
    if (data.containsKey('calories_burned')) {
      context.handle(
          _caloriesBurnedMeta,
          caloriesBurned.isAcceptableOrUnknown(
              data['calories_burned']!, _caloriesBurnedMeta));
    }
    if (data.containsKey('time_in_zone_rest')) {
      context.handle(
          _timeInZoneRestMeta,
          timeInZoneRest.isAcceptableOrUnknown(
              data['time_in_zone_rest']!, _timeInZoneRestMeta));
    }
    if (data.containsKey('time_in_zone_warmup')) {
      context.handle(
          _timeInZoneWarmupMeta,
          timeInZoneWarmup.isAcceptableOrUnknown(
              data['time_in_zone_warmup']!, _timeInZoneWarmupMeta));
    }
    if (data.containsKey('time_in_zone_fat')) {
      context.handle(
          _timeInZoneFatMeta,
          timeInZoneFat.isAcceptableOrUnknown(
              data['time_in_zone_fat']!, _timeInZoneFatMeta));
    }
    if (data.containsKey('time_in_zone_cardio')) {
      context.handle(
          _timeInZoneCardioMeta,
          timeInZoneCardio.isAcceptableOrUnknown(
              data['time_in_zone_cardio']!, _timeInZoneCardioMeta));
    }
    if (data.containsKey('time_in_zone_peak')) {
      context.handle(
          _timeInZonePeakMeta,
          timeInZonePeak.isAcceptableOrUnknown(
              data['time_in_zone_peak']!, _timeInZonePeakMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingSessionsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingSessionsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      missionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mission_id'])!,
      userAge: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_age'])!,
      avgHeartRate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}avg_heart_rate']),
      maxHeartRate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_heart_rate']),
      caloriesBurned: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}calories_burned']),
      timeInZoneRest: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_in_zone_rest'])!,
      timeInZoneWarmup: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_in_zone_warmup'])!,
      timeInZoneFat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_in_zone_fat'])!,
      timeInZoneCardio: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_in_zone_cardio'])!,
      timeInZonePeak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_in_zone_peak'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
    );
  }

  @override
  $TrainingSessionsTableTable createAlias(String alias) {
    return $TrainingSessionsTableTable(attachedDatabase, alias);
  }
}

class TrainingSessionsTableData extends DataClass
    implements Insertable<TrainingSessionsTableData> {
  final int id;
  final DateTime startTime;
  final DateTime? endTime;
  final int missionId;
  final int userAge;
  final int? avgHeartRate;
  final int? maxHeartRate;
  final double? caloriesBurned;
  final int timeInZoneRest;
  final int timeInZoneWarmup;
  final int timeInZoneFat;
  final int timeInZoneCardio;
  final int timeInZonePeak;
  final bool completed;
  const TrainingSessionsTableData(
      {required this.id,
      required this.startTime,
      this.endTime,
      required this.missionId,
      required this.userAge,
      this.avgHeartRate,
      this.maxHeartRate,
      this.caloriesBurned,
      required this.timeInZoneRest,
      required this.timeInZoneWarmup,
      required this.timeInZoneFat,
      required this.timeInZoneCardio,
      required this.timeInZonePeak,
      required this.completed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['mission_id'] = Variable<int>(missionId);
    map['user_age'] = Variable<int>(userAge);
    if (!nullToAbsent || avgHeartRate != null) {
      map['avg_heart_rate'] = Variable<int>(avgHeartRate);
    }
    if (!nullToAbsent || maxHeartRate != null) {
      map['max_heart_rate'] = Variable<int>(maxHeartRate);
    }
    if (!nullToAbsent || caloriesBurned != null) {
      map['calories_burned'] = Variable<double>(caloriesBurned);
    }
    map['time_in_zone_rest'] = Variable<int>(timeInZoneRest);
    map['time_in_zone_warmup'] = Variable<int>(timeInZoneWarmup);
    map['time_in_zone_fat'] = Variable<int>(timeInZoneFat);
    map['time_in_zone_cardio'] = Variable<int>(timeInZoneCardio);
    map['time_in_zone_peak'] = Variable<int>(timeInZonePeak);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  TrainingSessionsTableCompanion toCompanion(bool nullToAbsent) {
    return TrainingSessionsTableCompanion(
      id: Value(id),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      missionId: Value(missionId),
      userAge: Value(userAge),
      avgHeartRate: avgHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(avgHeartRate),
      maxHeartRate: maxHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(maxHeartRate),
      caloriesBurned: caloriesBurned == null && nullToAbsent
          ? const Value.absent()
          : Value(caloriesBurned),
      timeInZoneRest: Value(timeInZoneRest),
      timeInZoneWarmup: Value(timeInZoneWarmup),
      timeInZoneFat: Value(timeInZoneFat),
      timeInZoneCardio: Value(timeInZoneCardio),
      timeInZonePeak: Value(timeInZonePeak),
      completed: Value(completed),
    );
  }

  factory TrainingSessionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingSessionsTableData(
      id: serializer.fromJson<int>(json['id']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      missionId: serializer.fromJson<int>(json['missionId']),
      userAge: serializer.fromJson<int>(json['userAge']),
      avgHeartRate: serializer.fromJson<int?>(json['avgHeartRate']),
      maxHeartRate: serializer.fromJson<int?>(json['maxHeartRate']),
      caloriesBurned: serializer.fromJson<double?>(json['caloriesBurned']),
      timeInZoneRest: serializer.fromJson<int>(json['timeInZoneRest']),
      timeInZoneWarmup: serializer.fromJson<int>(json['timeInZoneWarmup']),
      timeInZoneFat: serializer.fromJson<int>(json['timeInZoneFat']),
      timeInZoneCardio: serializer.fromJson<int>(json['timeInZoneCardio']),
      timeInZonePeak: serializer.fromJson<int>(json['timeInZonePeak']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'missionId': serializer.toJson<int>(missionId),
      'userAge': serializer.toJson<int>(userAge),
      'avgHeartRate': serializer.toJson<int?>(avgHeartRate),
      'maxHeartRate': serializer.toJson<int?>(maxHeartRate),
      'caloriesBurned': serializer.toJson<double?>(caloriesBurned),
      'timeInZoneRest': serializer.toJson<int>(timeInZoneRest),
      'timeInZoneWarmup': serializer.toJson<int>(timeInZoneWarmup),
      'timeInZoneFat': serializer.toJson<int>(timeInZoneFat),
      'timeInZoneCardio': serializer.toJson<int>(timeInZoneCardio),
      'timeInZonePeak': serializer.toJson<int>(timeInZonePeak),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  TrainingSessionsTableData copyWith(
          {int? id,
          DateTime? startTime,
          Value<DateTime?> endTime = const Value.absent(),
          int? missionId,
          int? userAge,
          Value<int?> avgHeartRate = const Value.absent(),
          Value<int?> maxHeartRate = const Value.absent(),
          Value<double?> caloriesBurned = const Value.absent(),
          int? timeInZoneRest,
          int? timeInZoneWarmup,
          int? timeInZoneFat,
          int? timeInZoneCardio,
          int? timeInZonePeak,
          bool? completed}) =>
      TrainingSessionsTableData(
        id: id ?? this.id,
        startTime: startTime ?? this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        missionId: missionId ?? this.missionId,
        userAge: userAge ?? this.userAge,
        avgHeartRate:
            avgHeartRate.present ? avgHeartRate.value : this.avgHeartRate,
        maxHeartRate:
            maxHeartRate.present ? maxHeartRate.value : this.maxHeartRate,
        caloriesBurned:
            caloriesBurned.present ? caloriesBurned.value : this.caloriesBurned,
        timeInZoneRest: timeInZoneRest ?? this.timeInZoneRest,
        timeInZoneWarmup: timeInZoneWarmup ?? this.timeInZoneWarmup,
        timeInZoneFat: timeInZoneFat ?? this.timeInZoneFat,
        timeInZoneCardio: timeInZoneCardio ?? this.timeInZoneCardio,
        timeInZonePeak: timeInZonePeak ?? this.timeInZonePeak,
        completed: completed ?? this.completed,
      );
  TrainingSessionsTableData copyWithCompanion(
      TrainingSessionsTableCompanion data) {
    return TrainingSessionsTableData(
      id: data.id.present ? data.id.value : this.id,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      missionId: data.missionId.present ? data.missionId.value : this.missionId,
      userAge: data.userAge.present ? data.userAge.value : this.userAge,
      avgHeartRate: data.avgHeartRate.present
          ? data.avgHeartRate.value
          : this.avgHeartRate,
      maxHeartRate: data.maxHeartRate.present
          ? data.maxHeartRate.value
          : this.maxHeartRate,
      caloriesBurned: data.caloriesBurned.present
          ? data.caloriesBurned.value
          : this.caloriesBurned,
      timeInZoneRest: data.timeInZoneRest.present
          ? data.timeInZoneRest.value
          : this.timeInZoneRest,
      timeInZoneWarmup: data.timeInZoneWarmup.present
          ? data.timeInZoneWarmup.value
          : this.timeInZoneWarmup,
      timeInZoneFat: data.timeInZoneFat.present
          ? data.timeInZoneFat.value
          : this.timeInZoneFat,
      timeInZoneCardio: data.timeInZoneCardio.present
          ? data.timeInZoneCardio.value
          : this.timeInZoneCardio,
      timeInZonePeak: data.timeInZonePeak.present
          ? data.timeInZonePeak.value
          : this.timeInZonePeak,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingSessionsTableData(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('missionId: $missionId, ')
          ..write('userAge: $userAge, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write('maxHeartRate: $maxHeartRate, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('timeInZoneRest: $timeInZoneRest, ')
          ..write('timeInZoneWarmup: $timeInZoneWarmup, ')
          ..write('timeInZoneFat: $timeInZoneFat, ')
          ..write('timeInZoneCardio: $timeInZoneCardio, ')
          ..write('timeInZonePeak: $timeInZonePeak, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      startTime,
      endTime,
      missionId,
      userAge,
      avgHeartRate,
      maxHeartRate,
      caloriesBurned,
      timeInZoneRest,
      timeInZoneWarmup,
      timeInZoneFat,
      timeInZoneCardio,
      timeInZonePeak,
      completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingSessionsTableData &&
          other.id == this.id &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.missionId == this.missionId &&
          other.userAge == this.userAge &&
          other.avgHeartRate == this.avgHeartRate &&
          other.maxHeartRate == this.maxHeartRate &&
          other.caloriesBurned == this.caloriesBurned &&
          other.timeInZoneRest == this.timeInZoneRest &&
          other.timeInZoneWarmup == this.timeInZoneWarmup &&
          other.timeInZoneFat == this.timeInZoneFat &&
          other.timeInZoneCardio == this.timeInZoneCardio &&
          other.timeInZonePeak == this.timeInZonePeak &&
          other.completed == this.completed);
}

class TrainingSessionsTableCompanion
    extends UpdateCompanion<TrainingSessionsTableData> {
  final Value<int> id;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<int> missionId;
  final Value<int> userAge;
  final Value<int?> avgHeartRate;
  final Value<int?> maxHeartRate;
  final Value<double?> caloriesBurned;
  final Value<int> timeInZoneRest;
  final Value<int> timeInZoneWarmup;
  final Value<int> timeInZoneFat;
  final Value<int> timeInZoneCardio;
  final Value<int> timeInZonePeak;
  final Value<bool> completed;
  const TrainingSessionsTableCompanion({
    this.id = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.missionId = const Value.absent(),
    this.userAge = const Value.absent(),
    this.avgHeartRate = const Value.absent(),
    this.maxHeartRate = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.timeInZoneRest = const Value.absent(),
    this.timeInZoneWarmup = const Value.absent(),
    this.timeInZoneFat = const Value.absent(),
    this.timeInZoneCardio = const Value.absent(),
    this.timeInZonePeak = const Value.absent(),
    this.completed = const Value.absent(),
  });
  TrainingSessionsTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime startTime,
    this.endTime = const Value.absent(),
    required int missionId,
    required int userAge,
    this.avgHeartRate = const Value.absent(),
    this.maxHeartRate = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.timeInZoneRest = const Value.absent(),
    this.timeInZoneWarmup = const Value.absent(),
    this.timeInZoneFat = const Value.absent(),
    this.timeInZoneCardio = const Value.absent(),
    this.timeInZonePeak = const Value.absent(),
    this.completed = const Value.absent(),
  })  : startTime = Value(startTime),
        missionId = Value(missionId),
        userAge = Value(userAge);
  static Insertable<TrainingSessionsTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? missionId,
    Expression<int>? userAge,
    Expression<int>? avgHeartRate,
    Expression<int>? maxHeartRate,
    Expression<double>? caloriesBurned,
    Expression<int>? timeInZoneRest,
    Expression<int>? timeInZoneWarmup,
    Expression<int>? timeInZoneFat,
    Expression<int>? timeInZoneCardio,
    Expression<int>? timeInZonePeak,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (missionId != null) 'mission_id': missionId,
      if (userAge != null) 'user_age': userAge,
      if (avgHeartRate != null) 'avg_heart_rate': avgHeartRate,
      if (maxHeartRate != null) 'max_heart_rate': maxHeartRate,
      if (caloriesBurned != null) 'calories_burned': caloriesBurned,
      if (timeInZoneRest != null) 'time_in_zone_rest': timeInZoneRest,
      if (timeInZoneWarmup != null) 'time_in_zone_warmup': timeInZoneWarmup,
      if (timeInZoneFat != null) 'time_in_zone_fat': timeInZoneFat,
      if (timeInZoneCardio != null) 'time_in_zone_cardio': timeInZoneCardio,
      if (timeInZonePeak != null) 'time_in_zone_peak': timeInZonePeak,
      if (completed != null) 'completed': completed,
    });
  }

  TrainingSessionsTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? startTime,
      Value<DateTime?>? endTime,
      Value<int>? missionId,
      Value<int>? userAge,
      Value<int?>? avgHeartRate,
      Value<int?>? maxHeartRate,
      Value<double?>? caloriesBurned,
      Value<int>? timeInZoneRest,
      Value<int>? timeInZoneWarmup,
      Value<int>? timeInZoneFat,
      Value<int>? timeInZoneCardio,
      Value<int>? timeInZonePeak,
      Value<bool>? completed}) {
    return TrainingSessionsTableCompanion(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      missionId: missionId ?? this.missionId,
      userAge: userAge ?? this.userAge,
      avgHeartRate: avgHeartRate ?? this.avgHeartRate,
      maxHeartRate: maxHeartRate ?? this.maxHeartRate,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      timeInZoneRest: timeInZoneRest ?? this.timeInZoneRest,
      timeInZoneWarmup: timeInZoneWarmup ?? this.timeInZoneWarmup,
      timeInZoneFat: timeInZoneFat ?? this.timeInZoneFat,
      timeInZoneCardio: timeInZoneCardio ?? this.timeInZoneCardio,
      timeInZonePeak: timeInZonePeak ?? this.timeInZonePeak,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (missionId.present) {
      map['mission_id'] = Variable<int>(missionId.value);
    }
    if (userAge.present) {
      map['user_age'] = Variable<int>(userAge.value);
    }
    if (avgHeartRate.present) {
      map['avg_heart_rate'] = Variable<int>(avgHeartRate.value);
    }
    if (maxHeartRate.present) {
      map['max_heart_rate'] = Variable<int>(maxHeartRate.value);
    }
    if (caloriesBurned.present) {
      map['calories_burned'] = Variable<double>(caloriesBurned.value);
    }
    if (timeInZoneRest.present) {
      map['time_in_zone_rest'] = Variable<int>(timeInZoneRest.value);
    }
    if (timeInZoneWarmup.present) {
      map['time_in_zone_warmup'] = Variable<int>(timeInZoneWarmup.value);
    }
    if (timeInZoneFat.present) {
      map['time_in_zone_fat'] = Variable<int>(timeInZoneFat.value);
    }
    if (timeInZoneCardio.present) {
      map['time_in_zone_cardio'] = Variable<int>(timeInZoneCardio.value);
    }
    if (timeInZonePeak.present) {
      map['time_in_zone_peak'] = Variable<int>(timeInZonePeak.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingSessionsTableCompanion(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('missionId: $missionId, ')
          ..write('userAge: $userAge, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write('maxHeartRate: $maxHeartRate, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('timeInZoneRest: $timeInZoneRest, ')
          ..write('timeInZoneWarmup: $timeInZoneWarmup, ')
          ..write('timeInZoneFat: $timeInZoneFat, ')
          ..write('timeInZoneCardio: $timeInZoneCardio, ')
          ..write('timeInZonePeak: $timeInZonePeak, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $HeartRateReadingsTableTable extends HeartRateReadingsTable
    with TableInfo<$HeartRateReadingsTableTable, HeartRateReadingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HeartRateReadingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _bpmMeta = const VerificationMeta('bpm');
  @override
  late final GeneratedColumn<int> bpm = GeneratedColumn<int>(
      'bpm', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES training_sessions (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, timestamp, bpm, sessionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'heart_rate_readings';
  @override
  VerificationContext validateIntegrity(
      Insertable<HeartRateReadingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('bpm')) {
      context.handle(
          _bpmMeta, bpm.isAcceptableOrUnknown(data['bpm']!, _bpmMeta));
    } else if (isInserting) {
      context.missing(_bpmMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HeartRateReadingsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HeartRateReadingsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      bpm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bpm'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
    );
  }

  @override
  $HeartRateReadingsTableTable createAlias(String alias) {
    return $HeartRateReadingsTableTable(attachedDatabase, alias);
  }
}

class HeartRateReadingsTableData extends DataClass
    implements Insertable<HeartRateReadingsTableData> {
  final int id;
  final DateTime timestamp;
  final int bpm;
  final int sessionId;
  const HeartRateReadingsTableData(
      {required this.id,
      required this.timestamp,
      required this.bpm,
      required this.sessionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['bpm'] = Variable<int>(bpm);
    map['session_id'] = Variable<int>(sessionId);
    return map;
  }

  HeartRateReadingsTableCompanion toCompanion(bool nullToAbsent) {
    return HeartRateReadingsTableCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      bpm: Value(bpm),
      sessionId: Value(sessionId),
    );
  }

  factory HeartRateReadingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HeartRateReadingsTableData(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      bpm: serializer.fromJson<int>(json['bpm']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'bpm': serializer.toJson<int>(bpm),
      'sessionId': serializer.toJson<int>(sessionId),
    };
  }

  HeartRateReadingsTableData copyWith(
          {int? id, DateTime? timestamp, int? bpm, int? sessionId}) =>
      HeartRateReadingsTableData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        bpm: bpm ?? this.bpm,
        sessionId: sessionId ?? this.sessionId,
      );
  HeartRateReadingsTableData copyWithCompanion(
      HeartRateReadingsTableCompanion data) {
    return HeartRateReadingsTableData(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      bpm: data.bpm.present ? data.bpm.value : this.bpm,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HeartRateReadingsTableData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('bpm: $bpm, ')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, bpm, sessionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HeartRateReadingsTableData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.bpm == this.bpm &&
          other.sessionId == this.sessionId);
}

class HeartRateReadingsTableCompanion
    extends UpdateCompanion<HeartRateReadingsTableData> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<int> bpm;
  final Value<int> sessionId;
  const HeartRateReadingsTableCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.bpm = const Value.absent(),
    this.sessionId = const Value.absent(),
  });
  HeartRateReadingsTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required int bpm,
    required int sessionId,
  })  : timestamp = Value(timestamp),
        bpm = Value(bpm),
        sessionId = Value(sessionId);
  static Insertable<HeartRateReadingsTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<int>? bpm,
    Expression<int>? sessionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (bpm != null) 'bpm': bpm,
      if (sessionId != null) 'session_id': sessionId,
    });
  }

  HeartRateReadingsTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? timestamp,
      Value<int>? bpm,
      Value<int>? sessionId}) {
    return HeartRateReadingsTableCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      bpm: bpm ?? this.bpm,
      sessionId: sessionId ?? this.sessionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (bpm.present) {
      map['bpm'] = Variable<int>(bpm.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeartRateReadingsTableCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('bpm: $bpm, ')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTableTable extends AppSettingsTable
    with TableInfo<$AppSettingsTableTable, AppSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _demoModeEnabledMeta =
      const VerificationMeta('demoModeEnabled');
  @override
  late final GeneratedColumn<bool> demoModeEnabled = GeneratedColumn<bool>(
      'demo_mode_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("demo_mode_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, demoModeEnabled];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
      Insertable<AppSettingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('demo_mode_enabled')) {
      context.handle(
          _demoModeEnabledMeta,
          demoModeEnabled.isAcceptableOrUnknown(
              data['demo_mode_enabled']!, _demoModeEnabledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      demoModeEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}demo_mode_enabled'])!,
    );
  }

  @override
  $AppSettingsTableTable createAlias(String alias) {
    return $AppSettingsTableTable(attachedDatabase, alias);
  }
}

class AppSettingsTableData extends DataClass
    implements Insertable<AppSettingsTableData> {
  final int id;
  final bool demoModeEnabled;
  const AppSettingsTableData({required this.id, required this.demoModeEnabled});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['demo_mode_enabled'] = Variable<bool>(demoModeEnabled);
    return map;
  }

  AppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsTableCompanion(
      id: Value(id),
      demoModeEnabled: Value(demoModeEnabled),
    );
  }

  factory AppSettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      demoModeEnabled: serializer.fromJson<bool>(json['demoModeEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'demoModeEnabled': serializer.toJson<bool>(demoModeEnabled),
    };
  }

  AppSettingsTableData copyWith({int? id, bool? demoModeEnabled}) =>
      AppSettingsTableData(
        id: id ?? this.id,
        demoModeEnabled: demoModeEnabled ?? this.demoModeEnabled,
      );
  AppSettingsTableData copyWithCompanion(AppSettingsTableCompanion data) {
    return AppSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      demoModeEnabled: data.demoModeEnabled.present
          ? data.demoModeEnabled.value
          : this.demoModeEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableData(')
          ..write('id: $id, ')
          ..write('demoModeEnabled: $demoModeEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, demoModeEnabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingsTableData &&
          other.id == this.id &&
          other.demoModeEnabled == this.demoModeEnabled);
}

class AppSettingsTableCompanion extends UpdateCompanion<AppSettingsTableData> {
  final Value<int> id;
  final Value<bool> demoModeEnabled;
  const AppSettingsTableCompanion({
    this.id = const Value.absent(),
    this.demoModeEnabled = const Value.absent(),
  });
  AppSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.demoModeEnabled = const Value.absent(),
  });
  static Insertable<AppSettingsTableData> custom({
    Expression<int>? id,
    Expression<bool>? demoModeEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (demoModeEnabled != null) 'demo_mode_enabled': demoModeEnabled,
    });
  }

  AppSettingsTableCompanion copyWith(
      {Value<int>? id, Value<bool>? demoModeEnabled}) {
    return AppSettingsTableCompanion(
      id: id ?? this.id,
      demoModeEnabled: demoModeEnabled ?? this.demoModeEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (demoModeEnabled.present) {
      map['demo_mode_enabled'] = Variable<bool>(demoModeEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('demoModeEnabled: $demoModeEnabled')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TrainingSessionsTableTable trainingSessionsTable =
      $TrainingSessionsTableTable(this);
  late final $HeartRateReadingsTableTable heartRateReadingsTable =
      $HeartRateReadingsTableTable(this);
  late final $AppSettingsTableTable appSettingsTable =
      $AppSettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [trainingSessionsTable, heartRateReadingsTable, appSettingsTable];
}

typedef $$TrainingSessionsTableTableCreateCompanionBuilder
    = TrainingSessionsTableCompanion Function({
  Value<int> id,
  required DateTime startTime,
  Value<DateTime?> endTime,
  required int missionId,
  required int userAge,
  Value<int?> avgHeartRate,
  Value<int?> maxHeartRate,
  Value<double?> caloriesBurned,
  Value<int> timeInZoneRest,
  Value<int> timeInZoneWarmup,
  Value<int> timeInZoneFat,
  Value<int> timeInZoneCardio,
  Value<int> timeInZonePeak,
  Value<bool> completed,
});
typedef $$TrainingSessionsTableTableUpdateCompanionBuilder
    = TrainingSessionsTableCompanion Function({
  Value<int> id,
  Value<DateTime> startTime,
  Value<DateTime?> endTime,
  Value<int> missionId,
  Value<int> userAge,
  Value<int?> avgHeartRate,
  Value<int?> maxHeartRate,
  Value<double?> caloriesBurned,
  Value<int> timeInZoneRest,
  Value<int> timeInZoneWarmup,
  Value<int> timeInZoneFat,
  Value<int> timeInZoneCardio,
  Value<int> timeInZonePeak,
  Value<bool> completed,
});

class $$TrainingSessionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainingSessionsTableTable,
    TrainingSessionsTableData,
    $$TrainingSessionsTableTableFilterComposer,
    $$TrainingSessionsTableTableOrderingComposer,
    $$TrainingSessionsTableTableCreateCompanionBuilder,
    $$TrainingSessionsTableTableUpdateCompanionBuilder> {
  $$TrainingSessionsTableTableTableManager(
      _$AppDatabase db, $TrainingSessionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$TrainingSessionsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$TrainingSessionsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<int> missionId = const Value.absent(),
            Value<int> userAge = const Value.absent(),
            Value<int?> avgHeartRate = const Value.absent(),
            Value<int?> maxHeartRate = const Value.absent(),
            Value<double?> caloriesBurned = const Value.absent(),
            Value<int> timeInZoneRest = const Value.absent(),
            Value<int> timeInZoneWarmup = const Value.absent(),
            Value<int> timeInZoneFat = const Value.absent(),
            Value<int> timeInZoneCardio = const Value.absent(),
            Value<int> timeInZonePeak = const Value.absent(),
            Value<bool> completed = const Value.absent(),
          }) =>
              TrainingSessionsTableCompanion(
            id: id,
            startTime: startTime,
            endTime: endTime,
            missionId: missionId,
            userAge: userAge,
            avgHeartRate: avgHeartRate,
            maxHeartRate: maxHeartRate,
            caloriesBurned: caloriesBurned,
            timeInZoneRest: timeInZoneRest,
            timeInZoneWarmup: timeInZoneWarmup,
            timeInZoneFat: timeInZoneFat,
            timeInZoneCardio: timeInZoneCardio,
            timeInZonePeak: timeInZonePeak,
            completed: completed,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime startTime,
            Value<DateTime?> endTime = const Value.absent(),
            required int missionId,
            required int userAge,
            Value<int?> avgHeartRate = const Value.absent(),
            Value<int?> maxHeartRate = const Value.absent(),
            Value<double?> caloriesBurned = const Value.absent(),
            Value<int> timeInZoneRest = const Value.absent(),
            Value<int> timeInZoneWarmup = const Value.absent(),
            Value<int> timeInZoneFat = const Value.absent(),
            Value<int> timeInZoneCardio = const Value.absent(),
            Value<int> timeInZonePeak = const Value.absent(),
            Value<bool> completed = const Value.absent(),
          }) =>
              TrainingSessionsTableCompanion.insert(
            id: id,
            startTime: startTime,
            endTime: endTime,
            missionId: missionId,
            userAge: userAge,
            avgHeartRate: avgHeartRate,
            maxHeartRate: maxHeartRate,
            caloriesBurned: caloriesBurned,
            timeInZoneRest: timeInZoneRest,
            timeInZoneWarmup: timeInZoneWarmup,
            timeInZoneFat: timeInZoneFat,
            timeInZoneCardio: timeInZoneCardio,
            timeInZonePeak: timeInZonePeak,
            completed: completed,
          ),
        ));
}

class $$TrainingSessionsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TrainingSessionsTableTable> {
  $$TrainingSessionsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get missionId => $state.composableBuilder(
      column: $state.table.missionId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userAge => $state.composableBuilder(
      column: $state.table.userAge,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get avgHeartRate => $state.composableBuilder(
      column: $state.table.avgHeartRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get maxHeartRate => $state.composableBuilder(
      column: $state.table.maxHeartRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get caloriesBurned => $state.composableBuilder(
      column: $state.table.caloriesBurned,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timeInZoneRest => $state.composableBuilder(
      column: $state.table.timeInZoneRest,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timeInZoneWarmup => $state.composableBuilder(
      column: $state.table.timeInZoneWarmup,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timeInZoneFat => $state.composableBuilder(
      column: $state.table.timeInZoneFat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timeInZoneCardio => $state.composableBuilder(
      column: $state.table.timeInZoneCardio,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timeInZonePeak => $state.composableBuilder(
      column: $state.table.timeInZonePeak,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get completed => $state.composableBuilder(
      column: $state.table.completed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter heartRateReadingsTableRefs(
      ComposableFilter Function($$HeartRateReadingsTableTableFilterComposer f)
          f) {
    final $$HeartRateReadingsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.heartRateReadingsTable,
            getReferencedColumn: (t) => t.sessionId,
            builder: (joinBuilder, parentComposers) =>
                $$HeartRateReadingsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.heartRateReadingsTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$TrainingSessionsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TrainingSessionsTableTable> {
  $$TrainingSessionsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get missionId => $state.composableBuilder(
      column: $state.table.missionId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userAge => $state.composableBuilder(
      column: $state.table.userAge,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get avgHeartRate => $state.composableBuilder(
      column: $state.table.avgHeartRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get maxHeartRate => $state.composableBuilder(
      column: $state.table.maxHeartRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get caloriesBurned => $state.composableBuilder(
      column: $state.table.caloriesBurned,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timeInZoneRest => $state.composableBuilder(
      column: $state.table.timeInZoneRest,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timeInZoneWarmup => $state.composableBuilder(
      column: $state.table.timeInZoneWarmup,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timeInZoneFat => $state.composableBuilder(
      column: $state.table.timeInZoneFat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timeInZoneCardio => $state.composableBuilder(
      column: $state.table.timeInZoneCardio,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timeInZonePeak => $state.composableBuilder(
      column: $state.table.timeInZonePeak,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get completed => $state.composableBuilder(
      column: $state.table.completed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$HeartRateReadingsTableTableCreateCompanionBuilder
    = HeartRateReadingsTableCompanion Function({
  Value<int> id,
  required DateTime timestamp,
  required int bpm,
  required int sessionId,
});
typedef $$HeartRateReadingsTableTableUpdateCompanionBuilder
    = HeartRateReadingsTableCompanion Function({
  Value<int> id,
  Value<DateTime> timestamp,
  Value<int> bpm,
  Value<int> sessionId,
});

class $$HeartRateReadingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HeartRateReadingsTableTable,
    HeartRateReadingsTableData,
    $$HeartRateReadingsTableTableFilterComposer,
    $$HeartRateReadingsTableTableOrderingComposer,
    $$HeartRateReadingsTableTableCreateCompanionBuilder,
    $$HeartRateReadingsTableTableUpdateCompanionBuilder> {
  $$HeartRateReadingsTableTableTableManager(
      _$AppDatabase db, $HeartRateReadingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$HeartRateReadingsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$HeartRateReadingsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<int> bpm = const Value.absent(),
            Value<int> sessionId = const Value.absent(),
          }) =>
              HeartRateReadingsTableCompanion(
            id: id,
            timestamp: timestamp,
            bpm: bpm,
            sessionId: sessionId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime timestamp,
            required int bpm,
            required int sessionId,
          }) =>
              HeartRateReadingsTableCompanion.insert(
            id: id,
            timestamp: timestamp,
            bpm: bpm,
            sessionId: sessionId,
          ),
        ));
}

class $$HeartRateReadingsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HeartRateReadingsTableTable> {
  $$HeartRateReadingsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get bpm => $state.composableBuilder(
      column: $state.table.bpm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$TrainingSessionsTableTableFilterComposer get sessionId {
    final $$TrainingSessionsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sessionId,
            referencedTable: $state.db.trainingSessionsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$TrainingSessionsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.trainingSessionsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$HeartRateReadingsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HeartRateReadingsTableTable> {
  $$HeartRateReadingsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get bpm => $state.composableBuilder(
      column: $state.table.bpm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$TrainingSessionsTableTableOrderingComposer get sessionId {
    final $$TrainingSessionsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sessionId,
            referencedTable: $state.db.trainingSessionsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$TrainingSessionsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.trainingSessionsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

typedef $$AppSettingsTableTableCreateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<bool> demoModeEnabled,
});
typedef $$AppSettingsTableTableUpdateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<bool> demoModeEnabled,
});

class $$AppSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder> {
  $$AppSettingsTableTableTableManager(
      _$AppDatabase db, $AppSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AppSettingsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AppSettingsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> demoModeEnabled = const Value.absent(),
          }) =>
              AppSettingsTableCompanion(
            id: id,
            demoModeEnabled: demoModeEnabled,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> demoModeEnabled = const Value.absent(),
          }) =>
              AppSettingsTableCompanion.insert(
            id: id,
            demoModeEnabled: demoModeEnabled,
          ),
        ));
}

class $$AppSettingsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get demoModeEnabled => $state.composableBuilder(
      column: $state.table.demoModeEnabled,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AppSettingsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get demoModeEnabled => $state.composableBuilder(
      column: $state.table.demoModeEnabled,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TrainingSessionsTableTableTableManager get trainingSessionsTable =>
      $$TrainingSessionsTableTableTableManager(_db, _db.trainingSessionsTable);
  $$HeartRateReadingsTableTableTableManager get heartRateReadingsTable =>
      $$HeartRateReadingsTableTableTableManager(
          _db, _db.heartRateReadingsTable);
  $$AppSettingsTableTableTableManager get appSettingsTable =>
      $$AppSettingsTableTableTableManager(_db, _db.appSettingsTable);
}
