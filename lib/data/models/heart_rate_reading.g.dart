// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_rate_reading.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHeartRateReadingCollection on Isar {
  IsarCollection<HeartRateReading> get heartRateReadings => this.collection();
}

const HeartRateReadingSchema = CollectionSchema(
  name: r'HeartRateReading',
  id: 9876543210987654321,
  properties: {
    r'bpm': PropertySchema(
      id: 0,
      name: r'bpm',
      type: IsarType.long,
    ),
    r'sessionId': PropertySchema(
      id: 1,
      name: r'sessionId',
      type: IsarType.long,
    ),
    r'timestamp': PropertySchema(
      id: 2,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _heartRateReadingEstimateSize,
  serialize: _heartRateReadingSerialize,
  deserialize: _heartRateReadingDeserialize,
  deserializeProp: _heartRateReadingDeserializeProp,
  idName: r'id',
  indexes: {
    r'sessionId': IndexSchema(
      id: 9876543210987654322,
      name: r'sessionId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sessionId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _heartRateReadingGetId,
  getLinks: _heartRateReadingGetLinks,
  attach: _heartRateReadingAttach,
  version: '3.1.0+1',
);

int _heartRateReadingEstimateSize(
  HeartRateReading object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _heartRateReadingSerialize(
  HeartRateReading object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bpm);
  writer.writeLong(offsets[1], object.sessionId);
  writer.writeDateTime(offsets[2], object.timestamp);
}

HeartRateReading _heartRateReadingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HeartRateReading(
    bpm: reader.readLong(offsets[0]),
    id: id,
    sessionId: reader.readLong(offsets[1]),
    timestamp: reader.readDateTimeOrNull(offsets[2]),
  );
  return object;
}

P _heartRateReadingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _heartRateReadingGetId(HeartRateReading object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _heartRateReadingGetLinks(HeartRateReading object) {
  return [];
}

void _heartRateReadingAttach(
    IsarCollection<dynamic> col, Id id, HeartRateReading object) {
  object.id = id;
}

extension HeartRateReadingQueryWhereSort
    on QueryBuilder<HeartRateReading, HeartRateReading, QWhere> {
  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhere>
      anySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sessionId'),
      );
    });
  }
}

extension HeartRateReadingQueryWhere
    on QueryBuilder<HeartRateReading, HeartRateReading, QWhereClause> {
  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
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

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      sessionIdEqualTo(int sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId',
        value: [sessionId],
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      sessionIdNotEqualTo(int sessionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [],
              upper: [sessionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [sessionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [sessionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [],
              upper: [sessionId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      sessionIdGreaterThan(
    int sessionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sessionId',
        lower: [sessionId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      sessionIdLessThan(
    int sessionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sessionId',
        lower: [],
        upper: [sessionId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterWhereClause>
      sessionIdBetween(
    int lowerSessionId,
    int upperSessionId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sessionId',
        lower: [lowerSessionId],
        includeLower: includeLower,
        upper: [upperSessionId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HeartRateReadingQueryFilter
    on QueryBuilder<HeartRateReading, HeartRateReading, QFilterCondition> {
  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      bpmEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bpm',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      bpmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bpm',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      bpmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bpm',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      bpmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bpm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      sessionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      sessionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      sessionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      sessionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sessionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HeartRateReadingQueryObject
    on QueryBuilder<HeartRateReading, HeartRateReading, QFilterCondition> {}

extension HeartRateReadingQueryLinks
    on QueryBuilder<HeartRateReading, HeartRateReading, QFilterCondition> {}

extension HeartRateReadingQuerySortBy
    on QueryBuilder<HeartRateReading, HeartRateReading, QSortBy> {
  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy> sortByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.asc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      sortByBpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.desc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension HeartRateReadingQuerySortThenBy
    on QueryBuilder<HeartRateReading, HeartRateReading, QSortThenBy> {
  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy> thenByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.asc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      thenByBpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.desc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension HeartRateReadingQueryWhereDistinct
    on QueryBuilder<HeartRateReading, HeartRateReading, QDistinct> {
  QueryBuilder<HeartRateReading, HeartRateReading, QDistinct>
      distinctByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bpm');
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QDistinct>
      distinctBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId');
    });
  }

  QueryBuilder<HeartRateReading, HeartRateReading, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension HeartRateReadingQueryProperty
    on QueryBuilder<HeartRateReading, HeartRateReading, QQueryProperty> {
  QueryBuilder<HeartRateReading, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HeartRateReading, int, QQueryOperations> bpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bpm');
    });
  }

  QueryBuilder<HeartRateReading, int, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<HeartRateReading, DateTime, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
