// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_session.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTrainingSessionCollection on Isar {
  IsarCollection<TrainingSession> get trainingSessions => this.collection();
}

const TrainingSessionSchema = CollectionSchema(
  name: r'TrainingSession',
  id: 1234567890123456789,
  properties: {
    r'avgHeartRate': PropertySchema(
      id: 0,
      name: r'avgHeartRate',
      type: IsarType.long,
    ),
    r'caloriesBurned': PropertySchema(
      id: 1,
      name: r'caloriesBurned',
      type: IsarType.double,
    ),
    r'completed': PropertySchema(
      id: 2,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'endTime': PropertySchema(
      id: 3,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'maxHeartRate': PropertySchema(
      id: 4,
      name: r'maxHeartRate',
      type: IsarType.long,
    ),
    r'missionId': PropertySchema(
      id: 5,
      name: r'missionId',
      type: IsarType.long,
    ),
    r'startTime': PropertySchema(
      id: 6,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'timeInZoneCardio': PropertySchema(
      id: 7,
      name: r'timeInZoneCardio',
      type: IsarType.long,
    ),
    r'timeInZoneFat': PropertySchema(
      id: 8,
      name: r'timeInZoneFat',
      type: IsarType.long,
    ),
    r'timeInZonePeak': PropertySchema(
      id: 9,
      name: r'timeInZonePeak',
      type: IsarType.long,
    ),
    r'timeInZoneRest': PropertySchema(
      id: 10,
      name: r'timeInZoneRest',
      type: IsarType.long,
    ),
    r'timeInZoneWarmup': PropertySchema(
      id: 11,
      name: r'timeInZoneWarmup',
      type: IsarType.long,
    ),
    r'userAge': PropertySchema(
      id: 12,
      name: r'userAge',
      type: IsarType.long,
    ),
  },
  estimateSize: _trainingSessionEstimateSize,
  serialize: _trainingSessionSerialize,
  deserialize: _trainingSessionDeserialize,
  deserializeProp: _trainingSessionDeserializeProp,
  idName: r'id',
  indexes: {
    r'startTime': IndexSchema(
      id: 1234567890123456790,
      name: r'startTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'completed': IndexSchema(
      id: 1234567890123456791,
      name: r'completed',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'completed',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _trainingSessionGetId,
  getLinks: _trainingSessionGetLinks,
  attach: _trainingSessionAttach,
  version: '3.1.0+1',
);

int _trainingSessionEstimateSize(
  TrainingSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _trainingSessionSerialize(
  TrainingSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.avgHeartRate);
  writer.writeDouble(offsets[1], object.caloriesBurned);
  writer.writeBool(offsets[2], object.completed);
  writer.writeDateTime(offsets[3], object.endTime);
  writer.writeLong(offsets[4], object.maxHeartRate);
  writer.writeLong(offsets[5], object.missionId);
  writer.writeDateTime(offsets[6], object.startTime);
  writer.writeLong(offsets[7], object.timeInZoneCardio);
  writer.writeLong(offsets[8], object.timeInZoneFat);
  writer.writeLong(offsets[9], object.timeInZonePeak);
  writer.writeLong(offsets[10], object.timeInZoneRest);
  writer.writeLong(offsets[11], object.timeInZoneWarmup);
  writer.writeLong(offsets[12], object.userAge);
}

TrainingSession _trainingSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TrainingSession(
    avgHeartRate: reader.readLongOrNull(offsets[0]),
    caloriesBurned: reader.readDoubleOrNull(offsets[1]),
    completed: reader.readBoolOrNull(offsets[2]) ?? false,
    endTime: reader.readDateTimeOrNull(offsets[3]),
    id: id,
    maxHeartRate: reader.readLongOrNull(offsets[4]),
    missionId: reader.readLong(offsets[5]),
    startTime: reader.readDateTimeOrNull(offsets[6]),
    timeInZoneCardio: reader.readLongOrNull(offsets[7]) ?? 0,
    timeInZoneFat: reader.readLongOrNull(offsets[8]) ?? 0,
    timeInZonePeak: reader.readLongOrNull(offsets[9]) ?? 0,
    timeInZoneRest: reader.readLongOrNull(offsets[10]) ?? 0,
    timeInZoneWarmup: reader.readLongOrNull(offsets[11]) ?? 0,
    userAge: reader.readLong(offsets[12]),
  );
  return object;
}

P _trainingSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 8:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 9:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 11:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _trainingSessionGetId(TrainingSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _trainingSessionGetLinks(TrainingSession object) {
  return [];
}

void _trainingSessionAttach(
    IsarCollection<dynamic> col, Id id, TrainingSession object) {
  object.id = id;
}

extension TrainingSessionQueryWhereSort
    on QueryBuilder<TrainingSession, TrainingSession, QWhere> {
  QueryBuilder<TrainingSession, TrainingSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhere> anyStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startTime'),
      );
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhere> anyCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'completed'),
      );
    });
  }
}

extension TrainingSessionQueryWhere
    on QueryBuilder<TrainingSession, TrainingSession, QWhereClause> {
  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      startTimeEqualTo(DateTime startTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startTime',
        value: [startTime],
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      startTimeNotEqualTo(DateTime startTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [],
              upper: [startTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [startTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [startTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [],
              upper: [startTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      startTimeGreaterThan(
    DateTime startTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [startTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      startTimeLessThan(
    DateTime startTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [],
        upper: [startTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      startTimeBetween(
    DateTime lowerStartTime,
    DateTime upperStartTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [lowerStartTime],
        includeLower: includeLower,
        upper: [upperStartTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      completedEqualTo(bool completed) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'completed',
        value: [completed],
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterWhereClause>
      completedNotEqualTo(bool completed) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completed',
              lower: [],
              upper: [completed],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completed',
              lower: [completed],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completed',
              lower: [completed],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completed',
              lower: [],
              upper: [completed],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TrainingSessionQueryFilter
    on QueryBuilder<TrainingSession, TrainingSession, QFilterCondition> {
  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      avgHeartRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avgHeartRate',
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      avgHeartRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avgHeartRate',
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      avgHeartRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avgHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      avgHeartRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avgHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      avgHeartRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avgHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      avgHeartRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avgHeartRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      caloriesBurnedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caloriesBurned',
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      caloriesBurnedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caloriesBurned',
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      caloriesBurnedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caloriesBurned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      caloriesBurnedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caloriesBurned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      caloriesBurnedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caloriesBurned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      caloriesBurnedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caloriesBurned',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      completedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completed',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      missionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'missionId',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterFilterCondition>
      userAgeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAge',
        value: value,
      ));
    });
  }
}

extension TrainingSessionQueryObject
    on QueryBuilder<TrainingSession, TrainingSession, QFilterCondition> {}

extension TrainingSessionQueryLinks
    on QueryBuilder<TrainingSession, TrainingSession, QFilterCondition> {}

extension TrainingSessionQuerySortBy
    on QueryBuilder<TrainingSession, TrainingSession, QSortBy> {
  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByAvgHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgHeartRate', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByAvgHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgHeartRate', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByCaloriesBurned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesBurned', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByCaloriesBurnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesBurned', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByMaxHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByMaxHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByMissionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionId', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByMissionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionId', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZoneCardio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZoneCardio', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZoneCardioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZoneCardio', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZoneFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZoneFat', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZoneFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZoneFat', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZonePeak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZonePeak', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZonePeakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZonePeak', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZoneRest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZoneRest', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZoneRestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZoneRest', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZoneWarmup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZoneWarmup', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByTimeInZoneWarmupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInZoneWarmup', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByUserAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAge', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      sortByUserAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAge', Sort.desc);
    });
  }
}

extension TrainingSessionQuerySortThenBy
    on QueryBuilder<TrainingSession, TrainingSession, QSortThenBy> {
  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByAvgHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgHeartRate', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByAvgHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgHeartRate', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByCaloriesBurned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesBurned', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByCaloriesBurnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesBurned', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByMissionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionId', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByMissionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missionId', Sort.desc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByUserAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAge', Sort.asc);
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QAfterSortBy>
      thenByUserAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAge', Sort.desc);
    });
  }
}

extension TrainingSessionQueryWhereDistinct
    on QueryBuilder<TrainingSession, TrainingSession, QDistinct> {
  QueryBuilder<TrainingSession, TrainingSession, QDistinct>
      distinctByAvgHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgHeartRate');
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QDistinct>
      distinctByCaloriesBurned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caloriesBurned');
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QDistinct>
      distinctByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completed');
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QDistinct>
      distinctByMissionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'missionId');
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<TrainingSession, TrainingSession, QDistinct>
      distinctByUserAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAge');
    });
  }
}

extension TrainingSessionQueryProperty
    on QueryBuilder<TrainingSession, TrainingSession, QQueryProperty> {
  QueryBuilder<TrainingSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TrainingSession, int?, QQueryOperations>
      avgHeartRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgHeartRate');
    });
  }

  QueryBuilder<TrainingSession, double?, QQueryOperations>
      caloriesBurnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caloriesBurned');
    });
  }

  QueryBuilder<TrainingSession, bool, QQueryOperations> completedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completed');
    });
  }

  QueryBuilder<TrainingSession, int, QQueryOperations> missionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'missionId');
    });
  }

  QueryBuilder<TrainingSession, DateTime, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<TrainingSession, int, QQueryOperations> userAgeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAge');
    });
  }
}
