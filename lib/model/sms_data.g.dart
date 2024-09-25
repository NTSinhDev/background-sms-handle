// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSMSDataCollection on Isar {
  IsarCollection<SMSData> get sMSDatas => this.collection();
}

const SMSDataSchema = CollectionSchema(
  name: r'SMSData',
  id: 7293041776346097768,
  properties: {
    r'errorMsg': PropertySchema(
      id: 0,
      name: r'errorMsg',
      type: IsarType.string,
    ),
    r'sms': PropertySchema(
      id: 1,
      name: r'sms',
      type: IsarType.object,
      target: r'MySMS',
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.bool,
    )
  },
  estimateSize: _sMSDataEstimateSize,
  serialize: _sMSDataSerialize,
  deserialize: _sMSDataDeserialize,
  deserializeProp: _sMSDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'MySMS': MySMSSchema},
  getId: _sMSDataGetId,
  getLinks: _sMSDataGetLinks,
  attach: _sMSDataAttach,
  version: '3.1.0+1',
);

int _sMSDataEstimateSize(
  SMSData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.errorMsg;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sms;
    if (value != null) {
      bytesCount +=
          3 + MySMSSchema.estimateSize(value, allOffsets[MySMS]!, allOffsets);
    }
  }
  return bytesCount;
}

void _sMSDataSerialize(
  SMSData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.errorMsg);
  writer.writeObject<MySMS>(
    offsets[1],
    allOffsets,
    MySMSSchema.serialize,
    object.sms,
  );
  writer.writeBool(offsets[2], object.status);
}

SMSData _sMSDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SMSData(
    errorMsg: reader.readStringOrNull(offsets[0]),
    sms: reader.readObjectOrNull<MySMS>(
      offsets[1],
      MySMSSchema.deserialize,
      allOffsets,
    ),
    status: reader.readBoolOrNull(offsets[2]) ?? false,
  );
  object.id = id;
  return object;
}

P _sMSDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<MySMS>(
        offset,
        MySMSSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sMSDataGetId(SMSData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sMSDataGetLinks(SMSData object) {
  return [];
}

void _sMSDataAttach(IsarCollection<dynamic> col, Id id, SMSData object) {
  object.id = id;
}

extension SMSDataQueryWhereSort on QueryBuilder<SMSData, SMSData, QWhere> {
  QueryBuilder<SMSData, SMSData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SMSDataQueryWhere on QueryBuilder<SMSData, SMSData, QWhereClause> {
  QueryBuilder<SMSData, SMSData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SMSData, SMSData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterWhereClause> idBetween(
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
}

extension SMSDataQueryFilter
    on QueryBuilder<SMSData, SMSData, QFilterCondition> {
  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMsg',
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMsg',
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMsg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMsg',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMsg',
        value: '',
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> errorMsgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMsg',
        value: '',
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> smsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sms',
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> smsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sms',
      ));
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> statusEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }
}

extension SMSDataQueryObject
    on QueryBuilder<SMSData, SMSData, QFilterCondition> {
  QueryBuilder<SMSData, SMSData, QAfterFilterCondition> sms(
      FilterQuery<MySMS> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sms');
    });
  }
}

extension SMSDataQueryLinks
    on QueryBuilder<SMSData, SMSData, QFilterCondition> {}

extension SMSDataQuerySortBy on QueryBuilder<SMSData, SMSData, QSortBy> {
  QueryBuilder<SMSData, SMSData, QAfterSortBy> sortByErrorMsg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMsg', Sort.asc);
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterSortBy> sortByErrorMsgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMsg', Sort.desc);
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SMSDataQuerySortThenBy
    on QueryBuilder<SMSData, SMSData, QSortThenBy> {
  QueryBuilder<SMSData, SMSData, QAfterSortBy> thenByErrorMsg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMsg', Sort.asc);
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterSortBy> thenByErrorMsgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMsg', Sort.desc);
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SMSData, SMSData, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SMSDataQueryWhereDistinct
    on QueryBuilder<SMSData, SMSData, QDistinct> {
  QueryBuilder<SMSData, SMSData, QDistinct> distinctByErrorMsg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMsg', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SMSData, SMSData, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension SMSDataQueryProperty
    on QueryBuilder<SMSData, SMSData, QQueryProperty> {
  QueryBuilder<SMSData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SMSData, String?, QQueryOperations> errorMsgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMsg');
    });
  }

  QueryBuilder<SMSData, MySMS?, QQueryOperations> smsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sms');
    });
  }

  QueryBuilder<SMSData, bool, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MySMSSchema = Schema(
  name: r'MySMS',
  id: -801508618947901774,
  properties: {
    r'body': PropertySchema(
      id: 0,
      name: r'body',
      type: IsarType.string,
    ),
    r'sender': PropertySchema(
      id: 1,
      name: r'sender',
      type: IsarType.string,
    ),
    r'timeReceived': PropertySchema(
      id: 2,
      name: r'timeReceived',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _mySMSEstimateSize,
  serialize: _mySMSSerialize,
  deserialize: _mySMSDeserialize,
  deserializeProp: _mySMSDeserializeProp,
);

int _mySMSEstimateSize(
  MySMS object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.body;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mySMSSerialize(
  MySMS object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.body);
  writer.writeString(offsets[1], object.sender);
  writer.writeDateTime(offsets[2], object.timeReceived);
}

MySMS _mySMSDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MySMS(
    body: reader.readStringOrNull(offsets[0]),
    sender: reader.readStringOrNull(offsets[1]),
    timeReceived: reader.readDateTimeOrNull(offsets[2]),
  );
  return object;
}

P _mySMSDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MySMSQueryFilter on QueryBuilder<MySMS, MySMS, QFilterCondition> {
  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'body',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'body',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'body',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'body',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sender',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sender',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sender',
        value: '',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> senderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sender',
        value: '',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> timeReceivedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeReceived',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> timeReceivedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeReceived',
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> timeReceivedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeReceived',
        value: value,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> timeReceivedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeReceived',
        value: value,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> timeReceivedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeReceived',
        value: value,
      ));
    });
  }

  QueryBuilder<MySMS, MySMS, QAfterFilterCondition> timeReceivedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeReceived',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MySMSQueryObject on QueryBuilder<MySMS, MySMS, QFilterCondition> {}
