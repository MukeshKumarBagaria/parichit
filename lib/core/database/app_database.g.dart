// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PlacesTable extends Places with TableInfo<$PlacesTable, PlaceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameAltMeta = const VerificationMeta(
    'nameAlt',
  );
  @override
  late final GeneratedColumn<String> nameAlt = GeneratedColumn<String>(
    'name_alt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _placeTypeMeta = const VerificationMeta(
    'placeType',
  );
  @override
  late final GeneratedColumn<String> placeType = GeneratedColumn<String>(
    'place_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('village'),
  );
  static const VerificationMeta _parentPlaceIdMeta = const VerificationMeta(
    'parentPlaceId',
  );
  @override
  late final GeneratedColumn<String> parentPlaceId = GeneratedColumn<String>(
    'parent_place_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pincodeMeta = const VerificationMeta(
    'pincode',
  );
  @override
  late final GeneratedColumn<String> pincode = GeneratedColumn<String>(
    'pincode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    name,
    nameAlt,
    placeType,
    parentPlaceId,
    pincode,
    latitude,
    longitude,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'places';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_alt')) {
      context.handle(
        _nameAltMeta,
        nameAlt.isAcceptableOrUnknown(data['name_alt']!, _nameAltMeta),
      );
    }
    if (data.containsKey('place_type')) {
      context.handle(
        _placeTypeMeta,
        placeType.isAcceptableOrUnknown(data['place_type']!, _placeTypeMeta),
      );
    }
    if (data.containsKey('parent_place_id')) {
      context.handle(
        _parentPlaceIdMeta,
        parentPlaceId.isAcceptableOrUnknown(
          data['parent_place_id']!,
          _parentPlaceIdMeta,
        ),
      );
    }
    if (data.containsKey('pincode')) {
      context.handle(
        _pincodeMeta,
        pincode.isAcceptableOrUnknown(data['pincode']!, _pincodeMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameAlt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_alt'],
      ),
      placeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_type'],
      )!,
      parentPlaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_place_id'],
      ),
      pincode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pincode'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
    );
  }

  @override
  $PlacesTable createAlias(String alias) {
    return $PlacesTable(attachedDatabase, alias);
  }
}

class PlaceRow extends DataClass implements Insertable<PlaceRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String name;
  final String? nameAlt;
  final String placeType;
  final String? parentPlaceId;
  final String? pincode;
  final double? latitude;
  final double? longitude;
  const PlaceRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.name,
    this.nameAlt,
    required this.placeType,
    this.parentPlaceId,
    this.pincode,
    this.latitude,
    this.longitude,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nameAlt != null) {
      map['name_alt'] = Variable<String>(nameAlt);
    }
    map['place_type'] = Variable<String>(placeType);
    if (!nullToAbsent || parentPlaceId != null) {
      map['parent_place_id'] = Variable<String>(parentPlaceId);
    }
    if (!nullToAbsent || pincode != null) {
      map['pincode'] = Variable<String>(pincode);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    return map;
  }

  PlacesCompanion toCompanion(bool nullToAbsent) {
    return PlacesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      name: Value(name),
      nameAlt: nameAlt == null && nullToAbsent ? const Value.absent() : Value(nameAlt),
      placeType: Value(placeType),
      parentPlaceId: parentPlaceId == null && nullToAbsent ? const Value.absent() : Value(parentPlaceId),
      pincode: pincode == null && nullToAbsent ? const Value.absent() : Value(pincode),
      latitude: latitude == null && nullToAbsent ? const Value.absent() : Value(latitude),
      longitude: longitude == null && nullToAbsent ? const Value.absent() : Value(longitude),
    );
  }

  factory PlaceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaceRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      name: serializer.fromJson<String>(json['name']),
      nameAlt: serializer.fromJson<String?>(json['name_alt']),
      placeType: serializer.fromJson<String>(json['place_type']),
      parentPlaceId: serializer.fromJson<String?>(json['parent_place_id']),
      pincode: serializer.fromJson<String?>(json['pincode']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'name': serializer.toJson<String>(name),
      'name_alt': serializer.toJson<String?>(nameAlt),
      'place_type': serializer.toJson<String>(placeType),
      'parent_place_id': serializer.toJson<String?>(parentPlaceId),
      'pincode': serializer.toJson<String?>(pincode),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
    };
  }

  PlaceRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? name,
    Value<String?> nameAlt = const Value.absent(),
    String? placeType,
    Value<String?> parentPlaceId = const Value.absent(),
    Value<String?> pincode = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
  }) => PlaceRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    name: name ?? this.name,
    nameAlt: nameAlt.present ? nameAlt.value : this.nameAlt,
    placeType: placeType ?? this.placeType,
    parentPlaceId: parentPlaceId.present ? parentPlaceId.value : this.parentPlaceId,
    pincode: pincode.present ? pincode.value : this.pincode,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
  );
  PlaceRow copyWithCompanion(PlacesCompanion data) {
    return PlaceRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      name: data.name.present ? data.name.value : this.name,
      nameAlt: data.nameAlt.present ? data.nameAlt.value : this.nameAlt,
      placeType: data.placeType.present ? data.placeType.value : this.placeType,
      parentPlaceId: data.parentPlaceId.present ? data.parentPlaceId.value : this.parentPlaceId,
      pincode: data.pincode.present ? data.pincode.value : this.pincode,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaceRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('name: $name, ')
          ..write('nameAlt: $nameAlt, ')
          ..write('placeType: $placeType, ')
          ..write('parentPlaceId: $parentPlaceId, ')
          ..write('pincode: $pincode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    name,
    nameAlt,
    placeType,
    parentPlaceId,
    pincode,
    latitude,
    longitude,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaceRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.name == this.name &&
          other.nameAlt == this.nameAlt &&
          other.placeType == this.placeType &&
          other.parentPlaceId == this.parentPlaceId &&
          other.pincode == this.pincode &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude);
}

class PlacesCompanion extends UpdateCompanion<PlaceRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> name;
  final Value<String?> nameAlt;
  final Value<String> placeType;
  final Value<String?> parentPlaceId;
  final Value<String?> pincode;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<int> rowid;
  const PlacesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.name = const Value.absent(),
    this.nameAlt = const Value.absent(),
    this.placeType = const Value.absent(),
    this.parentPlaceId = const Value.absent(),
    this.pincode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlacesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String name,
    this.nameAlt = const Value.absent(),
    this.placeType = const Value.absent(),
    this.parentPlaceId = const Value.absent(),
    this.pincode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       name = Value(name);
  static Insertable<PlaceRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? name,
    Expression<String>? nameAlt,
    Expression<String>? placeType,
    Expression<String>? parentPlaceId,
    Expression<String>? pincode,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (name != null) 'name': name,
      if (nameAlt != null) 'name_alt': nameAlt,
      if (placeType != null) 'place_type': placeType,
      if (parentPlaceId != null) 'parent_place_id': parentPlaceId,
      if (pincode != null) 'pincode': pincode,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlacesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? name,
    Value<String?>? nameAlt,
    Value<String>? placeType,
    Value<String?>? parentPlaceId,
    Value<String?>? pincode,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<int>? rowid,
  }) {
    return PlacesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      name: name ?? this.name,
      nameAlt: nameAlt ?? this.nameAlt,
      placeType: placeType ?? this.placeType,
      parentPlaceId: parentPlaceId ?? this.parentPlaceId,
      pincode: pincode ?? this.pincode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameAlt.present) {
      map['name_alt'] = Variable<String>(nameAlt.value);
    }
    if (placeType.present) {
      map['place_type'] = Variable<String>(placeType.value);
    }
    if (parentPlaceId.present) {
      map['parent_place_id'] = Variable<String>(parentPlaceId.value);
    }
    if (pincode.present) {
      map['pincode'] = Variable<String>(pincode.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlacesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('name: $name, ')
          ..write('nameAlt: $nameAlt, ')
          ..write('placeType: $placeType, ')
          ..write('parentPlaceId: $parentPlaceId, ')
          ..write('pincode: $pincode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PeopleTable extends People with TableInfo<$PeopleTable, PersonRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeopleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameAltMeta = const VerificationMeta(
    'fullNameAlt',
  );
  @override
  late final GeneratedColumn<String> fullNameAlt = GeneratedColumn<String>(
    'full_name_alt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nicknameMeta = const VerificationMeta(
    'nickname',
  );
  @override
  late final GeneratedColumn<String> nickname = GeneratedColumn<String>(
    'nickname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _surnameMeta = const VerificationMeta(
    'surname',
  );
  @override
  late final GeneratedColumn<String> surname = GeneratedColumn<String>(
    'surname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unknown'),
  );
  static const VerificationMeta _isLivingMeta = const VerificationMeta(
    'isLiving',
  );
  @override
  late final GeneratedColumn<bool> isLiving = GeneratedColumn<bool>(
    'is_living',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_living" IN (0, 1))',
    ),
  );
  static const VerificationMeta _birthYearMeta = const VerificationMeta(
    'birthYear',
  );
  @override
  late final GeneratedColumn<int> birthYear = GeneratedColumn<int>(
    'birth_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthMonthMeta = const VerificationMeta(
    'birthMonth',
  );
  @override
  late final GeneratedColumn<int> birthMonth = GeneratedColumn<int>(
    'birth_month',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthDayMeta = const VerificationMeta(
    'birthDay',
  );
  @override
  late final GeneratedColumn<int> birthDay = GeneratedColumn<int>(
    'birth_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthDateApproxMeta = const VerificationMeta(
    'birthDateApprox',
  );
  @override
  late final GeneratedColumn<bool> birthDateApprox = GeneratedColumn<bool>(
    'birth_date_approx',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("birth_date_approx" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _birthOrderMeta = const VerificationMeta(
    'birthOrder',
  );
  @override
  late final GeneratedColumn<int> birthOrder = GeneratedColumn<int>(
    'birth_order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deathYearMeta = const VerificationMeta(
    'deathYear',
  );
  @override
  late final GeneratedColumn<int> deathYear = GeneratedColumn<int>(
    'death_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deathMonthMeta = const VerificationMeta(
    'deathMonth',
  );
  @override
  late final GeneratedColumn<int> deathMonth = GeneratedColumn<int>(
    'death_month',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deathDayMeta = const VerificationMeta(
    'deathDay',
  );
  @override
  late final GeneratedColumn<int> deathDay = GeneratedColumn<int>(
    'death_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthPlaceIdMeta = const VerificationMeta(
    'birthPlaceId',
  );
  @override
  late final GeneratedColumn<String> birthPlaceId = GeneratedColumn<String>(
    'birth_place_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nativePlaceIdMeta = const VerificationMeta(
    'nativePlaceId',
  );
  @override
  late final GeneratedColumn<String> nativePlaceId = GeneratedColumn<String>(
    'native_place_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gotraMeta = const VerificationMeta('gotra');
  @override
  late final GeneratedColumn<String> gotra = GeneratedColumn<String>(
    'gotra',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occupationMeta = const VerificationMeta(
    'occupation',
  );
  @override
  late final GeneratedColumn<String> occupation = GeneratedColumn<String>(
    'occupation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _organizationMeta = const VerificationMeta(
    'organization',
  );
  @override
  late final GeneratedColumn<String> organization = GeneratedColumn<String>(
    'organization',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _designationMeta = const VerificationMeta(
    'designation',
  );
  @override
  late final GeneratedColumn<String> designation = GeneratedColumn<String>(
    'designation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _educationMeta = const VerificationMeta(
    'education',
  );
  @override
  late final GeneratedColumn<String> education = GeneratedColumn<String>(
    'education',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSelfMeta = const VerificationMeta('isSelf');
  @override
  late final GeneratedColumn<bool> isSelf = GeneratedColumn<bool>(
    'is_self',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_self" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isPlaceholderMeta = const VerificationMeta(
    'isPlaceholder',
  );
  @override
  late final GeneratedColumn<bool> isPlaceholder = GeneratedColumn<bool>(
    'is_placeholder',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_placeholder" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notifyBirthdayMeta = const VerificationMeta(
    'notifyBirthday',
  );
  @override
  late final GeneratedColumn<bool> notifyBirthday = GeneratedColumn<bool>(
    'notify_birthday',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify_birthday" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _mergedIntoIdMeta = const VerificationMeta(
    'mergedIntoId',
  );
  @override
  late final GeneratedColumn<String> mergedIntoId = GeneratedColumn<String>(
    'merged_into_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _searchTextMeta = const VerificationMeta(
    'searchText',
  );
  @override
  late final GeneratedColumn<String> searchText = GeneratedColumn<String>(
    'search_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    fullName,
    fullNameAlt,
    nickname,
    surname,
    gender,
    isLiving,
    birthYear,
    birthMonth,
    birthDay,
    birthDateApprox,
    birthOrder,
    deathYear,
    deathMonth,
    deathDay,
    birthPlaceId,
    nativePlaceId,
    gotra,
    occupation,
    organization,
    designation,
    education,
    notes,
    isSelf,
    isPlaceholder,
    isFavorite,
    notifyBirthday,
    mergedIntoId,
    searchText,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'people';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('full_name_alt')) {
      context.handle(
        _fullNameAltMeta,
        fullNameAlt.isAcceptableOrUnknown(
          data['full_name_alt']!,
          _fullNameAltMeta,
        ),
      );
    }
    if (data.containsKey('nickname')) {
      context.handle(
        _nicknameMeta,
        nickname.isAcceptableOrUnknown(data['nickname']!, _nicknameMeta),
      );
    }
    if (data.containsKey('surname')) {
      context.handle(
        _surnameMeta,
        surname.isAcceptableOrUnknown(data['surname']!, _surnameMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('is_living')) {
      context.handle(
        _isLivingMeta,
        isLiving.isAcceptableOrUnknown(data['is_living']!, _isLivingMeta),
      );
    }
    if (data.containsKey('birth_year')) {
      context.handle(
        _birthYearMeta,
        birthYear.isAcceptableOrUnknown(data['birth_year']!, _birthYearMeta),
      );
    }
    if (data.containsKey('birth_month')) {
      context.handle(
        _birthMonthMeta,
        birthMonth.isAcceptableOrUnknown(data['birth_month']!, _birthMonthMeta),
      );
    }
    if (data.containsKey('birth_day')) {
      context.handle(
        _birthDayMeta,
        birthDay.isAcceptableOrUnknown(data['birth_day']!, _birthDayMeta),
      );
    }
    if (data.containsKey('birth_date_approx')) {
      context.handle(
        _birthDateApproxMeta,
        birthDateApprox.isAcceptableOrUnknown(
          data['birth_date_approx']!,
          _birthDateApproxMeta,
        ),
      );
    }
    if (data.containsKey('birth_order')) {
      context.handle(
        _birthOrderMeta,
        birthOrder.isAcceptableOrUnknown(data['birth_order']!, _birthOrderMeta),
      );
    }
    if (data.containsKey('death_year')) {
      context.handle(
        _deathYearMeta,
        deathYear.isAcceptableOrUnknown(data['death_year']!, _deathYearMeta),
      );
    }
    if (data.containsKey('death_month')) {
      context.handle(
        _deathMonthMeta,
        deathMonth.isAcceptableOrUnknown(data['death_month']!, _deathMonthMeta),
      );
    }
    if (data.containsKey('death_day')) {
      context.handle(
        _deathDayMeta,
        deathDay.isAcceptableOrUnknown(data['death_day']!, _deathDayMeta),
      );
    }
    if (data.containsKey('birth_place_id')) {
      context.handle(
        _birthPlaceIdMeta,
        birthPlaceId.isAcceptableOrUnknown(
          data['birth_place_id']!,
          _birthPlaceIdMeta,
        ),
      );
    }
    if (data.containsKey('native_place_id')) {
      context.handle(
        _nativePlaceIdMeta,
        nativePlaceId.isAcceptableOrUnknown(
          data['native_place_id']!,
          _nativePlaceIdMeta,
        ),
      );
    }
    if (data.containsKey('gotra')) {
      context.handle(
        _gotraMeta,
        gotra.isAcceptableOrUnknown(data['gotra']!, _gotraMeta),
      );
    }
    if (data.containsKey('occupation')) {
      context.handle(
        _occupationMeta,
        occupation.isAcceptableOrUnknown(data['occupation']!, _occupationMeta),
      );
    }
    if (data.containsKey('organization')) {
      context.handle(
        _organizationMeta,
        organization.isAcceptableOrUnknown(
          data['organization']!,
          _organizationMeta,
        ),
      );
    }
    if (data.containsKey('designation')) {
      context.handle(
        _designationMeta,
        designation.isAcceptableOrUnknown(
          data['designation']!,
          _designationMeta,
        ),
      );
    }
    if (data.containsKey('education')) {
      context.handle(
        _educationMeta,
        education.isAcceptableOrUnknown(data['education']!, _educationMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_self')) {
      context.handle(
        _isSelfMeta,
        isSelf.isAcceptableOrUnknown(data['is_self']!, _isSelfMeta),
      );
    }
    if (data.containsKey('is_placeholder')) {
      context.handle(
        _isPlaceholderMeta,
        isPlaceholder.isAcceptableOrUnknown(
          data['is_placeholder']!,
          _isPlaceholderMeta,
        ),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('notify_birthday')) {
      context.handle(
        _notifyBirthdayMeta,
        notifyBirthday.isAcceptableOrUnknown(
          data['notify_birthday']!,
          _notifyBirthdayMeta,
        ),
      );
    }
    if (data.containsKey('merged_into_id')) {
      context.handle(
        _mergedIntoIdMeta,
        mergedIntoId.isAcceptableOrUnknown(
          data['merged_into_id']!,
          _mergedIntoIdMeta,
        ),
      );
    }
    if (data.containsKey('search_text')) {
      context.handle(
        _searchTextMeta,
        searchText.isAcceptableOrUnknown(data['search_text']!, _searchTextMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      fullNameAlt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name_alt'],
      ),
      nickname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nickname'],
      ),
      surname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surname'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      isLiving: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_living'],
      ),
      birthYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birth_year'],
      ),
      birthMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birth_month'],
      ),
      birthDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birth_day'],
      ),
      birthDateApprox: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}birth_date_approx'],
      )!,
      birthOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birth_order'],
      ),
      deathYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}death_year'],
      ),
      deathMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}death_month'],
      ),
      deathDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}death_day'],
      ),
      birthPlaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birth_place_id'],
      ),
      nativePlaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}native_place_id'],
      ),
      gotra: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gotra'],
      ),
      occupation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occupation'],
      ),
      organization: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization'],
      ),
      designation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}designation'],
      ),
      education: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}education'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isSelf: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_self'],
      )!,
      isPlaceholder: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_placeholder'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      notifyBirthday: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_birthday'],
      )!,
      mergedIntoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merged_into_id'],
      ),
      searchText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}search_text'],
      )!,
    );
  }

  @override
  $PeopleTable createAlias(String alias) {
    return $PeopleTable(attachedDatabase, alias);
  }
}

class PersonRow extends DataClass implements Insertable<PersonRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String fullName;
  final String? fullNameAlt;
  final String? nickname;
  final String? surname;
  final String gender;
  final bool? isLiving;
  final int? birthYear;
  final int? birthMonth;
  final int? birthDay;
  final bool birthDateApprox;
  final int? birthOrder;
  final int? deathYear;
  final int? deathMonth;
  final int? deathDay;
  final String? birthPlaceId;
  final String? nativePlaceId;
  final String? gotra;
  final String? occupation;
  final String? organization;
  final String? designation;
  final String? education;
  final String? notes;
  final bool isSelf;
  final bool isPlaceholder;
  final bool isFavorite;
  final bool notifyBirthday;
  final String? mergedIntoId;

  /// Local only: normalised names, aliases, phone digits… used for search.
  final String searchText;
  const PersonRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.fullName,
    this.fullNameAlt,
    this.nickname,
    this.surname,
    required this.gender,
    this.isLiving,
    this.birthYear,
    this.birthMonth,
    this.birthDay,
    required this.birthDateApprox,
    this.birthOrder,
    this.deathYear,
    this.deathMonth,
    this.deathDay,
    this.birthPlaceId,
    this.nativePlaceId,
    this.gotra,
    this.occupation,
    this.organization,
    this.designation,
    this.education,
    this.notes,
    required this.isSelf,
    required this.isPlaceholder,
    required this.isFavorite,
    required this.notifyBirthday,
    this.mergedIntoId,
    required this.searchText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || fullNameAlt != null) {
      map['full_name_alt'] = Variable<String>(fullNameAlt);
    }
    if (!nullToAbsent || nickname != null) {
      map['nickname'] = Variable<String>(nickname);
    }
    if (!nullToAbsent || surname != null) {
      map['surname'] = Variable<String>(surname);
    }
    map['gender'] = Variable<String>(gender);
    if (!nullToAbsent || isLiving != null) {
      map['is_living'] = Variable<bool>(isLiving);
    }
    if (!nullToAbsent || birthYear != null) {
      map['birth_year'] = Variable<int>(birthYear);
    }
    if (!nullToAbsent || birthMonth != null) {
      map['birth_month'] = Variable<int>(birthMonth);
    }
    if (!nullToAbsent || birthDay != null) {
      map['birth_day'] = Variable<int>(birthDay);
    }
    map['birth_date_approx'] = Variable<bool>(birthDateApprox);
    if (!nullToAbsent || birthOrder != null) {
      map['birth_order'] = Variable<int>(birthOrder);
    }
    if (!nullToAbsent || deathYear != null) {
      map['death_year'] = Variable<int>(deathYear);
    }
    if (!nullToAbsent || deathMonth != null) {
      map['death_month'] = Variable<int>(deathMonth);
    }
    if (!nullToAbsent || deathDay != null) {
      map['death_day'] = Variable<int>(deathDay);
    }
    if (!nullToAbsent || birthPlaceId != null) {
      map['birth_place_id'] = Variable<String>(birthPlaceId);
    }
    if (!nullToAbsent || nativePlaceId != null) {
      map['native_place_id'] = Variable<String>(nativePlaceId);
    }
    if (!nullToAbsent || gotra != null) {
      map['gotra'] = Variable<String>(gotra);
    }
    if (!nullToAbsent || occupation != null) {
      map['occupation'] = Variable<String>(occupation);
    }
    if (!nullToAbsent || organization != null) {
      map['organization'] = Variable<String>(organization);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String>(designation);
    }
    if (!nullToAbsent || education != null) {
      map['education'] = Variable<String>(education);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_self'] = Variable<bool>(isSelf);
    map['is_placeholder'] = Variable<bool>(isPlaceholder);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['notify_birthday'] = Variable<bool>(notifyBirthday);
    if (!nullToAbsent || mergedIntoId != null) {
      map['merged_into_id'] = Variable<String>(mergedIntoId);
    }
    map['search_text'] = Variable<String>(searchText);
    return map;
  }

  PeopleCompanion toCompanion(bool nullToAbsent) {
    return PeopleCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      fullName: Value(fullName),
      fullNameAlt: fullNameAlt == null && nullToAbsent ? const Value.absent() : Value(fullNameAlt),
      nickname: nickname == null && nullToAbsent ? const Value.absent() : Value(nickname),
      surname: surname == null && nullToAbsent ? const Value.absent() : Value(surname),
      gender: Value(gender),
      isLiving: isLiving == null && nullToAbsent ? const Value.absent() : Value(isLiving),
      birthYear: birthYear == null && nullToAbsent ? const Value.absent() : Value(birthYear),
      birthMonth: birthMonth == null && nullToAbsent ? const Value.absent() : Value(birthMonth),
      birthDay: birthDay == null && nullToAbsent ? const Value.absent() : Value(birthDay),
      birthDateApprox: Value(birthDateApprox),
      birthOrder: birthOrder == null && nullToAbsent ? const Value.absent() : Value(birthOrder),
      deathYear: deathYear == null && nullToAbsent ? const Value.absent() : Value(deathYear),
      deathMonth: deathMonth == null && nullToAbsent ? const Value.absent() : Value(deathMonth),
      deathDay: deathDay == null && nullToAbsent ? const Value.absent() : Value(deathDay),
      birthPlaceId: birthPlaceId == null && nullToAbsent ? const Value.absent() : Value(birthPlaceId),
      nativePlaceId: nativePlaceId == null && nullToAbsent ? const Value.absent() : Value(nativePlaceId),
      gotra: gotra == null && nullToAbsent ? const Value.absent() : Value(gotra),
      occupation: occupation == null && nullToAbsent ? const Value.absent() : Value(occupation),
      organization: organization == null && nullToAbsent ? const Value.absent() : Value(organization),
      designation: designation == null && nullToAbsent ? const Value.absent() : Value(designation),
      education: education == null && nullToAbsent ? const Value.absent() : Value(education),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isSelf: Value(isSelf),
      isPlaceholder: Value(isPlaceholder),
      isFavorite: Value(isFavorite),
      notifyBirthday: Value(notifyBirthday),
      mergedIntoId: mergedIntoId == null && nullToAbsent ? const Value.absent() : Value(mergedIntoId),
      searchText: Value(searchText),
    );
  }

  factory PersonRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      fullName: serializer.fromJson<String>(json['full_name']),
      fullNameAlt: serializer.fromJson<String?>(json['full_name_alt']),
      nickname: serializer.fromJson<String?>(json['nickname']),
      surname: serializer.fromJson<String?>(json['surname']),
      gender: serializer.fromJson<String>(json['gender']),
      isLiving: serializer.fromJson<bool?>(json['is_living']),
      birthYear: serializer.fromJson<int?>(json['birth_year']),
      birthMonth: serializer.fromJson<int?>(json['birth_month']),
      birthDay: serializer.fromJson<int?>(json['birth_day']),
      birthDateApprox: serializer.fromJson<bool>(json['birth_date_approx']),
      birthOrder: serializer.fromJson<int?>(json['birth_order']),
      deathYear: serializer.fromJson<int?>(json['death_year']),
      deathMonth: serializer.fromJson<int?>(json['death_month']),
      deathDay: serializer.fromJson<int?>(json['death_day']),
      birthPlaceId: serializer.fromJson<String?>(json['birth_place_id']),
      nativePlaceId: serializer.fromJson<String?>(json['native_place_id']),
      gotra: serializer.fromJson<String?>(json['gotra']),
      occupation: serializer.fromJson<String?>(json['occupation']),
      organization: serializer.fromJson<String?>(json['organization']),
      designation: serializer.fromJson<String?>(json['designation']),
      education: serializer.fromJson<String?>(json['education']),
      notes: serializer.fromJson<String?>(json['notes']),
      isSelf: serializer.fromJson<bool>(json['is_self']),
      isPlaceholder: serializer.fromJson<bool>(json['is_placeholder']),
      isFavorite: serializer.fromJson<bool>(json['is_favorite']),
      notifyBirthday: serializer.fromJson<bool>(json['notify_birthday']),
      mergedIntoId: serializer.fromJson<String?>(json['merged_into_id']),
      searchText: serializer.fromJson<String>(json['search_text']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'full_name': serializer.toJson<String>(fullName),
      'full_name_alt': serializer.toJson<String?>(fullNameAlt),
      'nickname': serializer.toJson<String?>(nickname),
      'surname': serializer.toJson<String?>(surname),
      'gender': serializer.toJson<String>(gender),
      'is_living': serializer.toJson<bool?>(isLiving),
      'birth_year': serializer.toJson<int?>(birthYear),
      'birth_month': serializer.toJson<int?>(birthMonth),
      'birth_day': serializer.toJson<int?>(birthDay),
      'birth_date_approx': serializer.toJson<bool>(birthDateApprox),
      'birth_order': serializer.toJson<int?>(birthOrder),
      'death_year': serializer.toJson<int?>(deathYear),
      'death_month': serializer.toJson<int?>(deathMonth),
      'death_day': serializer.toJson<int?>(deathDay),
      'birth_place_id': serializer.toJson<String?>(birthPlaceId),
      'native_place_id': serializer.toJson<String?>(nativePlaceId),
      'gotra': serializer.toJson<String?>(gotra),
      'occupation': serializer.toJson<String?>(occupation),
      'organization': serializer.toJson<String?>(organization),
      'designation': serializer.toJson<String?>(designation),
      'education': serializer.toJson<String?>(education),
      'notes': serializer.toJson<String?>(notes),
      'is_self': serializer.toJson<bool>(isSelf),
      'is_placeholder': serializer.toJson<bool>(isPlaceholder),
      'is_favorite': serializer.toJson<bool>(isFavorite),
      'notify_birthday': serializer.toJson<bool>(notifyBirthday),
      'merged_into_id': serializer.toJson<String?>(mergedIntoId),
      'search_text': serializer.toJson<String>(searchText),
    };
  }

  PersonRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? fullName,
    Value<String?> fullNameAlt = const Value.absent(),
    Value<String?> nickname = const Value.absent(),
    Value<String?> surname = const Value.absent(),
    String? gender,
    Value<bool?> isLiving = const Value.absent(),
    Value<int?> birthYear = const Value.absent(),
    Value<int?> birthMonth = const Value.absent(),
    Value<int?> birthDay = const Value.absent(),
    bool? birthDateApprox,
    Value<int?> birthOrder = const Value.absent(),
    Value<int?> deathYear = const Value.absent(),
    Value<int?> deathMonth = const Value.absent(),
    Value<int?> deathDay = const Value.absent(),
    Value<String?> birthPlaceId = const Value.absent(),
    Value<String?> nativePlaceId = const Value.absent(),
    Value<String?> gotra = const Value.absent(),
    Value<String?> occupation = const Value.absent(),
    Value<String?> organization = const Value.absent(),
    Value<String?> designation = const Value.absent(),
    Value<String?> education = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? isSelf,
    bool? isPlaceholder,
    bool? isFavorite,
    bool? notifyBirthday,
    Value<String?> mergedIntoId = const Value.absent(),
    String? searchText,
  }) => PersonRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    fullName: fullName ?? this.fullName,
    fullNameAlt: fullNameAlt.present ? fullNameAlt.value : this.fullNameAlt,
    nickname: nickname.present ? nickname.value : this.nickname,
    surname: surname.present ? surname.value : this.surname,
    gender: gender ?? this.gender,
    isLiving: isLiving.present ? isLiving.value : this.isLiving,
    birthYear: birthYear.present ? birthYear.value : this.birthYear,
    birthMonth: birthMonth.present ? birthMonth.value : this.birthMonth,
    birthDay: birthDay.present ? birthDay.value : this.birthDay,
    birthDateApprox: birthDateApprox ?? this.birthDateApprox,
    birthOrder: birthOrder.present ? birthOrder.value : this.birthOrder,
    deathYear: deathYear.present ? deathYear.value : this.deathYear,
    deathMonth: deathMonth.present ? deathMonth.value : this.deathMonth,
    deathDay: deathDay.present ? deathDay.value : this.deathDay,
    birthPlaceId: birthPlaceId.present ? birthPlaceId.value : this.birthPlaceId,
    nativePlaceId: nativePlaceId.present ? nativePlaceId.value : this.nativePlaceId,
    gotra: gotra.present ? gotra.value : this.gotra,
    occupation: occupation.present ? occupation.value : this.occupation,
    organization: organization.present ? organization.value : this.organization,
    designation: designation.present ? designation.value : this.designation,
    education: education.present ? education.value : this.education,
    notes: notes.present ? notes.value : this.notes,
    isSelf: isSelf ?? this.isSelf,
    isPlaceholder: isPlaceholder ?? this.isPlaceholder,
    isFavorite: isFavorite ?? this.isFavorite,
    notifyBirthday: notifyBirthday ?? this.notifyBirthday,
    mergedIntoId: mergedIntoId.present ? mergedIntoId.value : this.mergedIntoId,
    searchText: searchText ?? this.searchText,
  );
  PersonRow copyWithCompanion(PeopleCompanion data) {
    return PersonRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      fullNameAlt: data.fullNameAlt.present ? data.fullNameAlt.value : this.fullNameAlt,
      nickname: data.nickname.present ? data.nickname.value : this.nickname,
      surname: data.surname.present ? data.surname.value : this.surname,
      gender: data.gender.present ? data.gender.value : this.gender,
      isLiving: data.isLiving.present ? data.isLiving.value : this.isLiving,
      birthYear: data.birthYear.present ? data.birthYear.value : this.birthYear,
      birthMonth: data.birthMonth.present ? data.birthMonth.value : this.birthMonth,
      birthDay: data.birthDay.present ? data.birthDay.value : this.birthDay,
      birthDateApprox: data.birthDateApprox.present ? data.birthDateApprox.value : this.birthDateApprox,
      birthOrder: data.birthOrder.present ? data.birthOrder.value : this.birthOrder,
      deathYear: data.deathYear.present ? data.deathYear.value : this.deathYear,
      deathMonth: data.deathMonth.present ? data.deathMonth.value : this.deathMonth,
      deathDay: data.deathDay.present ? data.deathDay.value : this.deathDay,
      birthPlaceId: data.birthPlaceId.present ? data.birthPlaceId.value : this.birthPlaceId,
      nativePlaceId: data.nativePlaceId.present ? data.nativePlaceId.value : this.nativePlaceId,
      gotra: data.gotra.present ? data.gotra.value : this.gotra,
      occupation: data.occupation.present ? data.occupation.value : this.occupation,
      organization: data.organization.present ? data.organization.value : this.organization,
      designation: data.designation.present ? data.designation.value : this.designation,
      education: data.education.present ? data.education.value : this.education,
      notes: data.notes.present ? data.notes.value : this.notes,
      isSelf: data.isSelf.present ? data.isSelf.value : this.isSelf,
      isPlaceholder: data.isPlaceholder.present ? data.isPlaceholder.value : this.isPlaceholder,
      isFavorite: data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      notifyBirthday: data.notifyBirthday.present ? data.notifyBirthday.value : this.notifyBirthday,
      mergedIntoId: data.mergedIntoId.present ? data.mergedIntoId.value : this.mergedIntoId,
      searchText: data.searchText.present ? data.searchText.value : this.searchText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('fullName: $fullName, ')
          ..write('fullNameAlt: $fullNameAlt, ')
          ..write('nickname: $nickname, ')
          ..write('surname: $surname, ')
          ..write('gender: $gender, ')
          ..write('isLiving: $isLiving, ')
          ..write('birthYear: $birthYear, ')
          ..write('birthMonth: $birthMonth, ')
          ..write('birthDay: $birthDay, ')
          ..write('birthDateApprox: $birthDateApprox, ')
          ..write('birthOrder: $birthOrder, ')
          ..write('deathYear: $deathYear, ')
          ..write('deathMonth: $deathMonth, ')
          ..write('deathDay: $deathDay, ')
          ..write('birthPlaceId: $birthPlaceId, ')
          ..write('nativePlaceId: $nativePlaceId, ')
          ..write('gotra: $gotra, ')
          ..write('occupation: $occupation, ')
          ..write('organization: $organization, ')
          ..write('designation: $designation, ')
          ..write('education: $education, ')
          ..write('notes: $notes, ')
          ..write('isSelf: $isSelf, ')
          ..write('isPlaceholder: $isPlaceholder, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('notifyBirthday: $notifyBirthday, ')
          ..write('mergedIntoId: $mergedIntoId, ')
          ..write('searchText: $searchText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    fullName,
    fullNameAlt,
    nickname,
    surname,
    gender,
    isLiving,
    birthYear,
    birthMonth,
    birthDay,
    birthDateApprox,
    birthOrder,
    deathYear,
    deathMonth,
    deathDay,
    birthPlaceId,
    nativePlaceId,
    gotra,
    occupation,
    organization,
    designation,
    education,
    notes,
    isSelf,
    isPlaceholder,
    isFavorite,
    notifyBirthday,
    mergedIntoId,
    searchText,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.fullName == this.fullName &&
          other.fullNameAlt == this.fullNameAlt &&
          other.nickname == this.nickname &&
          other.surname == this.surname &&
          other.gender == this.gender &&
          other.isLiving == this.isLiving &&
          other.birthYear == this.birthYear &&
          other.birthMonth == this.birthMonth &&
          other.birthDay == this.birthDay &&
          other.birthDateApprox == this.birthDateApprox &&
          other.birthOrder == this.birthOrder &&
          other.deathYear == this.deathYear &&
          other.deathMonth == this.deathMonth &&
          other.deathDay == this.deathDay &&
          other.birthPlaceId == this.birthPlaceId &&
          other.nativePlaceId == this.nativePlaceId &&
          other.gotra == this.gotra &&
          other.occupation == this.occupation &&
          other.organization == this.organization &&
          other.designation == this.designation &&
          other.education == this.education &&
          other.notes == this.notes &&
          other.isSelf == this.isSelf &&
          other.isPlaceholder == this.isPlaceholder &&
          other.isFavorite == this.isFavorite &&
          other.notifyBirthday == this.notifyBirthday &&
          other.mergedIntoId == this.mergedIntoId &&
          other.searchText == this.searchText);
}

class PeopleCompanion extends UpdateCompanion<PersonRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> fullName;
  final Value<String?> fullNameAlt;
  final Value<String?> nickname;
  final Value<String?> surname;
  final Value<String> gender;
  final Value<bool?> isLiving;
  final Value<int?> birthYear;
  final Value<int?> birthMonth;
  final Value<int?> birthDay;
  final Value<bool> birthDateApprox;
  final Value<int?> birthOrder;
  final Value<int?> deathYear;
  final Value<int?> deathMonth;
  final Value<int?> deathDay;
  final Value<String?> birthPlaceId;
  final Value<String?> nativePlaceId;
  final Value<String?> gotra;
  final Value<String?> occupation;
  final Value<String?> organization;
  final Value<String?> designation;
  final Value<String?> education;
  final Value<String?> notes;
  final Value<bool> isSelf;
  final Value<bool> isPlaceholder;
  final Value<bool> isFavorite;
  final Value<bool> notifyBirthday;
  final Value<String?> mergedIntoId;
  final Value<String> searchText;
  final Value<int> rowid;
  const PeopleCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.fullName = const Value.absent(),
    this.fullNameAlt = const Value.absent(),
    this.nickname = const Value.absent(),
    this.surname = const Value.absent(),
    this.gender = const Value.absent(),
    this.isLiving = const Value.absent(),
    this.birthYear = const Value.absent(),
    this.birthMonth = const Value.absent(),
    this.birthDay = const Value.absent(),
    this.birthDateApprox = const Value.absent(),
    this.birthOrder = const Value.absent(),
    this.deathYear = const Value.absent(),
    this.deathMonth = const Value.absent(),
    this.deathDay = const Value.absent(),
    this.birthPlaceId = const Value.absent(),
    this.nativePlaceId = const Value.absent(),
    this.gotra = const Value.absent(),
    this.occupation = const Value.absent(),
    this.organization = const Value.absent(),
    this.designation = const Value.absent(),
    this.education = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSelf = const Value.absent(),
    this.isPlaceholder = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.notifyBirthday = const Value.absent(),
    this.mergedIntoId = const Value.absent(),
    this.searchText = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PeopleCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String fullName,
    this.fullNameAlt = const Value.absent(),
    this.nickname = const Value.absent(),
    this.surname = const Value.absent(),
    this.gender = const Value.absent(),
    this.isLiving = const Value.absent(),
    this.birthYear = const Value.absent(),
    this.birthMonth = const Value.absent(),
    this.birthDay = const Value.absent(),
    this.birthDateApprox = const Value.absent(),
    this.birthOrder = const Value.absent(),
    this.deathYear = const Value.absent(),
    this.deathMonth = const Value.absent(),
    this.deathDay = const Value.absent(),
    this.birthPlaceId = const Value.absent(),
    this.nativePlaceId = const Value.absent(),
    this.gotra = const Value.absent(),
    this.occupation = const Value.absent(),
    this.organization = const Value.absent(),
    this.designation = const Value.absent(),
    this.education = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSelf = const Value.absent(),
    this.isPlaceholder = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.notifyBirthday = const Value.absent(),
    this.mergedIntoId = const Value.absent(),
    this.searchText = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       fullName = Value(fullName);
  static Insertable<PersonRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? fullName,
    Expression<String>? fullNameAlt,
    Expression<String>? nickname,
    Expression<String>? surname,
    Expression<String>? gender,
    Expression<bool>? isLiving,
    Expression<int>? birthYear,
    Expression<int>? birthMonth,
    Expression<int>? birthDay,
    Expression<bool>? birthDateApprox,
    Expression<int>? birthOrder,
    Expression<int>? deathYear,
    Expression<int>? deathMonth,
    Expression<int>? deathDay,
    Expression<String>? birthPlaceId,
    Expression<String>? nativePlaceId,
    Expression<String>? gotra,
    Expression<String>? occupation,
    Expression<String>? organization,
    Expression<String>? designation,
    Expression<String>? education,
    Expression<String>? notes,
    Expression<bool>? isSelf,
    Expression<bool>? isPlaceholder,
    Expression<bool>? isFavorite,
    Expression<bool>? notifyBirthday,
    Expression<String>? mergedIntoId,
    Expression<String>? searchText,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (fullName != null) 'full_name': fullName,
      if (fullNameAlt != null) 'full_name_alt': fullNameAlt,
      if (nickname != null) 'nickname': nickname,
      if (surname != null) 'surname': surname,
      if (gender != null) 'gender': gender,
      if (isLiving != null) 'is_living': isLiving,
      if (birthYear != null) 'birth_year': birthYear,
      if (birthMonth != null) 'birth_month': birthMonth,
      if (birthDay != null) 'birth_day': birthDay,
      if (birthDateApprox != null) 'birth_date_approx': birthDateApprox,
      if (birthOrder != null) 'birth_order': birthOrder,
      if (deathYear != null) 'death_year': deathYear,
      if (deathMonth != null) 'death_month': deathMonth,
      if (deathDay != null) 'death_day': deathDay,
      if (birthPlaceId != null) 'birth_place_id': birthPlaceId,
      if (nativePlaceId != null) 'native_place_id': nativePlaceId,
      if (gotra != null) 'gotra': gotra,
      if (occupation != null) 'occupation': occupation,
      if (organization != null) 'organization': organization,
      if (designation != null) 'designation': designation,
      if (education != null) 'education': education,
      if (notes != null) 'notes': notes,
      if (isSelf != null) 'is_self': isSelf,
      if (isPlaceholder != null) 'is_placeholder': isPlaceholder,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (notifyBirthday != null) 'notify_birthday': notifyBirthday,
      if (mergedIntoId != null) 'merged_into_id': mergedIntoId,
      if (searchText != null) 'search_text': searchText,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PeopleCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? fullName,
    Value<String?>? fullNameAlt,
    Value<String?>? nickname,
    Value<String?>? surname,
    Value<String>? gender,
    Value<bool?>? isLiving,
    Value<int?>? birthYear,
    Value<int?>? birthMonth,
    Value<int?>? birthDay,
    Value<bool>? birthDateApprox,
    Value<int?>? birthOrder,
    Value<int?>? deathYear,
    Value<int?>? deathMonth,
    Value<int?>? deathDay,
    Value<String?>? birthPlaceId,
    Value<String?>? nativePlaceId,
    Value<String?>? gotra,
    Value<String?>? occupation,
    Value<String?>? organization,
    Value<String?>? designation,
    Value<String?>? education,
    Value<String?>? notes,
    Value<bool>? isSelf,
    Value<bool>? isPlaceholder,
    Value<bool>? isFavorite,
    Value<bool>? notifyBirthday,
    Value<String?>? mergedIntoId,
    Value<String>? searchText,
    Value<int>? rowid,
  }) {
    return PeopleCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      fullName: fullName ?? this.fullName,
      fullNameAlt: fullNameAlt ?? this.fullNameAlt,
      nickname: nickname ?? this.nickname,
      surname: surname ?? this.surname,
      gender: gender ?? this.gender,
      isLiving: isLiving ?? this.isLiving,
      birthYear: birthYear ?? this.birthYear,
      birthMonth: birthMonth ?? this.birthMonth,
      birthDay: birthDay ?? this.birthDay,
      birthDateApprox: birthDateApprox ?? this.birthDateApprox,
      birthOrder: birthOrder ?? this.birthOrder,
      deathYear: deathYear ?? this.deathYear,
      deathMonth: deathMonth ?? this.deathMonth,
      deathDay: deathDay ?? this.deathDay,
      birthPlaceId: birthPlaceId ?? this.birthPlaceId,
      nativePlaceId: nativePlaceId ?? this.nativePlaceId,
      gotra: gotra ?? this.gotra,
      occupation: occupation ?? this.occupation,
      organization: organization ?? this.organization,
      designation: designation ?? this.designation,
      education: education ?? this.education,
      notes: notes ?? this.notes,
      isSelf: isSelf ?? this.isSelf,
      isPlaceholder: isPlaceholder ?? this.isPlaceholder,
      isFavorite: isFavorite ?? this.isFavorite,
      notifyBirthday: notifyBirthday ?? this.notifyBirthday,
      mergedIntoId: mergedIntoId ?? this.mergedIntoId,
      searchText: searchText ?? this.searchText,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (fullNameAlt.present) {
      map['full_name_alt'] = Variable<String>(fullNameAlt.value);
    }
    if (nickname.present) {
      map['nickname'] = Variable<String>(nickname.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (isLiving.present) {
      map['is_living'] = Variable<bool>(isLiving.value);
    }
    if (birthYear.present) {
      map['birth_year'] = Variable<int>(birthYear.value);
    }
    if (birthMonth.present) {
      map['birth_month'] = Variable<int>(birthMonth.value);
    }
    if (birthDay.present) {
      map['birth_day'] = Variable<int>(birthDay.value);
    }
    if (birthDateApprox.present) {
      map['birth_date_approx'] = Variable<bool>(birthDateApprox.value);
    }
    if (birthOrder.present) {
      map['birth_order'] = Variable<int>(birthOrder.value);
    }
    if (deathYear.present) {
      map['death_year'] = Variable<int>(deathYear.value);
    }
    if (deathMonth.present) {
      map['death_month'] = Variable<int>(deathMonth.value);
    }
    if (deathDay.present) {
      map['death_day'] = Variable<int>(deathDay.value);
    }
    if (birthPlaceId.present) {
      map['birth_place_id'] = Variable<String>(birthPlaceId.value);
    }
    if (nativePlaceId.present) {
      map['native_place_id'] = Variable<String>(nativePlaceId.value);
    }
    if (gotra.present) {
      map['gotra'] = Variable<String>(gotra.value);
    }
    if (occupation.present) {
      map['occupation'] = Variable<String>(occupation.value);
    }
    if (organization.present) {
      map['organization'] = Variable<String>(organization.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String>(designation.value);
    }
    if (education.present) {
      map['education'] = Variable<String>(education.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isSelf.present) {
      map['is_self'] = Variable<bool>(isSelf.value);
    }
    if (isPlaceholder.present) {
      map['is_placeholder'] = Variable<bool>(isPlaceholder.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (notifyBirthday.present) {
      map['notify_birthday'] = Variable<bool>(notifyBirthday.value);
    }
    if (mergedIntoId.present) {
      map['merged_into_id'] = Variable<String>(mergedIntoId.value);
    }
    if (searchText.present) {
      map['search_text'] = Variable<String>(searchText.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeopleCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('fullName: $fullName, ')
          ..write('fullNameAlt: $fullNameAlt, ')
          ..write('nickname: $nickname, ')
          ..write('surname: $surname, ')
          ..write('gender: $gender, ')
          ..write('isLiving: $isLiving, ')
          ..write('birthYear: $birthYear, ')
          ..write('birthMonth: $birthMonth, ')
          ..write('birthDay: $birthDay, ')
          ..write('birthDateApprox: $birthDateApprox, ')
          ..write('birthOrder: $birthOrder, ')
          ..write('deathYear: $deathYear, ')
          ..write('deathMonth: $deathMonth, ')
          ..write('deathDay: $deathDay, ')
          ..write('birthPlaceId: $birthPlaceId, ')
          ..write('nativePlaceId: $nativePlaceId, ')
          ..write('gotra: $gotra, ')
          ..write('occupation: $occupation, ')
          ..write('organization: $organization, ')
          ..write('designation: $designation, ')
          ..write('education: $education, ')
          ..write('notes: $notes, ')
          ..write('isSelf: $isSelf, ')
          ..write('isPlaceholder: $isPlaceholder, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('notifyBirthday: $notifyBirthday, ')
          ..write('mergedIntoId: $mergedIntoId, ')
          ..write('searchText: $searchText, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonNamesTable extends PersonNames with TableInfo<$PersonNamesTable, PersonNameRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonNamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameTypeMeta = const VerificationMeta(
    'nameType',
  );
  @override
  late final GeneratedColumn<String> nameType = GeneratedColumn<String>(
    'name_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('alias'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    name,
    nameType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_names';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonNameRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_type')) {
      context.handle(
        _nameTypeMeta,
        nameType.isAcceptableOrUnknown(data['name_type']!, _nameTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonNameRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonNameRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_type'],
      )!,
    );
  }

  @override
  $PersonNamesTable createAlias(String alias) {
    return $PersonNamesTable(attachedDatabase, alias);
  }
}

class PersonNameRow extends DataClass implements Insertable<PersonNameRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String personId;
  final String name;
  final String nameType;
  const PersonNameRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.personId,
    required this.name,
    required this.nameType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['person_id'] = Variable<String>(personId);
    map['name'] = Variable<String>(name);
    map['name_type'] = Variable<String>(nameType);
    return map;
  }

  PersonNamesCompanion toCompanion(bool nullToAbsent) {
    return PersonNamesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personId: Value(personId),
      name: Value(name),
      nameType: Value(nameType),
    );
  }

  factory PersonNameRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonNameRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personId: serializer.fromJson<String>(json['person_id']),
      name: serializer.fromJson<String>(json['name']),
      nameType: serializer.fromJson<String>(json['name_type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_id': serializer.toJson<String>(personId),
      'name': serializer.toJson<String>(name),
      'name_type': serializer.toJson<String>(nameType),
    };
  }

  PersonNameRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? personId,
    String? name,
    String? nameType,
  }) => PersonNameRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personId: personId ?? this.personId,
    name: name ?? this.name,
    nameType: nameType ?? this.nameType,
  );
  PersonNameRow copyWithCompanion(PersonNamesCompanion data) {
    return PersonNameRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personId: data.personId.present ? data.personId.value : this.personId,
      name: data.name.present ? data.name.value : this.name,
      nameType: data.nameType.present ? data.nameType.value : this.nameType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonNameRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('name: $name, ')
          ..write('nameType: $nameType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    name,
    nameType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonNameRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personId == this.personId &&
          other.name == this.name &&
          other.nameType == this.nameType);
}

class PersonNamesCompanion extends UpdateCompanion<PersonNameRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> personId;
  final Value<String> name;
  final Value<String> nameType;
  final Value<int> rowid;
  const PersonNamesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.name = const Value.absent(),
    this.nameType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonNamesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String personId,
    required String name,
    this.nameType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       personId = Value(personId),
       name = Value(name);
  static Insertable<PersonNameRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personId,
    Expression<String>? name,
    Expression<String>? nameType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personId != null) 'person_id': personId,
      if (name != null) 'name': name,
      if (nameType != null) 'name_type': nameType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonNamesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? personId,
    Value<String>? name,
    Value<String>? nameType,
    Value<int>? rowid,
  }) {
    return PersonNamesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personId: personId ?? this.personId,
      name: name ?? this.name,
      nameType: nameType ?? this.nameType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameType.present) {
      map['name_type'] = Variable<String>(nameType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonNamesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('name: $name, ')
          ..write('nameType: $nameType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonContactsTable extends PersonContacts with TableInfo<$PersonContactsTable, PersonContactRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonContactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _normalizedValueMeta = const VerificationMeta(
    'normalizedValue',
  );
  @override
  late final GeneratedColumn<String> normalizedValue = GeneratedColumn<String>(
    'normalized_value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isWhatsappMeta = const VerificationMeta(
    'isWhatsapp',
  );
  @override
  late final GeneratedColumn<bool> isWhatsapp = GeneratedColumn<bool>(
    'is_whatsapp',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_whatsapp" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isPrimaryMeta = const VerificationMeta(
    'isPrimary',
  );
  @override
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
    'is_primary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_primary" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    kind,
    value,
    normalizedValue,
    label,
    isWhatsapp,
    isPrimary,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_contacts';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonContactRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('normalized_value')) {
      context.handle(
        _normalizedValueMeta,
        normalizedValue.isAcceptableOrUnknown(
          data['normalized_value']!,
          _normalizedValueMeta,
        ),
      );
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('is_whatsapp')) {
      context.handle(
        _isWhatsappMeta,
        isWhatsapp.isAcceptableOrUnknown(data['is_whatsapp']!, _isWhatsappMeta),
      );
    }
    if (data.containsKey('is_primary')) {
      context.handle(
        _isPrimaryMeta,
        isPrimary.isAcceptableOrUnknown(data['is_primary']!, _isPrimaryMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonContactRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonContactRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      normalizedValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}normalized_value'],
      ),
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      ),
      isWhatsapp: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_whatsapp'],
      )!,
      isPrimary: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_primary'],
      )!,
    );
  }

  @override
  $PersonContactsTable createAlias(String alias) {
    return $PersonContactsTable(attachedDatabase, alias);
  }
}

class PersonContactRow extends DataClass implements Insertable<PersonContactRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String personId;

  /// phone | email | website | social | other
  final String kind;
  final String value;

  /// E.164 for phones, lowercase for e-mail.
  final String? normalizedValue;
  final String? label;
  final bool isWhatsapp;
  final bool isPrimary;
  const PersonContactRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.personId,
    required this.kind,
    required this.value,
    this.normalizedValue,
    this.label,
    required this.isWhatsapp,
    required this.isPrimary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['person_id'] = Variable<String>(personId);
    map['kind'] = Variable<String>(kind);
    map['value'] = Variable<String>(value);
    if (!nullToAbsent || normalizedValue != null) {
      map['normalized_value'] = Variable<String>(normalizedValue);
    }
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    map['is_whatsapp'] = Variable<bool>(isWhatsapp);
    map['is_primary'] = Variable<bool>(isPrimary);
    return map;
  }

  PersonContactsCompanion toCompanion(bool nullToAbsent) {
    return PersonContactsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personId: Value(personId),
      kind: Value(kind),
      value: Value(value),
      normalizedValue: normalizedValue == null && nullToAbsent ? const Value.absent() : Value(normalizedValue),
      label: label == null && nullToAbsent ? const Value.absent() : Value(label),
      isWhatsapp: Value(isWhatsapp),
      isPrimary: Value(isPrimary),
    );
  }

  factory PersonContactRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonContactRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personId: serializer.fromJson<String>(json['person_id']),
      kind: serializer.fromJson<String>(json['kind']),
      value: serializer.fromJson<String>(json['value']),
      normalizedValue: serializer.fromJson<String?>(json['normalized_value']),
      label: serializer.fromJson<String?>(json['label']),
      isWhatsapp: serializer.fromJson<bool>(json['is_whatsapp']),
      isPrimary: serializer.fromJson<bool>(json['is_primary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_id': serializer.toJson<String>(personId),
      'kind': serializer.toJson<String>(kind),
      'value': serializer.toJson<String>(value),
      'normalized_value': serializer.toJson<String?>(normalizedValue),
      'label': serializer.toJson<String?>(label),
      'is_whatsapp': serializer.toJson<bool>(isWhatsapp),
      'is_primary': serializer.toJson<bool>(isPrimary),
    };
  }

  PersonContactRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? personId,
    String? kind,
    String? value,
    Value<String?> normalizedValue = const Value.absent(),
    Value<String?> label = const Value.absent(),
    bool? isWhatsapp,
    bool? isPrimary,
  }) => PersonContactRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personId: personId ?? this.personId,
    kind: kind ?? this.kind,
    value: value ?? this.value,
    normalizedValue: normalizedValue.present ? normalizedValue.value : this.normalizedValue,
    label: label.present ? label.value : this.label,
    isWhatsapp: isWhatsapp ?? this.isWhatsapp,
    isPrimary: isPrimary ?? this.isPrimary,
  );
  PersonContactRow copyWithCompanion(PersonContactsCompanion data) {
    return PersonContactRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personId: data.personId.present ? data.personId.value : this.personId,
      kind: data.kind.present ? data.kind.value : this.kind,
      value: data.value.present ? data.value.value : this.value,
      normalizedValue: data.normalizedValue.present ? data.normalizedValue.value : this.normalizedValue,
      label: data.label.present ? data.label.value : this.label,
      isWhatsapp: data.isWhatsapp.present ? data.isWhatsapp.value : this.isWhatsapp,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonContactRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('kind: $kind, ')
          ..write('value: $value, ')
          ..write('normalizedValue: $normalizedValue, ')
          ..write('label: $label, ')
          ..write('isWhatsapp: $isWhatsapp, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    kind,
    value,
    normalizedValue,
    label,
    isWhatsapp,
    isPrimary,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonContactRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personId == this.personId &&
          other.kind == this.kind &&
          other.value == this.value &&
          other.normalizedValue == this.normalizedValue &&
          other.label == this.label &&
          other.isWhatsapp == this.isWhatsapp &&
          other.isPrimary == this.isPrimary);
}

class PersonContactsCompanion extends UpdateCompanion<PersonContactRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> personId;
  final Value<String> kind;
  final Value<String> value;
  final Value<String?> normalizedValue;
  final Value<String?> label;
  final Value<bool> isWhatsapp;
  final Value<bool> isPrimary;
  final Value<int> rowid;
  const PersonContactsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.kind = const Value.absent(),
    this.value = const Value.absent(),
    this.normalizedValue = const Value.absent(),
    this.label = const Value.absent(),
    this.isWhatsapp = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonContactsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String personId,
    required String kind,
    required String value,
    this.normalizedValue = const Value.absent(),
    this.label = const Value.absent(),
    this.isWhatsapp = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       personId = Value(personId),
       kind = Value(kind),
       value = Value(value);
  static Insertable<PersonContactRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personId,
    Expression<String>? kind,
    Expression<String>? value,
    Expression<String>? normalizedValue,
    Expression<String>? label,
    Expression<bool>? isWhatsapp,
    Expression<bool>? isPrimary,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personId != null) 'person_id': personId,
      if (kind != null) 'kind': kind,
      if (value != null) 'value': value,
      if (normalizedValue != null) 'normalized_value': normalizedValue,
      if (label != null) 'label': label,
      if (isWhatsapp != null) 'is_whatsapp': isWhatsapp,
      if (isPrimary != null) 'is_primary': isPrimary,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonContactsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? personId,
    Value<String>? kind,
    Value<String>? value,
    Value<String?>? normalizedValue,
    Value<String?>? label,
    Value<bool>? isWhatsapp,
    Value<bool>? isPrimary,
    Value<int>? rowid,
  }) {
    return PersonContactsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personId: personId ?? this.personId,
      kind: kind ?? this.kind,
      value: value ?? this.value,
      normalizedValue: normalizedValue ?? this.normalizedValue,
      label: label ?? this.label,
      isWhatsapp: isWhatsapp ?? this.isWhatsapp,
      isPrimary: isPrimary ?? this.isPrimary,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (normalizedValue.present) {
      map['normalized_value'] = Variable<String>(normalizedValue.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (isWhatsapp.present) {
      map['is_whatsapp'] = Variable<bool>(isWhatsapp.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<bool>(isPrimary.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonContactsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('kind: $kind, ')
          ..write('value: $value, ')
          ..write('normalizedValue: $normalizedValue, ')
          ..write('label: $label, ')
          ..write('isWhatsapp: $isWhatsapp, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonAddressesTable extends PersonAddresses with TableInfo<$PersonAddressesTable, PersonAddressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonAddressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('home'),
  );
  static const VerificationMeta _addressLineMeta = const VerificationMeta(
    'addressLine',
  );
  @override
  late final GeneratedColumn<String> addressLine = GeneratedColumn<String>(
    'address_line',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<String> placeId = GeneratedColumn<String>(
    'place_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pincodeMeta = const VerificationMeta(
    'pincode',
  );
  @override
  late final GeneratedColumn<String> pincode = GeneratedColumn<String>(
    'pincode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPrimaryMeta = const VerificationMeta(
    'isPrimary',
  );
  @override
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
    'is_primary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_primary" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    label,
    addressLine,
    placeId,
    pincode,
    latitude,
    longitude,
    isPrimary,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_addresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonAddressRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('address_line')) {
      context.handle(
        _addressLineMeta,
        addressLine.isAcceptableOrUnknown(
          data['address_line']!,
          _addressLineMeta,
        ),
      );
    }
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    }
    if (data.containsKey('pincode')) {
      context.handle(
        _pincodeMeta,
        pincode.isAcceptableOrUnknown(data['pincode']!, _pincodeMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('is_primary')) {
      context.handle(
        _isPrimaryMeta,
        isPrimary.isAcceptableOrUnknown(data['is_primary']!, _isPrimaryMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonAddressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonAddressRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      addressLine: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_line'],
      ),
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_id'],
      ),
      pincode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pincode'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      isPrimary: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_primary'],
      )!,
    );
  }

  @override
  $PersonAddressesTable createAlias(String alias) {
    return $PersonAddressesTable(attachedDatabase, alias);
  }
}

class PersonAddressRow extends DataClass implements Insertable<PersonAddressRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String personId;
  final String label;
  final String? addressLine;
  final String? placeId;
  final String? pincode;
  final double? latitude;
  final double? longitude;
  final bool isPrimary;
  const PersonAddressRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.personId,
    required this.label,
    this.addressLine,
    this.placeId,
    this.pincode,
    this.latitude,
    this.longitude,
    required this.isPrimary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['person_id'] = Variable<String>(personId);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || addressLine != null) {
      map['address_line'] = Variable<String>(addressLine);
    }
    if (!nullToAbsent || placeId != null) {
      map['place_id'] = Variable<String>(placeId);
    }
    if (!nullToAbsent || pincode != null) {
      map['pincode'] = Variable<String>(pincode);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    map['is_primary'] = Variable<bool>(isPrimary);
    return map;
  }

  PersonAddressesCompanion toCompanion(bool nullToAbsent) {
    return PersonAddressesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personId: Value(personId),
      label: Value(label),
      addressLine: addressLine == null && nullToAbsent ? const Value.absent() : Value(addressLine),
      placeId: placeId == null && nullToAbsent ? const Value.absent() : Value(placeId),
      pincode: pincode == null && nullToAbsent ? const Value.absent() : Value(pincode),
      latitude: latitude == null && nullToAbsent ? const Value.absent() : Value(latitude),
      longitude: longitude == null && nullToAbsent ? const Value.absent() : Value(longitude),
      isPrimary: Value(isPrimary),
    );
  }

  factory PersonAddressRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonAddressRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personId: serializer.fromJson<String>(json['person_id']),
      label: serializer.fromJson<String>(json['label']),
      addressLine: serializer.fromJson<String?>(json['address_line']),
      placeId: serializer.fromJson<String?>(json['place_id']),
      pincode: serializer.fromJson<String?>(json['pincode']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      isPrimary: serializer.fromJson<bool>(json['is_primary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_id': serializer.toJson<String>(personId),
      'label': serializer.toJson<String>(label),
      'address_line': serializer.toJson<String?>(addressLine),
      'place_id': serializer.toJson<String?>(placeId),
      'pincode': serializer.toJson<String?>(pincode),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'is_primary': serializer.toJson<bool>(isPrimary),
    };
  }

  PersonAddressRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? personId,
    String? label,
    Value<String?> addressLine = const Value.absent(),
    Value<String?> placeId = const Value.absent(),
    Value<String?> pincode = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    bool? isPrimary,
  }) => PersonAddressRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personId: personId ?? this.personId,
    label: label ?? this.label,
    addressLine: addressLine.present ? addressLine.value : this.addressLine,
    placeId: placeId.present ? placeId.value : this.placeId,
    pincode: pincode.present ? pincode.value : this.pincode,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    isPrimary: isPrimary ?? this.isPrimary,
  );
  PersonAddressRow copyWithCompanion(PersonAddressesCompanion data) {
    return PersonAddressRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personId: data.personId.present ? data.personId.value : this.personId,
      label: data.label.present ? data.label.value : this.label,
      addressLine: data.addressLine.present ? data.addressLine.value : this.addressLine,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      pincode: data.pincode.present ? data.pincode.value : this.pincode,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonAddressRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('label: $label, ')
          ..write('addressLine: $addressLine, ')
          ..write('placeId: $placeId, ')
          ..write('pincode: $pincode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    label,
    addressLine,
    placeId,
    pincode,
    latitude,
    longitude,
    isPrimary,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonAddressRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personId == this.personId &&
          other.label == this.label &&
          other.addressLine == this.addressLine &&
          other.placeId == this.placeId &&
          other.pincode == this.pincode &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.isPrimary == this.isPrimary);
}

class PersonAddressesCompanion extends UpdateCompanion<PersonAddressRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> personId;
  final Value<String> label;
  final Value<String?> addressLine;
  final Value<String?> placeId;
  final Value<String?> pincode;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<bool> isPrimary;
  final Value<int> rowid;
  const PersonAddressesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.label = const Value.absent(),
    this.addressLine = const Value.absent(),
    this.placeId = const Value.absent(),
    this.pincode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonAddressesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String personId,
    this.label = const Value.absent(),
    this.addressLine = const Value.absent(),
    this.placeId = const Value.absent(),
    this.pincode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.isPrimary = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       personId = Value(personId);
  static Insertable<PersonAddressRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personId,
    Expression<String>? label,
    Expression<String>? addressLine,
    Expression<String>? placeId,
    Expression<String>? pincode,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<bool>? isPrimary,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personId != null) 'person_id': personId,
      if (label != null) 'label': label,
      if (addressLine != null) 'address_line': addressLine,
      if (placeId != null) 'place_id': placeId,
      if (pincode != null) 'pincode': pincode,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (isPrimary != null) 'is_primary': isPrimary,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonAddressesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? personId,
    Value<String>? label,
    Value<String?>? addressLine,
    Value<String?>? placeId,
    Value<String?>? pincode,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<bool>? isPrimary,
    Value<int>? rowid,
  }) {
    return PersonAddressesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personId: personId ?? this.personId,
      label: label ?? this.label,
      addressLine: addressLine ?? this.addressLine,
      placeId: placeId ?? this.placeId,
      pincode: pincode ?? this.pincode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isPrimary: isPrimary ?? this.isPrimary,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (addressLine.present) {
      map['address_line'] = Variable<String>(addressLine.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<String>(placeId.value);
    }
    if (pincode.present) {
      map['pincode'] = Variable<String>(pincode.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<bool>(isPrimary.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonAddressesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('label: $label, ')
          ..write('addressLine: $addressLine, ')
          ..write('placeId: $placeId, ')
          ..write('pincode: $pincode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isPrimary: $isPrimary, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonAttributesTable extends PersonAttributes with TableInfo<$PersonAttributesTable, PersonAttributeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonAttributesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    key,
    value,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_attributes';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonAttributeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonAttributeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonAttributeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
    );
  }

  @override
  $PersonAttributesTable createAlias(String alias) {
    return $PersonAttributesTable(attachedDatabase, alias);
  }
}

class PersonAttributeRow extends DataClass implements Insertable<PersonAttributeRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String personId;
  final String key;
  final String? value;
  const PersonAttributeRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.personId,
    required this.key,
    this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['person_id'] = Variable<String>(personId);
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  PersonAttributesCompanion toCompanion(bool nullToAbsent) {
    return PersonAttributesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personId: Value(personId),
      key: Value(key),
      value: value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory PersonAttributeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonAttributeRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personId: serializer.fromJson<String>(json['person_id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_id': serializer.toJson<String>(personId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String?>(value),
    };
  }

  PersonAttributeRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? personId,
    String? key,
    Value<String?> value = const Value.absent(),
  }) => PersonAttributeRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personId: personId ?? this.personId,
    key: key ?? this.key,
    value: value.present ? value.value : this.value,
  );
  PersonAttributeRow copyWithCompanion(PersonAttributesCompanion data) {
    return PersonAttributeRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personId: data.personId.present ? data.personId.value : this.personId,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonAttributeRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    key,
    value,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonAttributeRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personId == this.personId &&
          other.key == this.key &&
          other.value == this.value);
}

class PersonAttributesCompanion extends UpdateCompanion<PersonAttributeRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> personId;
  final Value<String> key;
  final Value<String?> value;
  final Value<int> rowid;
  const PersonAttributesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonAttributesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String personId,
    required String key,
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       personId = Value(personId),
       key = Value(key);
  static Insertable<PersonAttributeRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personId,
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personId != null) 'person_id': personId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonAttributesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? personId,
    Value<String>? key,
    Value<String?>? value,
    Value<int>? rowid,
  }) {
    return PersonAttributesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personId: personId ?? this.personId,
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonAttributesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ParentChildTable extends ParentChild with TableInfo<$ParentChildTable, ParentChildRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParentChildTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('biological'),
  );
  static const VerificationMeta _certaintyMeta = const VerificationMeta(
    'certainty',
  );
  @override
  late final GeneratedColumn<String> certainty = GeneratedColumn<String>(
    'certainty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('confirmed'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    parentId,
    childId,
    kind,
    certainty,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parent_child';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParentChildRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('certainty')) {
      context.handle(
        _certaintyMeta,
        certainty.isAcceptableOrUnknown(data['certainty']!, _certaintyMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParentChildRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParentChildRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      certainty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}certainty'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ParentChildTable createAlias(String alias) {
    return $ParentChildTable(attachedDatabase, alias);
  }
}

class ParentChildRow extends DataClass implements Insertable<ParentChildRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String parentId;
  final String childId;

  /// biological | adoptive | step | foster | guardian
  final String kind;

  /// confirmed | probable | unverified
  final String certainty;
  final String? notes;
  const ParentChildRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.parentId,
    required this.childId,
    required this.kind,
    required this.certainty,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['parent_id'] = Variable<String>(parentId);
    map['child_id'] = Variable<String>(childId);
    map['kind'] = Variable<String>(kind);
    map['certainty'] = Variable<String>(certainty);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ParentChildCompanion toCompanion(bool nullToAbsent) {
    return ParentChildCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      parentId: Value(parentId),
      childId: Value(childId),
      kind: Value(kind),
      certainty: Value(certainty),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory ParentChildRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParentChildRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      parentId: serializer.fromJson<String>(json['parent_id']),
      childId: serializer.fromJson<String>(json['child_id']),
      kind: serializer.fromJson<String>(json['kind']),
      certainty: serializer.fromJson<String>(json['certainty']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'parent_id': serializer.toJson<String>(parentId),
      'child_id': serializer.toJson<String>(childId),
      'kind': serializer.toJson<String>(kind),
      'certainty': serializer.toJson<String>(certainty),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ParentChildRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? parentId,
    String? childId,
    String? kind,
    String? certainty,
    Value<String?> notes = const Value.absent(),
  }) => ParentChildRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    parentId: parentId ?? this.parentId,
    childId: childId ?? this.childId,
    kind: kind ?? this.kind,
    certainty: certainty ?? this.certainty,
    notes: notes.present ? notes.value : this.notes,
  );
  ParentChildRow copyWithCompanion(ParentChildCompanion data) {
    return ParentChildRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      childId: data.childId.present ? data.childId.value : this.childId,
      kind: data.kind.present ? data.kind.value : this.kind,
      certainty: data.certainty.present ? data.certainty.value : this.certainty,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParentChildRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId, ')
          ..write('kind: $kind, ')
          ..write('certainty: $certainty, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    parentId,
    childId,
    kind,
    certainty,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParentChildRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.parentId == this.parentId &&
          other.childId == this.childId &&
          other.kind == this.kind &&
          other.certainty == this.certainty &&
          other.notes == this.notes);
}

class ParentChildCompanion extends UpdateCompanion<ParentChildRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> parentId;
  final Value<String> childId;
  final Value<String> kind;
  final Value<String> certainty;
  final Value<String?> notes;
  final Value<int> rowid;
  const ParentChildCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.parentId = const Value.absent(),
    this.childId = const Value.absent(),
    this.kind = const Value.absent(),
    this.certainty = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ParentChildCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String parentId,
    required String childId,
    this.kind = const Value.absent(),
    this.certainty = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       parentId = Value(parentId),
       childId = Value(childId);
  static Insertable<ParentChildRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? parentId,
    Expression<String>? childId,
    Expression<String>? kind,
    Expression<String>? certainty,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (parentId != null) 'parent_id': parentId,
      if (childId != null) 'child_id': childId,
      if (kind != null) 'kind': kind,
      if (certainty != null) 'certainty': certainty,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ParentChildCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? parentId,
    Value<String>? childId,
    Value<String>? kind,
    Value<String>? certainty,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ParentChildCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      parentId: parentId ?? this.parentId,
      childId: childId ?? this.childId,
      kind: kind ?? this.kind,
      certainty: certainty ?? this.certainty,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (certainty.present) {
      map['certainty'] = Variable<String>(certainty.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParentChildCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId, ')
          ..write('kind: $kind, ')
          ..write('certainty: $certainty, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PartnershipsTable extends Partnerships with TableInfo<$PartnershipsTable, PartnershipRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnershipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personAIdMeta = const VerificationMeta(
    'personAId',
  );
  @override
  late final GeneratedColumn<String> personAId = GeneratedColumn<String>(
    'person_a_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personBIdMeta = const VerificationMeta(
    'personBId',
  );
  @override
  late final GeneratedColumn<String> personBId = GeneratedColumn<String>(
    'person_b_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('marriage'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _startYearMeta = const VerificationMeta(
    'startYear',
  );
  @override
  late final GeneratedColumn<int> startYear = GeneratedColumn<int>(
    'start_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startMonthMeta = const VerificationMeta(
    'startMonth',
  );
  @override
  late final GeneratedColumn<int> startMonth = GeneratedColumn<int>(
    'start_month',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDayMeta = const VerificationMeta(
    'startDay',
  );
  @override
  late final GeneratedColumn<int> startDay = GeneratedColumn<int>(
    'start_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateApproxMeta = const VerificationMeta(
    'startDateApprox',
  );
  @override
  late final GeneratedColumn<bool> startDateApprox = GeneratedColumn<bool>(
    'start_date_approx',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("start_date_approx" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _endYearMeta = const VerificationMeta(
    'endYear',
  );
  @override
  late final GeneratedColumn<int> endYear = GeneratedColumn<int>(
    'end_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<String> placeId = GeneratedColumn<String>(
    'place_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personAId,
    personBId,
    kind,
    status,
    startYear,
    startMonth,
    startDay,
    startDateApprox,
    endYear,
    placeId,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partnerships';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartnershipRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_a_id')) {
      context.handle(
        _personAIdMeta,
        personAId.isAcceptableOrUnknown(data['person_a_id']!, _personAIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personAIdMeta);
    }
    if (data.containsKey('person_b_id')) {
      context.handle(
        _personBIdMeta,
        personBId.isAcceptableOrUnknown(data['person_b_id']!, _personBIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personBIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('start_year')) {
      context.handle(
        _startYearMeta,
        startYear.isAcceptableOrUnknown(data['start_year']!, _startYearMeta),
      );
    }
    if (data.containsKey('start_month')) {
      context.handle(
        _startMonthMeta,
        startMonth.isAcceptableOrUnknown(data['start_month']!, _startMonthMeta),
      );
    }
    if (data.containsKey('start_day')) {
      context.handle(
        _startDayMeta,
        startDay.isAcceptableOrUnknown(data['start_day']!, _startDayMeta),
      );
    }
    if (data.containsKey('start_date_approx')) {
      context.handle(
        _startDateApproxMeta,
        startDateApprox.isAcceptableOrUnknown(
          data['start_date_approx']!,
          _startDateApproxMeta,
        ),
      );
    }
    if (data.containsKey('end_year')) {
      context.handle(
        _endYearMeta,
        endYear.isAcceptableOrUnknown(data['end_year']!, _endYearMeta),
      );
    }
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PartnershipRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartnershipRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personAId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_a_id'],
      )!,
      personBId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_b_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      startYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_year'],
      ),
      startMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_month'],
      ),
      startDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_day'],
      ),
      startDateApprox: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}start_date_approx'],
      )!,
      endYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_year'],
      ),
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $PartnershipsTable createAlias(String alias) {
    return $PartnershipsTable(attachedDatabase, alias);
  }
}

class PartnershipRow extends DataClass implements Insertable<PartnershipRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String personAId;
  final String personBId;
  final String kind;
  final String status;
  final int? startYear;
  final int? startMonth;
  final int? startDay;
  final bool startDateApprox;
  final int? endYear;
  final String? placeId;
  final String? notes;
  const PartnershipRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.personAId,
    required this.personBId,
    required this.kind,
    required this.status,
    this.startYear,
    this.startMonth,
    this.startDay,
    required this.startDateApprox,
    this.endYear,
    this.placeId,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['person_a_id'] = Variable<String>(personAId);
    map['person_b_id'] = Variable<String>(personBId);
    map['kind'] = Variable<String>(kind);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || startYear != null) {
      map['start_year'] = Variable<int>(startYear);
    }
    if (!nullToAbsent || startMonth != null) {
      map['start_month'] = Variable<int>(startMonth);
    }
    if (!nullToAbsent || startDay != null) {
      map['start_day'] = Variable<int>(startDay);
    }
    map['start_date_approx'] = Variable<bool>(startDateApprox);
    if (!nullToAbsent || endYear != null) {
      map['end_year'] = Variable<int>(endYear);
    }
    if (!nullToAbsent || placeId != null) {
      map['place_id'] = Variable<String>(placeId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PartnershipsCompanion toCompanion(bool nullToAbsent) {
    return PartnershipsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personAId: Value(personAId),
      personBId: Value(personBId),
      kind: Value(kind),
      status: Value(status),
      startYear: startYear == null && nullToAbsent ? const Value.absent() : Value(startYear),
      startMonth: startMonth == null && nullToAbsent ? const Value.absent() : Value(startMonth),
      startDay: startDay == null && nullToAbsent ? const Value.absent() : Value(startDay),
      startDateApprox: Value(startDateApprox),
      endYear: endYear == null && nullToAbsent ? const Value.absent() : Value(endYear),
      placeId: placeId == null && nullToAbsent ? const Value.absent() : Value(placeId),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory PartnershipRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartnershipRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personAId: serializer.fromJson<String>(json['person_a_id']),
      personBId: serializer.fromJson<String>(json['person_b_id']),
      kind: serializer.fromJson<String>(json['kind']),
      status: serializer.fromJson<String>(json['status']),
      startYear: serializer.fromJson<int?>(json['start_year']),
      startMonth: serializer.fromJson<int?>(json['start_month']),
      startDay: serializer.fromJson<int?>(json['start_day']),
      startDateApprox: serializer.fromJson<bool>(json['start_date_approx']),
      endYear: serializer.fromJson<int?>(json['end_year']),
      placeId: serializer.fromJson<String?>(json['place_id']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_a_id': serializer.toJson<String>(personAId),
      'person_b_id': serializer.toJson<String>(personBId),
      'kind': serializer.toJson<String>(kind),
      'status': serializer.toJson<String>(status),
      'start_year': serializer.toJson<int?>(startYear),
      'start_month': serializer.toJson<int?>(startMonth),
      'start_day': serializer.toJson<int?>(startDay),
      'start_date_approx': serializer.toJson<bool>(startDateApprox),
      'end_year': serializer.toJson<int?>(endYear),
      'place_id': serializer.toJson<String?>(placeId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  PartnershipRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? personAId,
    String? personBId,
    String? kind,
    String? status,
    Value<int?> startYear = const Value.absent(),
    Value<int?> startMonth = const Value.absent(),
    Value<int?> startDay = const Value.absent(),
    bool? startDateApprox,
    Value<int?> endYear = const Value.absent(),
    Value<String?> placeId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => PartnershipRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personAId: personAId ?? this.personAId,
    personBId: personBId ?? this.personBId,
    kind: kind ?? this.kind,
    status: status ?? this.status,
    startYear: startYear.present ? startYear.value : this.startYear,
    startMonth: startMonth.present ? startMonth.value : this.startMonth,
    startDay: startDay.present ? startDay.value : this.startDay,
    startDateApprox: startDateApprox ?? this.startDateApprox,
    endYear: endYear.present ? endYear.value : this.endYear,
    placeId: placeId.present ? placeId.value : this.placeId,
    notes: notes.present ? notes.value : this.notes,
  );
  PartnershipRow copyWithCompanion(PartnershipsCompanion data) {
    return PartnershipRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personAId: data.personAId.present ? data.personAId.value : this.personAId,
      personBId: data.personBId.present ? data.personBId.value : this.personBId,
      kind: data.kind.present ? data.kind.value : this.kind,
      status: data.status.present ? data.status.value : this.status,
      startYear: data.startYear.present ? data.startYear.value : this.startYear,
      startMonth: data.startMonth.present ? data.startMonth.value : this.startMonth,
      startDay: data.startDay.present ? data.startDay.value : this.startDay,
      startDateApprox: data.startDateApprox.present ? data.startDateApprox.value : this.startDateApprox,
      endYear: data.endYear.present ? data.endYear.value : this.endYear,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartnershipRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personAId: $personAId, ')
          ..write('personBId: $personBId, ')
          ..write('kind: $kind, ')
          ..write('status: $status, ')
          ..write('startYear: $startYear, ')
          ..write('startMonth: $startMonth, ')
          ..write('startDay: $startDay, ')
          ..write('startDateApprox: $startDateApprox, ')
          ..write('endYear: $endYear, ')
          ..write('placeId: $placeId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personAId,
    personBId,
    kind,
    status,
    startYear,
    startMonth,
    startDay,
    startDateApprox,
    endYear,
    placeId,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartnershipRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personAId == this.personAId &&
          other.personBId == this.personBId &&
          other.kind == this.kind &&
          other.status == this.status &&
          other.startYear == this.startYear &&
          other.startMonth == this.startMonth &&
          other.startDay == this.startDay &&
          other.startDateApprox == this.startDateApprox &&
          other.endYear == this.endYear &&
          other.placeId == this.placeId &&
          other.notes == this.notes);
}

class PartnershipsCompanion extends UpdateCompanion<PartnershipRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> personAId;
  final Value<String> personBId;
  final Value<String> kind;
  final Value<String> status;
  final Value<int?> startYear;
  final Value<int?> startMonth;
  final Value<int?> startDay;
  final Value<bool> startDateApprox;
  final Value<int?> endYear;
  final Value<String?> placeId;
  final Value<String?> notes;
  final Value<int> rowid;
  const PartnershipsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personAId = const Value.absent(),
    this.personBId = const Value.absent(),
    this.kind = const Value.absent(),
    this.status = const Value.absent(),
    this.startYear = const Value.absent(),
    this.startMonth = const Value.absent(),
    this.startDay = const Value.absent(),
    this.startDateApprox = const Value.absent(),
    this.endYear = const Value.absent(),
    this.placeId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PartnershipsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String personAId,
    required String personBId,
    this.kind = const Value.absent(),
    this.status = const Value.absent(),
    this.startYear = const Value.absent(),
    this.startMonth = const Value.absent(),
    this.startDay = const Value.absent(),
    this.startDateApprox = const Value.absent(),
    this.endYear = const Value.absent(),
    this.placeId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       personAId = Value(personAId),
       personBId = Value(personBId);
  static Insertable<PartnershipRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personAId,
    Expression<String>? personBId,
    Expression<String>? kind,
    Expression<String>? status,
    Expression<int>? startYear,
    Expression<int>? startMonth,
    Expression<int>? startDay,
    Expression<bool>? startDateApprox,
    Expression<int>? endYear,
    Expression<String>? placeId,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personAId != null) 'person_a_id': personAId,
      if (personBId != null) 'person_b_id': personBId,
      if (kind != null) 'kind': kind,
      if (status != null) 'status': status,
      if (startYear != null) 'start_year': startYear,
      if (startMonth != null) 'start_month': startMonth,
      if (startDay != null) 'start_day': startDay,
      if (startDateApprox != null) 'start_date_approx': startDateApprox,
      if (endYear != null) 'end_year': endYear,
      if (placeId != null) 'place_id': placeId,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PartnershipsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? personAId,
    Value<String>? personBId,
    Value<String>? kind,
    Value<String>? status,
    Value<int?>? startYear,
    Value<int?>? startMonth,
    Value<int?>? startDay,
    Value<bool>? startDateApprox,
    Value<int?>? endYear,
    Value<String?>? placeId,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return PartnershipsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personAId: personAId ?? this.personAId,
      personBId: personBId ?? this.personBId,
      kind: kind ?? this.kind,
      status: status ?? this.status,
      startYear: startYear ?? this.startYear,
      startMonth: startMonth ?? this.startMonth,
      startDay: startDay ?? this.startDay,
      startDateApprox: startDateApprox ?? this.startDateApprox,
      endYear: endYear ?? this.endYear,
      placeId: placeId ?? this.placeId,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personAId.present) {
      map['person_a_id'] = Variable<String>(personAId.value);
    }
    if (personBId.present) {
      map['person_b_id'] = Variable<String>(personBId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (startYear.present) {
      map['start_year'] = Variable<int>(startYear.value);
    }
    if (startMonth.present) {
      map['start_month'] = Variable<int>(startMonth.value);
    }
    if (startDay.present) {
      map['start_day'] = Variable<int>(startDay.value);
    }
    if (startDateApprox.present) {
      map['start_date_approx'] = Variable<bool>(startDateApprox.value);
    }
    if (endYear.present) {
      map['end_year'] = Variable<int>(endYear.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<String>(placeId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnershipsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personAId: $personAId, ')
          ..write('personBId: $personBId, ')
          ..write('kind: $kind, ')
          ..write('status: $status, ')
          ..write('startYear: $startYear, ')
          ..write('startMonth: $startMonth, ')
          ..write('startDay: $startDay, ')
          ..write('startDateApprox: $startDateApprox, ')
          ..write('endYear: $endYear, ')
          ..write('placeId: $placeId, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SocialConnectionsTable extends SocialConnections with TableInfo<$SocialConnectionsTable, SocialConnectionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SocialConnectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _otherPersonIdMeta = const VerificationMeta(
    'otherPersonId',
  );
  @override
  late final GeneratedColumn<String> otherPersonId = GeneratedColumn<String>(
    'other_person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _connectionTypeMeta = const VerificationMeta(
    'connectionType',
  );
  @override
  late final GeneratedColumn<String> connectionType = GeneratedColumn<String>(
    'connection_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sinceYearMeta = const VerificationMeta(
    'sinceYear',
  );
  @override
  late final GeneratedColumn<int> sinceYear = GeneratedColumn<int>(
    'since_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    otherPersonId,
    connectionType,
    description,
    sinceYear,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'social_connections';
  @override
  VerificationContext validateIntegrity(
    Insertable<SocialConnectionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('other_person_id')) {
      context.handle(
        _otherPersonIdMeta,
        otherPersonId.isAcceptableOrUnknown(
          data['other_person_id']!,
          _otherPersonIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_otherPersonIdMeta);
    }
    if (data.containsKey('connection_type')) {
      context.handle(
        _connectionTypeMeta,
        connectionType.isAcceptableOrUnknown(
          data['connection_type']!,
          _connectionTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_connectionTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('since_year')) {
      context.handle(
        _sinceYearMeta,
        sinceYear.isAcceptableOrUnknown(data['since_year']!, _sinceYearMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SocialConnectionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SocialConnectionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      otherPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}other_person_id'],
      )!,
      connectionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}connection_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      sinceYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}since_year'],
      ),
    );
  }

  @override
  $SocialConnectionsTable createAlias(String alias) {
    return $SocialConnectionsTable(attachedDatabase, alias);
  }
}

class SocialConnectionRow extends DataClass implements Insertable<SocialConnectionRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String personId;
  final String otherPersonId;
  final String connectionType;
  final String? description;
  final int? sinceYear;
  const SocialConnectionRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.personId,
    required this.otherPersonId,
    required this.connectionType,
    this.description,
    this.sinceYear,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['person_id'] = Variable<String>(personId);
    map['other_person_id'] = Variable<String>(otherPersonId);
    map['connection_type'] = Variable<String>(connectionType);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || sinceYear != null) {
      map['since_year'] = Variable<int>(sinceYear);
    }
    return map;
  }

  SocialConnectionsCompanion toCompanion(bool nullToAbsent) {
    return SocialConnectionsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personId: Value(personId),
      otherPersonId: Value(otherPersonId),
      connectionType: Value(connectionType),
      description: description == null && nullToAbsent ? const Value.absent() : Value(description),
      sinceYear: sinceYear == null && nullToAbsent ? const Value.absent() : Value(sinceYear),
    );
  }

  factory SocialConnectionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SocialConnectionRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personId: serializer.fromJson<String>(json['person_id']),
      otherPersonId: serializer.fromJson<String>(json['other_person_id']),
      connectionType: serializer.fromJson<String>(json['connection_type']),
      description: serializer.fromJson<String?>(json['description']),
      sinceYear: serializer.fromJson<int?>(json['since_year']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_id': serializer.toJson<String>(personId),
      'other_person_id': serializer.toJson<String>(otherPersonId),
      'connection_type': serializer.toJson<String>(connectionType),
      'description': serializer.toJson<String?>(description),
      'since_year': serializer.toJson<int?>(sinceYear),
    };
  }

  SocialConnectionRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? personId,
    String? otherPersonId,
    String? connectionType,
    Value<String?> description = const Value.absent(),
    Value<int?> sinceYear = const Value.absent(),
  }) => SocialConnectionRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personId: personId ?? this.personId,
    otherPersonId: otherPersonId ?? this.otherPersonId,
    connectionType: connectionType ?? this.connectionType,
    description: description.present ? description.value : this.description,
    sinceYear: sinceYear.present ? sinceYear.value : this.sinceYear,
  );
  SocialConnectionRow copyWithCompanion(SocialConnectionsCompanion data) {
    return SocialConnectionRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personId: data.personId.present ? data.personId.value : this.personId,
      otherPersonId: data.otherPersonId.present ? data.otherPersonId.value : this.otherPersonId,
      connectionType: data.connectionType.present ? data.connectionType.value : this.connectionType,
      description: data.description.present ? data.description.value : this.description,
      sinceYear: data.sinceYear.present ? data.sinceYear.value : this.sinceYear,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SocialConnectionRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('otherPersonId: $otherPersonId, ')
          ..write('connectionType: $connectionType, ')
          ..write('description: $description, ')
          ..write('sinceYear: $sinceYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    otherPersonId,
    connectionType,
    description,
    sinceYear,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocialConnectionRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personId == this.personId &&
          other.otherPersonId == this.otherPersonId &&
          other.connectionType == this.connectionType &&
          other.description == this.description &&
          other.sinceYear == this.sinceYear);
}

class SocialConnectionsCompanion extends UpdateCompanion<SocialConnectionRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> personId;
  final Value<String> otherPersonId;
  final Value<String> connectionType;
  final Value<String?> description;
  final Value<int?> sinceYear;
  final Value<int> rowid;
  const SocialConnectionsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.otherPersonId = const Value.absent(),
    this.connectionType = const Value.absent(),
    this.description = const Value.absent(),
    this.sinceYear = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SocialConnectionsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String personId,
    required String otherPersonId,
    required String connectionType,
    this.description = const Value.absent(),
    this.sinceYear = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       personId = Value(personId),
       otherPersonId = Value(otherPersonId),
       connectionType = Value(connectionType);
  static Insertable<SocialConnectionRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personId,
    Expression<String>? otherPersonId,
    Expression<String>? connectionType,
    Expression<String>? description,
    Expression<int>? sinceYear,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personId != null) 'person_id': personId,
      if (otherPersonId != null) 'other_person_id': otherPersonId,
      if (connectionType != null) 'connection_type': connectionType,
      if (description != null) 'description': description,
      if (sinceYear != null) 'since_year': sinceYear,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SocialConnectionsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? personId,
    Value<String>? otherPersonId,
    Value<String>? connectionType,
    Value<String?>? description,
    Value<int?>? sinceYear,
    Value<int>? rowid,
  }) {
    return SocialConnectionsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personId: personId ?? this.personId,
      otherPersonId: otherPersonId ?? this.otherPersonId,
      connectionType: connectionType ?? this.connectionType,
      description: description ?? this.description,
      sinceYear: sinceYear ?? this.sinceYear,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (otherPersonId.present) {
      map['other_person_id'] = Variable<String>(otherPersonId.value);
    }
    if (connectionType.present) {
      map['connection_type'] = Variable<String>(connectionType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sinceYear.present) {
      map['since_year'] = Variable<int>(sinceYear.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SocialConnectionsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('otherPersonId: $otherPersonId, ')
          ..write('connectionType: $connectionType, ')
          ..write('description: $description, ')
          ..write('sinceYear: $sinceYear, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FamilyGroupsTable extends FamilyGroups with TableInfo<$FamilyGroupsTable, FamilyGroupRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FamilyGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameAltMeta = const VerificationMeta(
    'nameAlt',
  );
  @override
  late final GeneratedColumn<String> nameAlt = GeneratedColumn<String>(
    'name_alt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gotraMeta = const VerificationMeta('gotra');
  @override
  late final GeneratedColumn<String> gotra = GeneratedColumn<String>(
    'gotra',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kuldevtaMeta = const VerificationMeta(
    'kuldevta',
  );
  @override
  late final GeneratedColumn<String> kuldevta = GeneratedColumn<String>(
    'kuldevta',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nativePlaceIdMeta = const VerificationMeta(
    'nativePlaceId',
  );
  @override
  late final GeneratedColumn<String> nativePlaceId = GeneratedColumn<String>(
    'native_place_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _headPersonIdMeta = const VerificationMeta(
    'headPersonId',
  );
  @override
  late final GeneratedColumn<String> headPersonId = GeneratedColumn<String>(
    'head_person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    name,
    nameAlt,
    gotra,
    kuldevta,
    nativePlaceId,
    headPersonId,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'family_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<FamilyGroupRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_alt')) {
      context.handle(
        _nameAltMeta,
        nameAlt.isAcceptableOrUnknown(data['name_alt']!, _nameAltMeta),
      );
    }
    if (data.containsKey('gotra')) {
      context.handle(
        _gotraMeta,
        gotra.isAcceptableOrUnknown(data['gotra']!, _gotraMeta),
      );
    }
    if (data.containsKey('kuldevta')) {
      context.handle(
        _kuldevtaMeta,
        kuldevta.isAcceptableOrUnknown(data['kuldevta']!, _kuldevtaMeta),
      );
    }
    if (data.containsKey('native_place_id')) {
      context.handle(
        _nativePlaceIdMeta,
        nativePlaceId.isAcceptableOrUnknown(
          data['native_place_id']!,
          _nativePlaceIdMeta,
        ),
      );
    }
    if (data.containsKey('head_person_id')) {
      context.handle(
        _headPersonIdMeta,
        headPersonId.isAcceptableOrUnknown(
          data['head_person_id']!,
          _headPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FamilyGroupRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FamilyGroupRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameAlt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_alt'],
      ),
      gotra: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gotra'],
      ),
      kuldevta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kuldevta'],
      ),
      nativePlaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}native_place_id'],
      ),
      headPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}head_person_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $FamilyGroupsTable createAlias(String alias) {
    return $FamilyGroupsTable(attachedDatabase, alias);
  }
}

class FamilyGroupRow extends DataClass implements Insertable<FamilyGroupRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String name;
  final String? nameAlt;
  final String? gotra;
  final String? kuldevta;
  final String? nativePlaceId;
  final String? headPersonId;
  final String? notes;
  const FamilyGroupRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.name,
    this.nameAlt,
    this.gotra,
    this.kuldevta,
    this.nativePlaceId,
    this.headPersonId,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nameAlt != null) {
      map['name_alt'] = Variable<String>(nameAlt);
    }
    if (!nullToAbsent || gotra != null) {
      map['gotra'] = Variable<String>(gotra);
    }
    if (!nullToAbsent || kuldevta != null) {
      map['kuldevta'] = Variable<String>(kuldevta);
    }
    if (!nullToAbsent || nativePlaceId != null) {
      map['native_place_id'] = Variable<String>(nativePlaceId);
    }
    if (!nullToAbsent || headPersonId != null) {
      map['head_person_id'] = Variable<String>(headPersonId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  FamilyGroupsCompanion toCompanion(bool nullToAbsent) {
    return FamilyGroupsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      name: Value(name),
      nameAlt: nameAlt == null && nullToAbsent ? const Value.absent() : Value(nameAlt),
      gotra: gotra == null && nullToAbsent ? const Value.absent() : Value(gotra),
      kuldevta: kuldevta == null && nullToAbsent ? const Value.absent() : Value(kuldevta),
      nativePlaceId: nativePlaceId == null && nullToAbsent ? const Value.absent() : Value(nativePlaceId),
      headPersonId: headPersonId == null && nullToAbsent ? const Value.absent() : Value(headPersonId),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory FamilyGroupRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FamilyGroupRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      name: serializer.fromJson<String>(json['name']),
      nameAlt: serializer.fromJson<String?>(json['name_alt']),
      gotra: serializer.fromJson<String?>(json['gotra']),
      kuldevta: serializer.fromJson<String?>(json['kuldevta']),
      nativePlaceId: serializer.fromJson<String?>(json['native_place_id']),
      headPersonId: serializer.fromJson<String?>(json['head_person_id']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'name': serializer.toJson<String>(name),
      'name_alt': serializer.toJson<String?>(nameAlt),
      'gotra': serializer.toJson<String?>(gotra),
      'kuldevta': serializer.toJson<String?>(kuldevta),
      'native_place_id': serializer.toJson<String?>(nativePlaceId),
      'head_person_id': serializer.toJson<String?>(headPersonId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  FamilyGroupRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? name,
    Value<String?> nameAlt = const Value.absent(),
    Value<String?> gotra = const Value.absent(),
    Value<String?> kuldevta = const Value.absent(),
    Value<String?> nativePlaceId = const Value.absent(),
    Value<String?> headPersonId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => FamilyGroupRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    name: name ?? this.name,
    nameAlt: nameAlt.present ? nameAlt.value : this.nameAlt,
    gotra: gotra.present ? gotra.value : this.gotra,
    kuldevta: kuldevta.present ? kuldevta.value : this.kuldevta,
    nativePlaceId: nativePlaceId.present ? nativePlaceId.value : this.nativePlaceId,
    headPersonId: headPersonId.present ? headPersonId.value : this.headPersonId,
    notes: notes.present ? notes.value : this.notes,
  );
  FamilyGroupRow copyWithCompanion(FamilyGroupsCompanion data) {
    return FamilyGroupRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      name: data.name.present ? data.name.value : this.name,
      nameAlt: data.nameAlt.present ? data.nameAlt.value : this.nameAlt,
      gotra: data.gotra.present ? data.gotra.value : this.gotra,
      kuldevta: data.kuldevta.present ? data.kuldevta.value : this.kuldevta,
      nativePlaceId: data.nativePlaceId.present ? data.nativePlaceId.value : this.nativePlaceId,
      headPersonId: data.headPersonId.present ? data.headPersonId.value : this.headPersonId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FamilyGroupRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('name: $name, ')
          ..write('nameAlt: $nameAlt, ')
          ..write('gotra: $gotra, ')
          ..write('kuldevta: $kuldevta, ')
          ..write('nativePlaceId: $nativePlaceId, ')
          ..write('headPersonId: $headPersonId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    name,
    nameAlt,
    gotra,
    kuldevta,
    nativePlaceId,
    headPersonId,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FamilyGroupRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.name == this.name &&
          other.nameAlt == this.nameAlt &&
          other.gotra == this.gotra &&
          other.kuldevta == this.kuldevta &&
          other.nativePlaceId == this.nativePlaceId &&
          other.headPersonId == this.headPersonId &&
          other.notes == this.notes);
}

class FamilyGroupsCompanion extends UpdateCompanion<FamilyGroupRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> name;
  final Value<String?> nameAlt;
  final Value<String?> gotra;
  final Value<String?> kuldevta;
  final Value<String?> nativePlaceId;
  final Value<String?> headPersonId;
  final Value<String?> notes;
  final Value<int> rowid;
  const FamilyGroupsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.name = const Value.absent(),
    this.nameAlt = const Value.absent(),
    this.gotra = const Value.absent(),
    this.kuldevta = const Value.absent(),
    this.nativePlaceId = const Value.absent(),
    this.headPersonId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FamilyGroupsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String name,
    this.nameAlt = const Value.absent(),
    this.gotra = const Value.absent(),
    this.kuldevta = const Value.absent(),
    this.nativePlaceId = const Value.absent(),
    this.headPersonId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       name = Value(name);
  static Insertable<FamilyGroupRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? name,
    Expression<String>? nameAlt,
    Expression<String>? gotra,
    Expression<String>? kuldevta,
    Expression<String>? nativePlaceId,
    Expression<String>? headPersonId,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (name != null) 'name': name,
      if (nameAlt != null) 'name_alt': nameAlt,
      if (gotra != null) 'gotra': gotra,
      if (kuldevta != null) 'kuldevta': kuldevta,
      if (nativePlaceId != null) 'native_place_id': nativePlaceId,
      if (headPersonId != null) 'head_person_id': headPersonId,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FamilyGroupsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? name,
    Value<String?>? nameAlt,
    Value<String?>? gotra,
    Value<String?>? kuldevta,
    Value<String?>? nativePlaceId,
    Value<String?>? headPersonId,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return FamilyGroupsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      name: name ?? this.name,
      nameAlt: nameAlt ?? this.nameAlt,
      gotra: gotra ?? this.gotra,
      kuldevta: kuldevta ?? this.kuldevta,
      nativePlaceId: nativePlaceId ?? this.nativePlaceId,
      headPersonId: headPersonId ?? this.headPersonId,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameAlt.present) {
      map['name_alt'] = Variable<String>(nameAlt.value);
    }
    if (gotra.present) {
      map['gotra'] = Variable<String>(gotra.value);
    }
    if (kuldevta.present) {
      map['kuldevta'] = Variable<String>(kuldevta.value);
    }
    if (nativePlaceId.present) {
      map['native_place_id'] = Variable<String>(nativePlaceId.value);
    }
    if (headPersonId.present) {
      map['head_person_id'] = Variable<String>(headPersonId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamilyGroupsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('name: $name, ')
          ..write('nameAlt: $nameAlt, ')
          ..write('gotra: $gotra, ')
          ..write('kuldevta: $kuldevta, ')
          ..write('nativePlaceId: $nativePlaceId, ')
          ..write('headPersonId: $headPersonId, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FamilyGroupMembersTable extends FamilyGroupMembers
    with TableInfo<$FamilyGroupMembersTable, FamilyGroupMemberRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FamilyGroupMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _familyGroupIdMeta = const VerificationMeta(
    'familyGroupId',
  );
  @override
  late final GeneratedColumn<String> familyGroupId = GeneratedColumn<String>(
    'family_group_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    familyGroupId,
    personId,
    role,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'family_group_members';
  @override
  VerificationContext validateIntegrity(
    Insertable<FamilyGroupMemberRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('family_group_id')) {
      context.handle(
        _familyGroupIdMeta,
        familyGroupId.isAcceptableOrUnknown(
          data['family_group_id']!,
          _familyGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_familyGroupIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FamilyGroupMemberRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FamilyGroupMemberRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      familyGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}family_group_id'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      ),
    );
  }

  @override
  $FamilyGroupMembersTable createAlias(String alias) {
    return $FamilyGroupMembersTable(attachedDatabase, alias);
  }
}

class FamilyGroupMemberRow extends DataClass implements Insertable<FamilyGroupMemberRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String familyGroupId;
  final String personId;
  final String? role;
  const FamilyGroupMemberRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.familyGroupId,
    required this.personId,
    this.role,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['family_group_id'] = Variable<String>(familyGroupId);
    map['person_id'] = Variable<String>(personId);
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    return map;
  }

  FamilyGroupMembersCompanion toCompanion(bool nullToAbsent) {
    return FamilyGroupMembersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      familyGroupId: Value(familyGroupId),
      personId: Value(personId),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
    );
  }

  factory FamilyGroupMemberRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FamilyGroupMemberRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      familyGroupId: serializer.fromJson<String>(json['family_group_id']),
      personId: serializer.fromJson<String>(json['person_id']),
      role: serializer.fromJson<String?>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'family_group_id': serializer.toJson<String>(familyGroupId),
      'person_id': serializer.toJson<String>(personId),
      'role': serializer.toJson<String?>(role),
    };
  }

  FamilyGroupMemberRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? familyGroupId,
    String? personId,
    Value<String?> role = const Value.absent(),
  }) => FamilyGroupMemberRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    familyGroupId: familyGroupId ?? this.familyGroupId,
    personId: personId ?? this.personId,
    role: role.present ? role.value : this.role,
  );
  FamilyGroupMemberRow copyWithCompanion(FamilyGroupMembersCompanion data) {
    return FamilyGroupMemberRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      familyGroupId: data.familyGroupId.present ? data.familyGroupId.value : this.familyGroupId,
      personId: data.personId.present ? data.personId.value : this.personId,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FamilyGroupMemberRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('familyGroupId: $familyGroupId, ')
          ..write('personId: $personId, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    familyGroupId,
    personId,
    role,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FamilyGroupMemberRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.familyGroupId == this.familyGroupId &&
          other.personId == this.personId &&
          other.role == this.role);
}

class FamilyGroupMembersCompanion extends UpdateCompanion<FamilyGroupMemberRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> familyGroupId;
  final Value<String> personId;
  final Value<String?> role;
  final Value<int> rowid;
  const FamilyGroupMembersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.familyGroupId = const Value.absent(),
    this.personId = const Value.absent(),
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FamilyGroupMembersCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String familyGroupId,
    required String personId,
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       familyGroupId = Value(familyGroupId),
       personId = Value(personId);
  static Insertable<FamilyGroupMemberRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? familyGroupId,
    Expression<String>? personId,
    Expression<String>? role,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (familyGroupId != null) 'family_group_id': familyGroupId,
      if (personId != null) 'person_id': personId,
      if (role != null) 'role': role,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FamilyGroupMembersCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? familyGroupId,
    Value<String>? personId,
    Value<String?>? role,
    Value<int>? rowid,
  }) {
    return FamilyGroupMembersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      familyGroupId: familyGroupId ?? this.familyGroupId,
      personId: personId ?? this.personId,
      role: role ?? this.role,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (familyGroupId.present) {
      map['family_group_id'] = Variable<String>(familyGroupId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamilyGroupMembersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('familyGroupId: $familyGroupId, ')
          ..write('personId: $personId, ')
          ..write('role: $role, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonMergesTable extends PersonMerges with TableInfo<$PersonMergesTable, PersonMergeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonMergesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _survivorIdMeta = const VerificationMeta(
    'survivorId',
  );
  @override
  late final GeneratedColumn<String> survivorId = GeneratedColumn<String>(
    'survivor_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mergedIdMeta = const VerificationMeta(
    'mergedId',
  );
  @override
  late final GeneratedColumn<String> mergedId = GeneratedColumn<String>(
    'merged_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _snapshotMeta = const VerificationMeta(
    'snapshot',
  );
  @override
  late final GeneratedColumn<String> snapshot = GeneratedColumn<String>(
    'snapshot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    survivorId,
    mergedId,
    snapshot,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_merges';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonMergeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('survivor_id')) {
      context.handle(
        _survivorIdMeta,
        survivorId.isAcceptableOrUnknown(data['survivor_id']!, _survivorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_survivorIdMeta);
    }
    if (data.containsKey('merged_id')) {
      context.handle(
        _mergedIdMeta,
        mergedId.isAcceptableOrUnknown(data['merged_id']!, _mergedIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mergedIdMeta);
    }
    if (data.containsKey('snapshot')) {
      context.handle(
        _snapshotMeta,
        snapshot.isAcceptableOrUnknown(data['snapshot']!, _snapshotMeta),
      );
    } else if (isInserting) {
      context.missing(_snapshotMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonMergeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonMergeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      survivorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}survivor_id'],
      )!,
      mergedId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merged_id'],
      )!,
      snapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}snapshot'],
      )!,
    );
  }

  @override
  $PersonMergesTable createAlias(String alias) {
    return $PersonMergesTable(attachedDatabase, alias);
  }
}

class PersonMergeRow extends DataClass implements Insertable<PersonMergeRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String survivorId;
  final String mergedId;

  /// JSON snapshot of the merged person and moved edge ids (for undo).
  final String snapshot;
  const PersonMergeRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.survivorId,
    required this.mergedId,
    required this.snapshot,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['survivor_id'] = Variable<String>(survivorId);
    map['merged_id'] = Variable<String>(mergedId);
    map['snapshot'] = Variable<String>(snapshot);
    return map;
  }

  PersonMergesCompanion toCompanion(bool nullToAbsent) {
    return PersonMergesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      survivorId: Value(survivorId),
      mergedId: Value(mergedId),
      snapshot: Value(snapshot),
    );
  }

  factory PersonMergeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonMergeRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      survivorId: serializer.fromJson<String>(json['survivor_id']),
      mergedId: serializer.fromJson<String>(json['merged_id']),
      snapshot: serializer.fromJson<String>(json['snapshot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'survivor_id': serializer.toJson<String>(survivorId),
      'merged_id': serializer.toJson<String>(mergedId),
      'snapshot': serializer.toJson<String>(snapshot),
    };
  }

  PersonMergeRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? survivorId,
    String? mergedId,
    String? snapshot,
  }) => PersonMergeRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    survivorId: survivorId ?? this.survivorId,
    mergedId: mergedId ?? this.mergedId,
    snapshot: snapshot ?? this.snapshot,
  );
  PersonMergeRow copyWithCompanion(PersonMergesCompanion data) {
    return PersonMergeRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      survivorId: data.survivorId.present ? data.survivorId.value : this.survivorId,
      mergedId: data.mergedId.present ? data.mergedId.value : this.mergedId,
      snapshot: data.snapshot.present ? data.snapshot.value : this.snapshot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonMergeRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('survivorId: $survivorId, ')
          ..write('mergedId: $mergedId, ')
          ..write('snapshot: $snapshot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    survivorId,
    mergedId,
    snapshot,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonMergeRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.survivorId == this.survivorId &&
          other.mergedId == this.mergedId &&
          other.snapshot == this.snapshot);
}

class PersonMergesCompanion extends UpdateCompanion<PersonMergeRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> survivorId;
  final Value<String> mergedId;
  final Value<String> snapshot;
  final Value<int> rowid;
  const PersonMergesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.survivorId = const Value.absent(),
    this.mergedId = const Value.absent(),
    this.snapshot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonMergesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String survivorId,
    required String mergedId,
    required String snapshot,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       survivorId = Value(survivorId),
       mergedId = Value(mergedId),
       snapshot = Value(snapshot);
  static Insertable<PersonMergeRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? survivorId,
    Expression<String>? mergedId,
    Expression<String>? snapshot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (survivorId != null) 'survivor_id': survivorId,
      if (mergedId != null) 'merged_id': mergedId,
      if (snapshot != null) 'snapshot': snapshot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonMergesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? survivorId,
    Value<String>? mergedId,
    Value<String>? snapshot,
    Value<int>? rowid,
  }) {
    return PersonMergesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      survivorId: survivorId ?? this.survivorId,
      mergedId: mergedId ?? this.mergedId,
      snapshot: snapshot ?? this.snapshot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (survivorId.present) {
      map['survivor_id'] = Variable<String>(survivorId.value);
    }
    if (mergedId.present) {
      map['merged_id'] = Variable<String>(mergedId.value);
    }
    if (snapshot.present) {
      map['snapshot'] = Variable<String>(snapshot.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonMergesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('survivorId: $survivorId, ')
          ..write('mergedId: $mergedId, ')
          ..write('snapshot: $snapshot, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, TagRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameAltMeta = const VerificationMeta(
    'nameAlt',
  );
  @override
  late final GeneratedColumn<String> nameAlt = GeneratedColumn<String>(
    'name_alt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    name,
    nameAlt,
    color,
    icon,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<TagRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_alt')) {
      context.handle(
        _nameAltMeta,
        nameAlt.isAcceptableOrUnknown(data['name_alt']!, _nameAltMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameAlt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_alt'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class TagRow extends DataClass implements Insertable<TagRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String name;
  final String? nameAlt;
  final String? color;
  final String? icon;
  const TagRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.name,
    this.nameAlt,
    this.color,
    this.icon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || nameAlt != null) {
      map['name_alt'] = Variable<String>(nameAlt);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      name: Value(name),
      nameAlt: nameAlt == null && nullToAbsent ? const Value.absent() : Value(nameAlt),
      color: color == null && nullToAbsent ? const Value.absent() : Value(color),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
    );
  }

  factory TagRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      name: serializer.fromJson<String>(json['name']),
      nameAlt: serializer.fromJson<String?>(json['name_alt']),
      color: serializer.fromJson<String?>(json['color']),
      icon: serializer.fromJson<String?>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'name': serializer.toJson<String>(name),
      'name_alt': serializer.toJson<String?>(nameAlt),
      'color': serializer.toJson<String?>(color),
      'icon': serializer.toJson<String?>(icon),
    };
  }

  TagRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? name,
    Value<String?> nameAlt = const Value.absent(),
    Value<String?> color = const Value.absent(),
    Value<String?> icon = const Value.absent(),
  }) => TagRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    name: name ?? this.name,
    nameAlt: nameAlt.present ? nameAlt.value : this.nameAlt,
    color: color.present ? color.value : this.color,
    icon: icon.present ? icon.value : this.icon,
  );
  TagRow copyWithCompanion(TagsCompanion data) {
    return TagRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      name: data.name.present ? data.name.value : this.name,
      nameAlt: data.nameAlt.present ? data.nameAlt.value : this.nameAlt,
      color: data.color.present ? data.color.value : this.color,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('name: $name, ')
          ..write('nameAlt: $nameAlt, ')
          ..write('color: $color, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    name,
    nameAlt,
    color,
    icon,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.name == this.name &&
          other.nameAlt == this.nameAlt &&
          other.color == this.color &&
          other.icon == this.icon);
}

class TagsCompanion extends UpdateCompanion<TagRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> name;
  final Value<String?> nameAlt;
  final Value<String?> color;
  final Value<String?> icon;
  final Value<int> rowid;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.name = const Value.absent(),
    this.nameAlt = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String name,
    this.nameAlt = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       name = Value(name);
  static Insertable<TagRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? name,
    Expression<String>? nameAlt,
    Expression<String>? color,
    Expression<String>? icon,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (name != null) 'name': name,
      if (nameAlt != null) 'name_alt': nameAlt,
      if (color != null) 'color': color,
      if (icon != null) 'icon': icon,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? name,
    Value<String?>? nameAlt,
    Value<String?>? color,
    Value<String?>? icon,
    Value<int>? rowid,
  }) {
    return TagsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      name: name ?? this.name,
      nameAlt: nameAlt ?? this.nameAlt,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameAlt.present) {
      map['name_alt'] = Variable<String>(nameAlt.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('name: $name, ')
          ..write('nameAlt: $nameAlt, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonTagsTable extends PersonTags with TableInfo<$PersonTagsTable, PersonTagRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    tagId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'person_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonTagRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonTagRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonTagRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $PersonTagsTable createAlias(String alias) {
    return $PersonTagsTable(attachedDatabase, alias);
  }
}

class PersonTagRow extends DataClass implements Insertable<PersonTagRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String personId;
  final String tagId;
  const PersonTagRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.personId,
    required this.tagId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['person_id'] = Variable<String>(personId);
    map['tag_id'] = Variable<String>(tagId);
    return map;
  }

  PersonTagsCompanion toCompanion(bool nullToAbsent) {
    return PersonTagsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personId: Value(personId),
      tagId: Value(tagId),
    );
  }

  factory PersonTagRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonTagRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personId: serializer.fromJson<String>(json['person_id']),
      tagId: serializer.fromJson<String>(json['tag_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_id': serializer.toJson<String>(personId),
      'tag_id': serializer.toJson<String>(tagId),
    };
  }

  PersonTagRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? personId,
    String? tagId,
  }) => PersonTagRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personId: personId ?? this.personId,
    tagId: tagId ?? this.tagId,
  );
  PersonTagRow copyWithCompanion(PersonTagsCompanion data) {
    return PersonTagRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personId: data.personId.present ? data.personId.value : this.personId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonTagRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    tagId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonTagRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personId == this.personId &&
          other.tagId == this.tagId);
}

class PersonTagsCompanion extends UpdateCompanion<PersonTagRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> personId;
  final Value<String> tagId;
  final Value<int> rowid;
  const PersonTagsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonTagsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String personId,
    required String tagId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       personId = Value(personId),
       tagId = Value(tagId);
  static Insertable<PersonTagRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personId,
    Expression<String>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personId != null) 'person_id': personId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonTagsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? personId,
    Value<String>? tagId,
    Value<int>? rowid,
  }) {
    return PersonTagsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personId: personId ?? this.personId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonTagsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InteractionsTable extends Interactions with TableInfo<$InteractionsTable, InteractionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InteractionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _interactionTypeMeta = const VerificationMeta(
    'interactionType',
  );
  @override
  late final GeneratedColumn<String> interactionType = GeneratedColumn<String>(
    'interaction_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('in_person'),
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<String> placeId = GeneratedColumn<String>(
    'place_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationTextMeta = const VerificationMeta(
    'locationText',
  );
  @override
  late final GeneratedColumn<String> locationText = GeneratedColumn<String>(
    'location_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _followUpOnMeta = const VerificationMeta(
    'followUpOn',
  );
  @override
  late final GeneratedColumn<String> followUpOn = GeneratedColumn<String>(
    'follow_up_on',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    title,
    interactionType,
    occurredAt,
    durationMinutes,
    placeId,
    locationText,
    latitude,
    longitude,
    notes,
    followUpOn,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<InteractionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('interaction_type')) {
      context.handle(
        _interactionTypeMeta,
        interactionType.isAcceptableOrUnknown(
          data['interaction_type']!,
          _interactionTypeMeta,
        ),
      );
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    }
    if (data.containsKey('location_text')) {
      context.handle(
        _locationTextMeta,
        locationText.isAcceptableOrUnknown(
          data['location_text']!,
          _locationTextMeta,
        ),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('follow_up_on')) {
      context.handle(
        _followUpOnMeta,
        followUpOn.isAcceptableOrUnknown(
          data['follow_up_on']!,
          _followUpOnMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InteractionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InteractionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      interactionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}interaction_type'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_id'],
      ),
      locationText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_text'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      followUpOn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}follow_up_on'],
      ),
    );
  }

  @override
  $InteractionsTable createAlias(String alias) {
    return $InteractionsTable(attachedDatabase, alias);
  }
}

class InteractionRow extends DataClass implements Insertable<InteractionRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String? title;

  /// in_person | visit | phone_call | video_call | message | event | other
  final String interactionType;
  final DateTime occurredAt;
  final int? durationMinutes;
  final String? placeId;
  final String? locationText;
  final double? latitude;
  final double? longitude;
  final String? notes;

  /// Stored as an ISO date (yyyy-MM-dd) to match the `date` column in Postgres.
  final String? followUpOn;
  const InteractionRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    this.title,
    required this.interactionType,
    required this.occurredAt,
    this.durationMinutes,
    this.placeId,
    this.locationText,
    this.latitude,
    this.longitude,
    this.notes,
    this.followUpOn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['interaction_type'] = Variable<String>(interactionType);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || placeId != null) {
      map['place_id'] = Variable<String>(placeId);
    }
    if (!nullToAbsent || locationText != null) {
      map['location_text'] = Variable<String>(locationText);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || followUpOn != null) {
      map['follow_up_on'] = Variable<String>(followUpOn);
    }
    return map;
  }

  InteractionsCompanion toCompanion(bool nullToAbsent) {
    return InteractionsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      title: title == null && nullToAbsent ? const Value.absent() : Value(title),
      interactionType: Value(interactionType),
      occurredAt: Value(occurredAt),
      durationMinutes: durationMinutes == null && nullToAbsent ? const Value.absent() : Value(durationMinutes),
      placeId: placeId == null && nullToAbsent ? const Value.absent() : Value(placeId),
      locationText: locationText == null && nullToAbsent ? const Value.absent() : Value(locationText),
      latitude: latitude == null && nullToAbsent ? const Value.absent() : Value(latitude),
      longitude: longitude == null && nullToAbsent ? const Value.absent() : Value(longitude),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      followUpOn: followUpOn == null && nullToAbsent ? const Value.absent() : Value(followUpOn),
    );
  }

  factory InteractionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InteractionRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      title: serializer.fromJson<String?>(json['title']),
      interactionType: serializer.fromJson<String>(json['interaction_type']),
      occurredAt: serializer.fromJson<DateTime>(json['occurred_at']),
      durationMinutes: serializer.fromJson<int?>(json['duration_minutes']),
      placeId: serializer.fromJson<String?>(json['place_id']),
      locationText: serializer.fromJson<String?>(json['location_text']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      notes: serializer.fromJson<String?>(json['notes']),
      followUpOn: serializer.fromJson<String?>(json['follow_up_on']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'title': serializer.toJson<String?>(title),
      'interaction_type': serializer.toJson<String>(interactionType),
      'occurred_at': serializer.toJson<DateTime>(occurredAt),
      'duration_minutes': serializer.toJson<int?>(durationMinutes),
      'place_id': serializer.toJson<String?>(placeId),
      'location_text': serializer.toJson<String?>(locationText),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'notes': serializer.toJson<String?>(notes),
      'follow_up_on': serializer.toJson<String?>(followUpOn),
    };
  }

  InteractionRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    Value<String?> title = const Value.absent(),
    String? interactionType,
    DateTime? occurredAt,
    Value<int?> durationMinutes = const Value.absent(),
    Value<String?> placeId = const Value.absent(),
    Value<String?> locationText = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> followUpOn = const Value.absent(),
  }) => InteractionRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    title: title.present ? title.value : this.title,
    interactionType: interactionType ?? this.interactionType,
    occurredAt: occurredAt ?? this.occurredAt,
    durationMinutes: durationMinutes.present ? durationMinutes.value : this.durationMinutes,
    placeId: placeId.present ? placeId.value : this.placeId,
    locationText: locationText.present ? locationText.value : this.locationText,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    notes: notes.present ? notes.value : this.notes,
    followUpOn: followUpOn.present ? followUpOn.value : this.followUpOn,
  );
  InteractionRow copyWithCompanion(InteractionsCompanion data) {
    return InteractionRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      title: data.title.present ? data.title.value : this.title,
      interactionType: data.interactionType.present ? data.interactionType.value : this.interactionType,
      occurredAt: data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
      durationMinutes: data.durationMinutes.present ? data.durationMinutes.value : this.durationMinutes,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      locationText: data.locationText.present ? data.locationText.value : this.locationText,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      notes: data.notes.present ? data.notes.value : this.notes,
      followUpOn: data.followUpOn.present ? data.followUpOn.value : this.followUpOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InteractionRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('title: $title, ')
          ..write('interactionType: $interactionType, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('placeId: $placeId, ')
          ..write('locationText: $locationText, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('notes: $notes, ')
          ..write('followUpOn: $followUpOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    title,
    interactionType,
    occurredAt,
    durationMinutes,
    placeId,
    locationText,
    latitude,
    longitude,
    notes,
    followUpOn,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InteractionRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.title == this.title &&
          other.interactionType == this.interactionType &&
          other.occurredAt == this.occurredAt &&
          other.durationMinutes == this.durationMinutes &&
          other.placeId == this.placeId &&
          other.locationText == this.locationText &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.notes == this.notes &&
          other.followUpOn == this.followUpOn);
}

class InteractionsCompanion extends UpdateCompanion<InteractionRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String?> title;
  final Value<String> interactionType;
  final Value<DateTime> occurredAt;
  final Value<int?> durationMinutes;
  final Value<String?> placeId;
  final Value<String?> locationText;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> notes;
  final Value<String?> followUpOn;
  final Value<int> rowid;
  const InteractionsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.title = const Value.absent(),
    this.interactionType = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.placeId = const Value.absent(),
    this.locationText = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.notes = const Value.absent(),
    this.followUpOn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InteractionsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.title = const Value.absent(),
    this.interactionType = const Value.absent(),
    required DateTime occurredAt,
    this.durationMinutes = const Value.absent(),
    this.placeId = const Value.absent(),
    this.locationText = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.notes = const Value.absent(),
    this.followUpOn = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       occurredAt = Value(occurredAt);
  static Insertable<InteractionRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? title,
    Expression<String>? interactionType,
    Expression<DateTime>? occurredAt,
    Expression<int>? durationMinutes,
    Expression<String>? placeId,
    Expression<String>? locationText,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? notes,
    Expression<String>? followUpOn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (title != null) 'title': title,
      if (interactionType != null) 'interaction_type': interactionType,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (placeId != null) 'place_id': placeId,
      if (locationText != null) 'location_text': locationText,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (notes != null) 'notes': notes,
      if (followUpOn != null) 'follow_up_on': followUpOn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InteractionsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String?>? title,
    Value<String>? interactionType,
    Value<DateTime>? occurredAt,
    Value<int?>? durationMinutes,
    Value<String?>? placeId,
    Value<String?>? locationText,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<String?>? notes,
    Value<String?>? followUpOn,
    Value<int>? rowid,
  }) {
    return InteractionsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      title: title ?? this.title,
      interactionType: interactionType ?? this.interactionType,
      occurredAt: occurredAt ?? this.occurredAt,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      placeId: placeId ?? this.placeId,
      locationText: locationText ?? this.locationText,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      notes: notes ?? this.notes,
      followUpOn: followUpOn ?? this.followUpOn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (interactionType.present) {
      map['interaction_type'] = Variable<String>(interactionType.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<String>(placeId.value);
    }
    if (locationText.present) {
      map['location_text'] = Variable<String>(locationText.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (followUpOn.present) {
      map['follow_up_on'] = Variable<String>(followUpOn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InteractionsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('title: $title, ')
          ..write('interactionType: $interactionType, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('placeId: $placeId, ')
          ..write('locationText: $locationText, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('notes: $notes, ')
          ..write('followUpOn: $followUpOn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InteractionParticipantsTable extends InteractionParticipants
    with TableInfo<$InteractionParticipantsTable, InteractionParticipantRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InteractionParticipantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _interactionIdMeta = const VerificationMeta(
    'interactionId',
  );
  @override
  late final GeneratedColumn<String> interactionId = GeneratedColumn<String>(
    'interaction_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('participant'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    interactionId,
    personId,
    role,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interaction_participants';
  @override
  VerificationContext validateIntegrity(
    Insertable<InteractionParticipantRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('interaction_id')) {
      context.handle(
        _interactionIdMeta,
        interactionId.isAcceptableOrUnknown(
          data['interaction_id']!,
          _interactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interactionIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InteractionParticipantRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InteractionParticipantRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      interactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}interaction_id'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
    );
  }

  @override
  $InteractionParticipantsTable createAlias(String alias) {
    return $InteractionParticipantsTable(attachedDatabase, alias);
  }
}

class InteractionParticipantRow extends DataClass implements Insertable<InteractionParticipantRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String interactionId;
  final String personId;
  final String role;
  const InteractionParticipantRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    required this.interactionId,
    required this.personId,
    required this.role,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    map['interaction_id'] = Variable<String>(interactionId);
    map['person_id'] = Variable<String>(personId);
    map['role'] = Variable<String>(role);
    return map;
  }

  InteractionParticipantsCompanion toCompanion(bool nullToAbsent) {
    return InteractionParticipantsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      interactionId: Value(interactionId),
      personId: Value(personId),
      role: Value(role),
    );
  }

  factory InteractionParticipantRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InteractionParticipantRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      interactionId: serializer.fromJson<String>(json['interaction_id']),
      personId: serializer.fromJson<String>(json['person_id']),
      role: serializer.fromJson<String>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'interaction_id': serializer.toJson<String>(interactionId),
      'person_id': serializer.toJson<String>(personId),
      'role': serializer.toJson<String>(role),
    };
  }

  InteractionParticipantRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    String? interactionId,
    String? personId,
    String? role,
  }) => InteractionParticipantRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    interactionId: interactionId ?? this.interactionId,
    personId: personId ?? this.personId,
    role: role ?? this.role,
  );
  InteractionParticipantRow copyWithCompanion(
    InteractionParticipantsCompanion data,
  ) {
    return InteractionParticipantRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      interactionId: data.interactionId.present ? data.interactionId.value : this.interactionId,
      personId: data.personId.present ? data.personId.value : this.personId,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InteractionParticipantRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('interactionId: $interactionId, ')
          ..write('personId: $personId, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    interactionId,
    personId,
    role,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InteractionParticipantRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.interactionId == this.interactionId &&
          other.personId == this.personId &&
          other.role == this.role);
}

class InteractionParticipantsCompanion extends UpdateCompanion<InteractionParticipantRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String> interactionId;
  final Value<String> personId;
  final Value<String> role;
  final Value<int> rowid;
  const InteractionParticipantsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.interactionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InteractionParticipantsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    required String interactionId,
    required String personId,
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       interactionId = Value(interactionId),
       personId = Value(personId);
  static Insertable<InteractionParticipantRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? interactionId,
    Expression<String>? personId,
    Expression<String>? role,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (interactionId != null) 'interaction_id': interactionId,
      if (personId != null) 'person_id': personId,
      if (role != null) 'role': role,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InteractionParticipantsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String>? interactionId,
    Value<String>? personId,
    Value<String>? role,
    Value<int>? rowid,
  }) {
    return InteractionParticipantsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      interactionId: interactionId ?? this.interactionId,
      personId: personId ?? this.personId,
      role: role ?? this.role,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (interactionId.present) {
      map['interaction_id'] = Variable<String>(interactionId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InteractionParticipantsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('interactionId: $interactionId, ')
          ..write('personId: $personId, ')
          ..write('role: $role, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders with TableInfo<$RemindersTable, ReminderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _interactionIdMeta = const VerificationMeta(
    'interactionId',
  );
  @override
  late final GeneratedColumn<String> interactionId = GeneratedColumn<String>(
    'interaction_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reminderTypeMeta = const VerificationMeta(
    'reminderType',
  );
  @override
  late final GeneratedColumn<String> reminderType = GeneratedColumn<String>(
    'reminder_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('follow_up'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<DateTime> dueAt = GeneratedColumn<DateTime>(
    'due_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recurrenceMeta = const VerificationMeta(
    'recurrence',
  );
  @override
  late final GeneratedColumn<String> recurrence = GeneratedColumn<String>(
    'recurrence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    interactionId,
    reminderType,
    title,
    dueAt,
    recurrence,
    notes,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('interaction_id')) {
      context.handle(
        _interactionIdMeta,
        interactionId.isAcceptableOrUnknown(
          data['interaction_id']!,
          _interactionIdMeta,
        ),
      );
    }
    if (data.containsKey('reminder_type')) {
      context.handle(
        _reminderTypeMeta,
        reminderType.isAcceptableOrUnknown(
          data['reminder_type']!,
          _reminderTypeMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('due_at')) {
      context.handle(
        _dueAtMeta,
        dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta),
      );
    } else if (isInserting) {
      context.missing(_dueAtMeta);
    }
    if (data.containsKey('recurrence')) {
      context.handle(
        _recurrenceMeta,
        recurrence.isAcceptableOrUnknown(data['recurrence']!, _recurrenceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      interactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}interaction_id'],
      ),
      reminderType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reminder_type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      dueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_at'],
      )!,
      recurrence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class ReminderRow extends DataClass implements Insertable<ReminderRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String? personId;
  final String? interactionId;
  final String reminderType;
  final String title;
  final DateTime dueAt;
  final String recurrence;
  final String? notes;
  final DateTime? completedAt;
  const ReminderRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    this.personId,
    this.interactionId,
    required this.reminderType,
    required this.title,
    required this.dueAt,
    required this.recurrence,
    this.notes,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || interactionId != null) {
      map['interaction_id'] = Variable<String>(interactionId);
    }
    map['reminder_type'] = Variable<String>(reminderType);
    map['title'] = Variable<String>(title);
    map['due_at'] = Variable<DateTime>(dueAt);
    map['recurrence'] = Variable<String>(recurrence);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personId: personId == null && nullToAbsent ? const Value.absent() : Value(personId),
      interactionId: interactionId == null && nullToAbsent ? const Value.absent() : Value(interactionId),
      reminderType: Value(reminderType),
      title: Value(title),
      dueAt: Value(dueAt),
      recurrence: Value(recurrence),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      completedAt: completedAt == null && nullToAbsent ? const Value.absent() : Value(completedAt),
    );
  }

  factory ReminderRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personId: serializer.fromJson<String?>(json['person_id']),
      interactionId: serializer.fromJson<String?>(json['interaction_id']),
      reminderType: serializer.fromJson<String>(json['reminder_type']),
      title: serializer.fromJson<String>(json['title']),
      dueAt: serializer.fromJson<DateTime>(json['due_at']),
      recurrence: serializer.fromJson<String>(json['recurrence']),
      notes: serializer.fromJson<String?>(json['notes']),
      completedAt: serializer.fromJson<DateTime?>(json['completed_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_id': serializer.toJson<String?>(personId),
      'interaction_id': serializer.toJson<String?>(interactionId),
      'reminder_type': serializer.toJson<String>(reminderType),
      'title': serializer.toJson<String>(title),
      'due_at': serializer.toJson<DateTime>(dueAt),
      'recurrence': serializer.toJson<String>(recurrence),
      'notes': serializer.toJson<String?>(notes),
      'completed_at': serializer.toJson<DateTime?>(completedAt),
    };
  }

  ReminderRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    Value<String?> personId = const Value.absent(),
    Value<String?> interactionId = const Value.absent(),
    String? reminderType,
    String? title,
    DateTime? dueAt,
    String? recurrence,
    Value<String?> notes = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
  }) => ReminderRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personId: personId.present ? personId.value : this.personId,
    interactionId: interactionId.present ? interactionId.value : this.interactionId,
    reminderType: reminderType ?? this.reminderType,
    title: title ?? this.title,
    dueAt: dueAt ?? this.dueAt,
    recurrence: recurrence ?? this.recurrence,
    notes: notes.present ? notes.value : this.notes,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  ReminderRow copyWithCompanion(RemindersCompanion data) {
    return ReminderRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personId: data.personId.present ? data.personId.value : this.personId,
      interactionId: data.interactionId.present ? data.interactionId.value : this.interactionId,
      reminderType: data.reminderType.present ? data.reminderType.value : this.reminderType,
      title: data.title.present ? data.title.value : this.title,
      dueAt: data.dueAt.present ? data.dueAt.value : this.dueAt,
      recurrence: data.recurrence.present ? data.recurrence.value : this.recurrence,
      notes: data.notes.present ? data.notes.value : this.notes,
      completedAt: data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('interactionId: $interactionId, ')
          ..write('reminderType: $reminderType, ')
          ..write('title: $title, ')
          ..write('dueAt: $dueAt, ')
          ..write('recurrence: $recurrence, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    interactionId,
    reminderType,
    title,
    dueAt,
    recurrence,
    notes,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personId == this.personId &&
          other.interactionId == this.interactionId &&
          other.reminderType == this.reminderType &&
          other.title == this.title &&
          other.dueAt == this.dueAt &&
          other.recurrence == this.recurrence &&
          other.notes == this.notes &&
          other.completedAt == this.completedAt);
}

class RemindersCompanion extends UpdateCompanion<ReminderRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String?> personId;
  final Value<String?> interactionId;
  final Value<String> reminderType;
  final Value<String> title;
  final Value<DateTime> dueAt;
  final Value<String> recurrence;
  final Value<String?> notes;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.interactionId = const Value.absent(),
    this.reminderType = const Value.absent(),
    this.title = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.recurrence = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.interactionId = const Value.absent(),
    this.reminderType = const Value.absent(),
    required String title,
    required DateTime dueAt,
    this.recurrence = const Value.absent(),
    this.notes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       title = Value(title),
       dueAt = Value(dueAt);
  static Insertable<ReminderRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personId,
    Expression<String>? interactionId,
    Expression<String>? reminderType,
    Expression<String>? title,
    Expression<DateTime>? dueAt,
    Expression<String>? recurrence,
    Expression<String>? notes,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personId != null) 'person_id': personId,
      if (interactionId != null) 'interaction_id': interactionId,
      if (reminderType != null) 'reminder_type': reminderType,
      if (title != null) 'title': title,
      if (dueAt != null) 'due_at': dueAt,
      if (recurrence != null) 'recurrence': recurrence,
      if (notes != null) 'notes': notes,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String?>? personId,
    Value<String?>? interactionId,
    Value<String>? reminderType,
    Value<String>? title,
    Value<DateTime>? dueAt,
    Value<String>? recurrence,
    Value<String?>? notes,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personId: personId ?? this.personId,
      interactionId: interactionId ?? this.interactionId,
      reminderType: reminderType ?? this.reminderType,
      title: title ?? this.title,
      dueAt: dueAt ?? this.dueAt,
      recurrence: recurrence ?? this.recurrence,
      notes: notes ?? this.notes,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (interactionId.present) {
      map['interaction_id'] = Variable<String>(interactionId.value);
    }
    if (reminderType.present) {
      map['reminder_type'] = Variable<String>(reminderType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<DateTime>(dueAt.value);
    }
    if (recurrence.present) {
      map['recurrence'] = Variable<String>(recurrence.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('interactionId: $interactionId, ')
          ..write('reminderType: $reminderType, ')
          ..write('title: $title, ')
          ..write('dueAt: $dueAt, ')
          ..write('recurrence: $recurrence, ')
          ..write('notes: $notes, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaTable extends Media with TableInfo<$MediaTable, MediaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverSeqMeta = const VerificationMeta(
    'serverSeq',
  );
  @override
  late final GeneratedColumn<int> serverSeq = GeneratedColumn<int>(
    'server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _interactionIdMeta = const VerificationMeta(
    'interactionId',
  );
  @override
  late final GeneratedColumn<String> interactionId = GeneratedColumn<String>(
    'interaction_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeBytesMeta = const VerificationMeta(
    'sizeBytes',
  );
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMsMeta = const VerificationMeta(
    'durationMs',
  );
  @override
  late final GeneratedColumn<int> durationMs = GeneratedColumn<int>(
    'duration_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
    'sha256',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _captionMeta = const VerificationMeta(
    'caption',
  );
  @override
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
    'caption',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _takenAtMeta = const VerificationMeta(
    'takenAt',
  );
  @override
  late final GeneratedColumn<DateTime> takenAt = GeneratedColumn<DateTime>(
    'taken_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    interactionId,
    kind,
    fileName,
    mimeType,
    sizeBytes,
    width,
    height,
    durationMs,
    sha256,
    caption,
    takenAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('server_seq')) {
      context.handle(
        _serverSeqMeta,
        serverSeq.isAcceptableOrUnknown(data['server_seq']!, _serverSeqMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('interaction_id')) {
      context.handle(
        _interactionIdMeta,
        interactionId.isAcceptableOrUnknown(
          data['interaction_id']!,
          _interactionIdMeta,
        ),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
        _sizeBytesMeta,
        sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
        _durationMsMeta,
        durationMs.isAcceptableOrUnknown(data['duration_ms']!, _durationMsMeta),
      );
    }
    if (data.containsKey('sha256')) {
      context.handle(
        _sha256Meta,
        sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta),
      );
    }
    if (data.containsKey('caption')) {
      context.handle(
        _captionMeta,
        caption.isAcceptableOrUnknown(data['caption']!, _captionMeta),
      );
    }
    if (data.containsKey('taken_at')) {
      context.handle(
        _takenAtMeta,
        takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      serverSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_seq'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      interactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}interaction_id'],
      ),
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      )!,
      sizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size_bytes'],
      ),
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      ),
      durationMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_ms'],
      ),
      sha256: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sha256'],
      ),
      caption: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caption'],
      ),
      takenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}taken_at'],
      ),
    );
  }

  @override
  $MediaTable createAlias(String alias) {
    return $MediaTable(attachedDatabase, alias);
  }
}

class MediaRow extends DataClass implements Insertable<MediaRow> {
  /// UUID v7, generated on the device so records can be created offline.
  final String id;
  final DateTime createdAt;

  /// Edit time on the device; the server uses it for last-write-wins.
  final DateTime updatedAt;

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  final DateTime? deletedAt;

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  final int serverSeq;
  final String? personId;
  final String? interactionId;

  /// profile_photo | photo | document | voice_note
  final String kind;
  final String fileName;
  final String mimeType;
  final int? sizeBytes;
  final int? width;
  final int? height;
  final int? durationMs;
  final String? sha256;
  final String? caption;
  final DateTime? takenAt;
  const MediaRow({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.serverSeq,
    this.personId,
    this.interactionId,
    required this.kind,
    required this.fileName,
    required this.mimeType,
    this.sizeBytes,
    this.width,
    this.height,
    this.durationMs,
    this.sha256,
    this.caption,
    this.takenAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['server_seq'] = Variable<int>(serverSeq);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || interactionId != null) {
      map['interaction_id'] = Variable<String>(interactionId);
    }
    map['kind'] = Variable<String>(kind);
    map['file_name'] = Variable<String>(fileName);
    map['mime_type'] = Variable<String>(mimeType);
    if (!nullToAbsent || sizeBytes != null) {
      map['size_bytes'] = Variable<int>(sizeBytes);
    }
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    if (!nullToAbsent || durationMs != null) {
      map['duration_ms'] = Variable<int>(durationMs);
    }
    if (!nullToAbsent || sha256 != null) {
      map['sha256'] = Variable<String>(sha256);
    }
    if (!nullToAbsent || caption != null) {
      map['caption'] = Variable<String>(caption);
    }
    if (!nullToAbsent || takenAt != null) {
      map['taken_at'] = Variable<DateTime>(takenAt);
    }
    return map;
  }

  MediaCompanion toCompanion(bool nullToAbsent) {
    return MediaCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent ? const Value.absent() : Value(deletedAt),
      serverSeq: Value(serverSeq),
      personId: personId == null && nullToAbsent ? const Value.absent() : Value(personId),
      interactionId: interactionId == null && nullToAbsent ? const Value.absent() : Value(interactionId),
      kind: Value(kind),
      fileName: Value(fileName),
      mimeType: Value(mimeType),
      sizeBytes: sizeBytes == null && nullToAbsent ? const Value.absent() : Value(sizeBytes),
      width: width == null && nullToAbsent ? const Value.absent() : Value(width),
      height: height == null && nullToAbsent ? const Value.absent() : Value(height),
      durationMs: durationMs == null && nullToAbsent ? const Value.absent() : Value(durationMs),
      sha256: sha256 == null && nullToAbsent ? const Value.absent() : Value(sha256),
      caption: caption == null && nullToAbsent ? const Value.absent() : Value(caption),
      takenAt: takenAt == null && nullToAbsent ? const Value.absent() : Value(takenAt),
    );
  }

  factory MediaRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
      serverSeq: serializer.fromJson<int>(json['server_seq']),
      personId: serializer.fromJson<String?>(json['person_id']),
      interactionId: serializer.fromJson<String?>(json['interaction_id']),
      kind: serializer.fromJson<String>(json['kind']),
      fileName: serializer.fromJson<String>(json['file_name']),
      mimeType: serializer.fromJson<String>(json['mime_type']),
      sizeBytes: serializer.fromJson<int?>(json['size_bytes']),
      width: serializer.fromJson<int?>(json['width']),
      height: serializer.fromJson<int?>(json['height']),
      durationMs: serializer.fromJson<int?>(json['duration_ms']),
      sha256: serializer.fromJson<String?>(json['sha256']),
      caption: serializer.fromJson<String?>(json['caption']),
      takenAt: serializer.fromJson<DateTime?>(json['taken_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
      'server_seq': serializer.toJson<int>(serverSeq),
      'person_id': serializer.toJson<String?>(personId),
      'interaction_id': serializer.toJson<String?>(interactionId),
      'kind': serializer.toJson<String>(kind),
      'file_name': serializer.toJson<String>(fileName),
      'mime_type': serializer.toJson<String>(mimeType),
      'size_bytes': serializer.toJson<int?>(sizeBytes),
      'width': serializer.toJson<int?>(width),
      'height': serializer.toJson<int?>(height),
      'duration_ms': serializer.toJson<int?>(durationMs),
      'sha256': serializer.toJson<String?>(sha256),
      'caption': serializer.toJson<String?>(caption),
      'taken_at': serializer.toJson<DateTime?>(takenAt),
    };
  }

  MediaRow copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    int? serverSeq,
    Value<String?> personId = const Value.absent(),
    Value<String?> interactionId = const Value.absent(),
    String? kind,
    String? fileName,
    String? mimeType,
    Value<int?> sizeBytes = const Value.absent(),
    Value<int?> width = const Value.absent(),
    Value<int?> height = const Value.absent(),
    Value<int?> durationMs = const Value.absent(),
    Value<String?> sha256 = const Value.absent(),
    Value<String?> caption = const Value.absent(),
    Value<DateTime?> takenAt = const Value.absent(),
  }) => MediaRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    serverSeq: serverSeq ?? this.serverSeq,
    personId: personId.present ? personId.value : this.personId,
    interactionId: interactionId.present ? interactionId.value : this.interactionId,
    kind: kind ?? this.kind,
    fileName: fileName ?? this.fileName,
    mimeType: mimeType ?? this.mimeType,
    sizeBytes: sizeBytes.present ? sizeBytes.value : this.sizeBytes,
    width: width.present ? width.value : this.width,
    height: height.present ? height.value : this.height,
    durationMs: durationMs.present ? durationMs.value : this.durationMs,
    sha256: sha256.present ? sha256.value : this.sha256,
    caption: caption.present ? caption.value : this.caption,
    takenAt: takenAt.present ? takenAt.value : this.takenAt,
  );
  MediaRow copyWithCompanion(MediaCompanion data) {
    return MediaRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      serverSeq: data.serverSeq.present ? data.serverSeq.value : this.serverSeq,
      personId: data.personId.present ? data.personId.value : this.personId,
      interactionId: data.interactionId.present ? data.interactionId.value : this.interactionId,
      kind: data.kind.present ? data.kind.value : this.kind,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      durationMs: data.durationMs.present ? data.durationMs.value : this.durationMs,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      caption: data.caption.present ? data.caption.value : this.caption,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('interactionId: $interactionId, ')
          ..write('kind: $kind, ')
          ..write('fileName: $fileName, ')
          ..write('mimeType: $mimeType, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('durationMs: $durationMs, ')
          ..write('sha256: $sha256, ')
          ..write('caption: $caption, ')
          ..write('takenAt: $takenAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    serverSeq,
    personId,
    interactionId,
    kind,
    fileName,
    mimeType,
    sizeBytes,
    width,
    height,
    durationMs,
    sha256,
    caption,
    takenAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.serverSeq == this.serverSeq &&
          other.personId == this.personId &&
          other.interactionId == this.interactionId &&
          other.kind == this.kind &&
          other.fileName == this.fileName &&
          other.mimeType == this.mimeType &&
          other.sizeBytes == this.sizeBytes &&
          other.width == this.width &&
          other.height == this.height &&
          other.durationMs == this.durationMs &&
          other.sha256 == this.sha256 &&
          other.caption == this.caption &&
          other.takenAt == this.takenAt);
}

class MediaCompanion extends UpdateCompanion<MediaRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> serverSeq;
  final Value<String?> personId;
  final Value<String?> interactionId;
  final Value<String> kind;
  final Value<String> fileName;
  final Value<String> mimeType;
  final Value<int?> sizeBytes;
  final Value<int?> width;
  final Value<int?> height;
  final Value<int?> durationMs;
  final Value<String?> sha256;
  final Value<String?> caption;
  final Value<DateTime?> takenAt;
  final Value<int> rowid;
  const MediaCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.interactionId = const Value.absent(),
    this.kind = const Value.absent(),
    this.fileName = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.caption = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.serverSeq = const Value.absent(),
    this.personId = const Value.absent(),
    this.interactionId = const Value.absent(),
    required String kind,
    required String fileName,
    required String mimeType,
    this.sizeBytes = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.durationMs = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.caption = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       kind = Value(kind),
       fileName = Value(fileName),
       mimeType = Value(mimeType);
  static Insertable<MediaRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? serverSeq,
    Expression<String>? personId,
    Expression<String>? interactionId,
    Expression<String>? kind,
    Expression<String>? fileName,
    Expression<String>? mimeType,
    Expression<int>? sizeBytes,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? durationMs,
    Expression<String>? sha256,
    Expression<String>? caption,
    Expression<DateTime>? takenAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (serverSeq != null) 'server_seq': serverSeq,
      if (personId != null) 'person_id': personId,
      if (interactionId != null) 'interaction_id': interactionId,
      if (kind != null) 'kind': kind,
      if (fileName != null) 'file_name': fileName,
      if (mimeType != null) 'mime_type': mimeType,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (durationMs != null) 'duration_ms': durationMs,
      if (sha256 != null) 'sha256': sha256,
      if (caption != null) 'caption': caption,
      if (takenAt != null) 'taken_at': takenAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? serverSeq,
    Value<String?>? personId,
    Value<String?>? interactionId,
    Value<String>? kind,
    Value<String>? fileName,
    Value<String>? mimeType,
    Value<int?>? sizeBytes,
    Value<int?>? width,
    Value<int?>? height,
    Value<int?>? durationMs,
    Value<String?>? sha256,
    Value<String?>? caption,
    Value<DateTime?>? takenAt,
    Value<int>? rowid,
  }) {
    return MediaCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      serverSeq: serverSeq ?? this.serverSeq,
      personId: personId ?? this.personId,
      interactionId: interactionId ?? this.interactionId,
      kind: kind ?? this.kind,
      fileName: fileName ?? this.fileName,
      mimeType: mimeType ?? this.mimeType,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      width: width ?? this.width,
      height: height ?? this.height,
      durationMs: durationMs ?? this.durationMs,
      sha256: sha256 ?? this.sha256,
      caption: caption ?? this.caption,
      takenAt: takenAt ?? this.takenAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (serverSeq.present) {
      map['server_seq'] = Variable<int>(serverSeq.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (interactionId.present) {
      map['interaction_id'] = Variable<String>(interactionId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = Variable<int>(durationMs.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<DateTime>(takenAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('serverSeq: $serverSeq, ')
          ..write('personId: $personId, ')
          ..write('interactionId: $interactionId, ')
          ..write('kind: $kind, ')
          ..write('fileName: $fileName, ')
          ..write('mimeType: $mimeType, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('durationMs: $durationMs, ')
          ..write('sha256: $sha256, ')
          ..write('caption: $caption, ')
          ..write('takenAt: $takenAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncOutboxTable extends SyncOutbox with TableInfo<$SyncOutboxTable, OutboxEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncOutboxTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seqMeta = const VerificationMeta('seq');
  @override
  late final GeneratedColumn<int> seq = GeneratedColumn<int>(
    'seq',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordIdMeta = const VerificationMeta(
    'recordId',
  );
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
    'record_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextAttemptAtMeta = const VerificationMeta(
    'nextAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextAttemptAt = GeneratedColumn<DateTime>(
    'next_attempt_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    seq,
    entity,
    recordId,
    payload,
    createdAt,
    attempts,
    nextAttemptAt,
    lastError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboxEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('seq')) {
      context.handle(
        _seqMeta,
        seq.isAcceptableOrUnknown(data['seq']!, _seqMeta),
      );
    }
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(
        _recordIdMeta,
        recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('next_attempt_at')) {
      context.handle(
        _nextAttemptAtMeta,
        nextAttemptAt.isAcceptableOrUnknown(
          data['next_attempt_at']!,
          _nextAttemptAtMeta,
        ),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seq};
  @override
  OutboxEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboxEntry(
      seq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seq'],
      )!,
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      recordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}record_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      nextAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_attempt_at'],
      ),
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
    );
  }

  @override
  $SyncOutboxTable createAlias(String alias) {
    return $SyncOutboxTable(attachedDatabase, alias);
  }
}

class OutboxEntry extends DataClass implements Insertable<OutboxEntry> {
  final int seq;

  /// Cloud table name, e.g. `people`.
  final String entity;
  final String recordId;

  /// JSON snapshot of the full row, keyed by cloud column names.
  final String payload;
  final DateTime createdAt;
  final int attempts;
  final DateTime? nextAttemptAt;
  final String? lastError;
  const OutboxEntry({
    required this.seq,
    required this.entity,
    required this.recordId,
    required this.payload,
    required this.createdAt,
    required this.attempts,
    this.nextAttemptAt,
    this.lastError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['seq'] = Variable<int>(seq);
    map['entity'] = Variable<String>(entity);
    map['record_id'] = Variable<String>(recordId);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || nextAttemptAt != null) {
      map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt);
    }
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  SyncOutboxCompanion toCompanion(bool nullToAbsent) {
    return SyncOutboxCompanion(
      seq: Value(seq),
      entity: Value(entity),
      recordId: Value(recordId),
      payload: Value(payload),
      createdAt: Value(createdAt),
      attempts: Value(attempts),
      nextAttemptAt: nextAttemptAt == null && nullToAbsent ? const Value.absent() : Value(nextAttemptAt),
      lastError: lastError == null && nullToAbsent ? const Value.absent() : Value(lastError),
    );
  }

  factory OutboxEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboxEntry(
      seq: serializer.fromJson<int>(json['seq']),
      entity: serializer.fromJson<String>(json['entity']),
      recordId: serializer.fromJson<String>(json['record_id']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      attempts: serializer.fromJson<int>(json['attempts']),
      nextAttemptAt: serializer.fromJson<DateTime?>(json['next_attempt_at']),
      lastError: serializer.fromJson<String?>(json['last_error']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seq': serializer.toJson<int>(seq),
      'entity': serializer.toJson<String>(entity),
      'record_id': serializer.toJson<String>(recordId),
      'payload': serializer.toJson<String>(payload),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'attempts': serializer.toJson<int>(attempts),
      'next_attempt_at': serializer.toJson<DateTime?>(nextAttemptAt),
      'last_error': serializer.toJson<String?>(lastError),
    };
  }

  OutboxEntry copyWith({
    int? seq,
    String? entity,
    String? recordId,
    String? payload,
    DateTime? createdAt,
    int? attempts,
    Value<DateTime?> nextAttemptAt = const Value.absent(),
    Value<String?> lastError = const Value.absent(),
  }) => OutboxEntry(
    seq: seq ?? this.seq,
    entity: entity ?? this.entity,
    recordId: recordId ?? this.recordId,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    attempts: attempts ?? this.attempts,
    nextAttemptAt: nextAttemptAt.present ? nextAttemptAt.value : this.nextAttemptAt,
    lastError: lastError.present ? lastError.value : this.lastError,
  );
  OutboxEntry copyWithCompanion(SyncOutboxCompanion data) {
    return OutboxEntry(
      seq: data.seq.present ? data.seq.value : this.seq,
      entity: data.entity.present ? data.entity.value : this.entity,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      nextAttemptAt: data.nextAttemptAt.present ? data.nextAttemptAt.value : this.nextAttemptAt,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboxEntry(')
          ..write('seq: $seq, ')
          ..write('entity: $entity, ')
          ..write('recordId: $recordId, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    seq,
    entity,
    recordId,
    payload,
    createdAt,
    attempts,
    nextAttemptAt,
    lastError,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboxEntry &&
          other.seq == this.seq &&
          other.entity == this.entity &&
          other.recordId == this.recordId &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.attempts == this.attempts &&
          other.nextAttemptAt == this.nextAttemptAt &&
          other.lastError == this.lastError);
}

class SyncOutboxCompanion extends UpdateCompanion<OutboxEntry> {
  final Value<int> seq;
  final Value<String> entity;
  final Value<String> recordId;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<int> attempts;
  final Value<DateTime?> nextAttemptAt;
  final Value<String?> lastError;
  const SyncOutboxCompanion({
    this.seq = const Value.absent(),
    this.entity = const Value.absent(),
    this.recordId = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.attempts = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  SyncOutboxCompanion.insert({
    this.seq = const Value.absent(),
    required String entity,
    required String recordId,
    required String payload,
    required DateTime createdAt,
    this.attempts = const Value.absent(),
    this.nextAttemptAt = const Value.absent(),
    this.lastError = const Value.absent(),
  }) : entity = Value(entity),
       recordId = Value(recordId),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<OutboxEntry> custom({
    Expression<int>? seq,
    Expression<String>? entity,
    Expression<String>? recordId,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? attempts,
    Expression<DateTime>? nextAttemptAt,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (seq != null) 'seq': seq,
      if (entity != null) 'entity': entity,
      if (recordId != null) 'record_id': recordId,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (attempts != null) 'attempts': attempts,
      if (nextAttemptAt != null) 'next_attempt_at': nextAttemptAt,
      if (lastError != null) 'last_error': lastError,
    });
  }

  SyncOutboxCompanion copyWith({
    Value<int>? seq,
    Value<String>? entity,
    Value<String>? recordId,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<int>? attempts,
    Value<DateTime?>? nextAttemptAt,
    Value<String?>? lastError,
  }) {
    return SyncOutboxCompanion(
      seq: seq ?? this.seq,
      entity: entity ?? this.entity,
      recordId: recordId ?? this.recordId,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      attempts: attempts ?? this.attempts,
      nextAttemptAt: nextAttemptAt ?? this.nextAttemptAt,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seq.present) {
      map['seq'] = Variable<int>(seq.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (nextAttemptAt.present) {
      map['next_attempt_at'] = Variable<DateTime>(nextAttemptAt.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncOutboxCompanion(')
          ..write('seq: $seq, ')
          ..write('entity: $entity, ')
          ..write('recordId: $recordId, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('attempts: $attempts, ')
          ..write('nextAttemptAt: $nextAttemptAt, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

class $SyncCursorsTable extends SyncCursors with TableInfo<$SyncCursorsTable, SyncCursorRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncCursorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastServerSeqMeta = const VerificationMeta(
    'lastServerSeq',
  );
  @override
  late final GeneratedColumn<int> lastServerSeq = GeneratedColumn<int>(
    'last_server_seq',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastPulledAtMeta = const VerificationMeta(
    'lastPulledAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastPulledAt = GeneratedColumn<DateTime>(
    'last_pulled_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [entity, lastServerSeq, lastPulledAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_cursors';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncCursorRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('last_server_seq')) {
      context.handle(
        _lastServerSeqMeta,
        lastServerSeq.isAcceptableOrUnknown(
          data['last_server_seq']!,
          _lastServerSeqMeta,
        ),
      );
    }
    if (data.containsKey('last_pulled_at')) {
      context.handle(
        _lastPulledAtMeta,
        lastPulledAt.isAcceptableOrUnknown(
          data['last_pulled_at']!,
          _lastPulledAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entity};
  @override
  SyncCursorRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncCursorRow(
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      lastServerSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_server_seq'],
      )!,
      lastPulledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_pulled_at'],
      ),
    );
  }

  @override
  $SyncCursorsTable createAlias(String alias) {
    return $SyncCursorsTable(attachedDatabase, alias);
  }
}

class SyncCursorRow extends DataClass implements Insertable<SyncCursorRow> {
  final String entity;
  final int lastServerSeq;
  final DateTime? lastPulledAt;
  const SyncCursorRow({
    required this.entity,
    required this.lastServerSeq,
    this.lastPulledAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entity'] = Variable<String>(entity);
    map['last_server_seq'] = Variable<int>(lastServerSeq);
    if (!nullToAbsent || lastPulledAt != null) {
      map['last_pulled_at'] = Variable<DateTime>(lastPulledAt);
    }
    return map;
  }

  SyncCursorsCompanion toCompanion(bool nullToAbsent) {
    return SyncCursorsCompanion(
      entity: Value(entity),
      lastServerSeq: Value(lastServerSeq),
      lastPulledAt: lastPulledAt == null && nullToAbsent ? const Value.absent() : Value(lastPulledAt),
    );
  }

  factory SyncCursorRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncCursorRow(
      entity: serializer.fromJson<String>(json['entity']),
      lastServerSeq: serializer.fromJson<int>(json['last_server_seq']),
      lastPulledAt: serializer.fromJson<DateTime?>(json['last_pulled_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entity': serializer.toJson<String>(entity),
      'last_server_seq': serializer.toJson<int>(lastServerSeq),
      'last_pulled_at': serializer.toJson<DateTime?>(lastPulledAt),
    };
  }

  SyncCursorRow copyWith({
    String? entity,
    int? lastServerSeq,
    Value<DateTime?> lastPulledAt = const Value.absent(),
  }) => SyncCursorRow(
    entity: entity ?? this.entity,
    lastServerSeq: lastServerSeq ?? this.lastServerSeq,
    lastPulledAt: lastPulledAt.present ? lastPulledAt.value : this.lastPulledAt,
  );
  SyncCursorRow copyWithCompanion(SyncCursorsCompanion data) {
    return SyncCursorRow(
      entity: data.entity.present ? data.entity.value : this.entity,
      lastServerSeq: data.lastServerSeq.present ? data.lastServerSeq.value : this.lastServerSeq,
      lastPulledAt: data.lastPulledAt.present ? data.lastPulledAt.value : this.lastPulledAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncCursorRow(')
          ..write('entity: $entity, ')
          ..write('lastServerSeq: $lastServerSeq, ')
          ..write('lastPulledAt: $lastPulledAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(entity, lastServerSeq, lastPulledAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncCursorRow &&
          other.entity == this.entity &&
          other.lastServerSeq == this.lastServerSeq &&
          other.lastPulledAt == this.lastPulledAt);
}

class SyncCursorsCompanion extends UpdateCompanion<SyncCursorRow> {
  final Value<String> entity;
  final Value<int> lastServerSeq;
  final Value<DateTime?> lastPulledAt;
  final Value<int> rowid;
  const SyncCursorsCompanion({
    this.entity = const Value.absent(),
    this.lastServerSeq = const Value.absent(),
    this.lastPulledAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncCursorsCompanion.insert({
    required String entity,
    this.lastServerSeq = const Value.absent(),
    this.lastPulledAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : entity = Value(entity);
  static Insertable<SyncCursorRow> custom({
    Expression<String>? entity,
    Expression<int>? lastServerSeq,
    Expression<DateTime>? lastPulledAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (entity != null) 'entity': entity,
      if (lastServerSeq != null) 'last_server_seq': lastServerSeq,
      if (lastPulledAt != null) 'last_pulled_at': lastPulledAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncCursorsCompanion copyWith({
    Value<String>? entity,
    Value<int>? lastServerSeq,
    Value<DateTime?>? lastPulledAt,
    Value<int>? rowid,
  }) {
    return SyncCursorsCompanion(
      entity: entity ?? this.entity,
      lastServerSeq: lastServerSeq ?? this.lastServerSeq,
      lastPulledAt: lastPulledAt ?? this.lastPulledAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (lastServerSeq.present) {
      map['last_server_seq'] = Variable<int>(lastServerSeq.value);
    }
    if (lastPulledAt.present) {
      map['last_pulled_at'] = Variable<DateTime>(lastPulledAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncCursorsCompanion(')
          ..write('entity: $entity, ')
          ..write('lastServerSeq: $lastServerSeq, ')
          ..write('lastPulledAt: $lastPulledAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncIssuesTable extends SyncIssues with TableInfo<$SyncIssuesTable, SyncIssueRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncIssuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordIdMeta = const VerificationMeta(
    'recordId',
  );
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
    'record_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _errorCodeMeta = const VerificationMeta(
    'errorCode',
  );
  @override
  late final GeneratedColumn<String> errorCode = GeneratedColumn<String>(
    'error_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resolvedAtMeta = const VerificationMeta(
    'resolvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> resolvedAt = GeneratedColumn<DateTime>(
    'resolved_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entity,
    recordId,
    payload,
    errorCode,
    message,
    createdAt,
    resolvedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_issues';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncIssueRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(
        _recordIdMeta,
        recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('error_code')) {
      context.handle(
        _errorCodeMeta,
        errorCode.isAcceptableOrUnknown(data['error_code']!, _errorCodeMeta),
      );
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('resolved_at')) {
      context.handle(
        _resolvedAtMeta,
        resolvedAt.isAcceptableOrUnknown(data['resolved_at']!, _resolvedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncIssueRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncIssueRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      recordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}record_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      errorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_code'],
      ),
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      resolvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}resolved_at'],
      ),
    );
  }

  @override
  $SyncIssuesTable createAlias(String alias) {
    return $SyncIssuesTable(attachedDatabase, alias);
  }
}

class SyncIssueRow extends DataClass implements Insertable<SyncIssueRow> {
  final int id;
  final String entity;
  final String recordId;
  final String payload;
  final String? errorCode;
  final String? message;
  final DateTime createdAt;
  final DateTime? resolvedAt;
  const SyncIssueRow({
    required this.id,
    required this.entity,
    required this.recordId,
    required this.payload,
    this.errorCode,
    this.message,
    required this.createdAt,
    this.resolvedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity'] = Variable<String>(entity);
    map['record_id'] = Variable<String>(recordId);
    map['payload'] = Variable<String>(payload);
    if (!nullToAbsent || errorCode != null) {
      map['error_code'] = Variable<String>(errorCode);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || resolvedAt != null) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt);
    }
    return map;
  }

  SyncIssuesCompanion toCompanion(bool nullToAbsent) {
    return SyncIssuesCompanion(
      id: Value(id),
      entity: Value(entity),
      recordId: Value(recordId),
      payload: Value(payload),
      errorCode: errorCode == null && nullToAbsent ? const Value.absent() : Value(errorCode),
      message: message == null && nullToAbsent ? const Value.absent() : Value(message),
      createdAt: Value(createdAt),
      resolvedAt: resolvedAt == null && nullToAbsent ? const Value.absent() : Value(resolvedAt),
    );
  }

  factory SyncIssueRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncIssueRow(
      id: serializer.fromJson<int>(json['id']),
      entity: serializer.fromJson<String>(json['entity']),
      recordId: serializer.fromJson<String>(json['record_id']),
      payload: serializer.fromJson<String>(json['payload']),
      errorCode: serializer.fromJson<String?>(json['error_code']),
      message: serializer.fromJson<String?>(json['message']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      resolvedAt: serializer.fromJson<DateTime?>(json['resolved_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entity': serializer.toJson<String>(entity),
      'record_id': serializer.toJson<String>(recordId),
      'payload': serializer.toJson<String>(payload),
      'error_code': serializer.toJson<String?>(errorCode),
      'message': serializer.toJson<String?>(message),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'resolved_at': serializer.toJson<DateTime?>(resolvedAt),
    };
  }

  SyncIssueRow copyWith({
    int? id,
    String? entity,
    String? recordId,
    String? payload,
    Value<String?> errorCode = const Value.absent(),
    Value<String?> message = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> resolvedAt = const Value.absent(),
  }) => SyncIssueRow(
    id: id ?? this.id,
    entity: entity ?? this.entity,
    recordId: recordId ?? this.recordId,
    payload: payload ?? this.payload,
    errorCode: errorCode.present ? errorCode.value : this.errorCode,
    message: message.present ? message.value : this.message,
    createdAt: createdAt ?? this.createdAt,
    resolvedAt: resolvedAt.present ? resolvedAt.value : this.resolvedAt,
  );
  SyncIssueRow copyWithCompanion(SyncIssuesCompanion data) {
    return SyncIssueRow(
      id: data.id.present ? data.id.value : this.id,
      entity: data.entity.present ? data.entity.value : this.entity,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      payload: data.payload.present ? data.payload.value : this.payload,
      errorCode: data.errorCode.present ? data.errorCode.value : this.errorCode,
      message: data.message.present ? data.message.value : this.message,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      resolvedAt: data.resolvedAt.present ? data.resolvedAt.value : this.resolvedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncIssueRow(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('recordId: $recordId, ')
          ..write('payload: $payload, ')
          ..write('errorCode: $errorCode, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt, ')
          ..write('resolvedAt: $resolvedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entity,
    recordId,
    payload,
    errorCode,
    message,
    createdAt,
    resolvedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncIssueRow &&
          other.id == this.id &&
          other.entity == this.entity &&
          other.recordId == this.recordId &&
          other.payload == this.payload &&
          other.errorCode == this.errorCode &&
          other.message == this.message &&
          other.createdAt == this.createdAt &&
          other.resolvedAt == this.resolvedAt);
}

class SyncIssuesCompanion extends UpdateCompanion<SyncIssueRow> {
  final Value<int> id;
  final Value<String> entity;
  final Value<String> recordId;
  final Value<String> payload;
  final Value<String?> errorCode;
  final Value<String?> message;
  final Value<DateTime> createdAt;
  final Value<DateTime?> resolvedAt;
  const SyncIssuesCompanion({
    this.id = const Value.absent(),
    this.entity = const Value.absent(),
    this.recordId = const Value.absent(),
    this.payload = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.message = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.resolvedAt = const Value.absent(),
  });
  SyncIssuesCompanion.insert({
    this.id = const Value.absent(),
    required String entity,
    required String recordId,
    required String payload,
    this.errorCode = const Value.absent(),
    this.message = const Value.absent(),
    required DateTime createdAt,
    this.resolvedAt = const Value.absent(),
  }) : entity = Value(entity),
       recordId = Value(recordId),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<SyncIssueRow> custom({
    Expression<int>? id,
    Expression<String>? entity,
    Expression<String>? recordId,
    Expression<String>? payload,
    Expression<String>? errorCode,
    Expression<String>? message,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? resolvedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entity != null) 'entity': entity,
      if (recordId != null) 'record_id': recordId,
      if (payload != null) 'payload': payload,
      if (errorCode != null) 'error_code': errorCode,
      if (message != null) 'message': message,
      if (createdAt != null) 'created_at': createdAt,
      if (resolvedAt != null) 'resolved_at': resolvedAt,
    });
  }

  SyncIssuesCompanion copyWith({
    Value<int>? id,
    Value<String>? entity,
    Value<String>? recordId,
    Value<String>? payload,
    Value<String?>? errorCode,
    Value<String?>? message,
    Value<DateTime>? createdAt,
    Value<DateTime?>? resolvedAt,
  }) {
    return SyncIssuesCompanion(
      id: id ?? this.id,
      entity: entity ?? this.entity,
      recordId: recordId ?? this.recordId,
      payload: payload ?? this.payload,
      errorCode: errorCode ?? this.errorCode,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt ?? this.resolvedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (errorCode.present) {
      map['error_code'] = Variable<String>(errorCode.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (resolvedAt.present) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncIssuesCompanion(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('recordId: $recordId, ')
          ..write('payload: $payload, ')
          ..write('errorCode: $errorCode, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt, ')
          ..write('resolvedAt: $resolvedAt')
          ..write(')'))
        .toString();
  }
}

class $MediaFilesTable extends MediaFiles with TableInfo<$MediaFilesTable, MediaFileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaFilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbPathMeta = const VerificationMeta(
    'thumbPath',
  );
  @override
  late final GeneratedColumn<String> thumbPath = GeneratedColumn<String>(
    'thumb_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _uploadStateMeta = const VerificationMeta(
    'uploadState',
  );
  @override
  late final GeneratedColumn<String> uploadState = GeneratedColumn<String>(
    'upload_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _downloadStateMeta = const VerificationMeta(
    'downloadState',
  );
  @override
  late final GeneratedColumn<String> downloadState = GeneratedColumn<String>(
    'download_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    mediaId,
    localPath,
    thumbPath,
    uploadState,
    downloadState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_files';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaFileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    }
    if (data.containsKey('thumb_path')) {
      context.handle(
        _thumbPathMeta,
        thumbPath.isAcceptableOrUnknown(data['thumb_path']!, _thumbPathMeta),
      );
    }
    if (data.containsKey('upload_state')) {
      context.handle(
        _uploadStateMeta,
        uploadState.isAcceptableOrUnknown(
          data['upload_state']!,
          _uploadStateMeta,
        ),
      );
    }
    if (data.containsKey('download_state')) {
      context.handle(
        _downloadStateMeta,
        downloadState.isAcceptableOrUnknown(
          data['download_state']!,
          _downloadStateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mediaId};
  @override
  MediaFileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaFileRow(
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      ),
      thumbPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumb_path'],
      ),
      uploadState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}upload_state'],
      )!,
      downloadState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}download_state'],
      )!,
    );
  }

  @override
  $MediaFilesTable createAlias(String alias) {
    return $MediaFilesTable(attachedDatabase, alias);
  }
}

class MediaFileRow extends DataClass implements Insertable<MediaFileRow> {
  final String mediaId;
  final String? localPath;
  final String? thumbPath;

  /// pending | uploading | done | failed
  final String uploadState;
  final String downloadState;
  const MediaFileRow({
    required this.mediaId,
    this.localPath,
    this.thumbPath,
    required this.uploadState,
    required this.downloadState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['media_id'] = Variable<String>(mediaId);
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    if (!nullToAbsent || thumbPath != null) {
      map['thumb_path'] = Variable<String>(thumbPath);
    }
    map['upload_state'] = Variable<String>(uploadState);
    map['download_state'] = Variable<String>(downloadState);
    return map;
  }

  MediaFilesCompanion toCompanion(bool nullToAbsent) {
    return MediaFilesCompanion(
      mediaId: Value(mediaId),
      localPath: localPath == null && nullToAbsent ? const Value.absent() : Value(localPath),
      thumbPath: thumbPath == null && nullToAbsent ? const Value.absent() : Value(thumbPath),
      uploadState: Value(uploadState),
      downloadState: Value(downloadState),
    );
  }

  factory MediaFileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaFileRow(
      mediaId: serializer.fromJson<String>(json['media_id']),
      localPath: serializer.fromJson<String?>(json['local_path']),
      thumbPath: serializer.fromJson<String?>(json['thumb_path']),
      uploadState: serializer.fromJson<String>(json['upload_state']),
      downloadState: serializer.fromJson<String>(json['download_state']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'media_id': serializer.toJson<String>(mediaId),
      'local_path': serializer.toJson<String?>(localPath),
      'thumb_path': serializer.toJson<String?>(thumbPath),
      'upload_state': serializer.toJson<String>(uploadState),
      'download_state': serializer.toJson<String>(downloadState),
    };
  }

  MediaFileRow copyWith({
    String? mediaId,
    Value<String?> localPath = const Value.absent(),
    Value<String?> thumbPath = const Value.absent(),
    String? uploadState,
    String? downloadState,
  }) => MediaFileRow(
    mediaId: mediaId ?? this.mediaId,
    localPath: localPath.present ? localPath.value : this.localPath,
    thumbPath: thumbPath.present ? thumbPath.value : this.thumbPath,
    uploadState: uploadState ?? this.uploadState,
    downloadState: downloadState ?? this.downloadState,
  );
  MediaFileRow copyWithCompanion(MediaFilesCompanion data) {
    return MediaFileRow(
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      thumbPath: data.thumbPath.present ? data.thumbPath.value : this.thumbPath,
      uploadState: data.uploadState.present ? data.uploadState.value : this.uploadState,
      downloadState: data.downloadState.present ? data.downloadState.value : this.downloadState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaFileRow(')
          ..write('mediaId: $mediaId, ')
          ..write('localPath: $localPath, ')
          ..write('thumbPath: $thumbPath, ')
          ..write('uploadState: $uploadState, ')
          ..write('downloadState: $downloadState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mediaId, localPath, thumbPath, uploadState, downloadState);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaFileRow &&
          other.mediaId == this.mediaId &&
          other.localPath == this.localPath &&
          other.thumbPath == this.thumbPath &&
          other.uploadState == this.uploadState &&
          other.downloadState == this.downloadState);
}

class MediaFilesCompanion extends UpdateCompanion<MediaFileRow> {
  final Value<String> mediaId;
  final Value<String?> localPath;
  final Value<String?> thumbPath;
  final Value<String> uploadState;
  final Value<String> downloadState;
  final Value<int> rowid;
  const MediaFilesCompanion({
    this.mediaId = const Value.absent(),
    this.localPath = const Value.absent(),
    this.thumbPath = const Value.absent(),
    this.uploadState = const Value.absent(),
    this.downloadState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaFilesCompanion.insert({
    required String mediaId,
    this.localPath = const Value.absent(),
    this.thumbPath = const Value.absent(),
    this.uploadState = const Value.absent(),
    this.downloadState = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : mediaId = Value(mediaId);
  static Insertable<MediaFileRow> custom({
    Expression<String>? mediaId,
    Expression<String>? localPath,
    Expression<String>? thumbPath,
    Expression<String>? uploadState,
    Expression<String>? downloadState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mediaId != null) 'media_id': mediaId,
      if (localPath != null) 'local_path': localPath,
      if (thumbPath != null) 'thumb_path': thumbPath,
      if (uploadState != null) 'upload_state': uploadState,
      if (downloadState != null) 'download_state': downloadState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaFilesCompanion copyWith({
    Value<String>? mediaId,
    Value<String?>? localPath,
    Value<String?>? thumbPath,
    Value<String>? uploadState,
    Value<String>? downloadState,
    Value<int>? rowid,
  }) {
    return MediaFilesCompanion(
      mediaId: mediaId ?? this.mediaId,
      localPath: localPath ?? this.localPath,
      thumbPath: thumbPath ?? this.thumbPath,
      uploadState: uploadState ?? this.uploadState,
      downloadState: downloadState ?? this.downloadState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (thumbPath.present) {
      map['thumb_path'] = Variable<String>(thumbPath.value);
    }
    if (uploadState.present) {
      map['upload_state'] = Variable<String>(uploadState.value);
    }
    if (downloadState.present) {
      map['download_state'] = Variable<String>(downloadState.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaFilesCompanion(')
          ..write('mediaId: $mediaId, ')
          ..write('localPath: $localPath, ')
          ..write('thumbPath: $thumbPath, ')
          ..write('uploadState: $uploadState, ')
          ..write('downloadState: $downloadState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RelationCacheTable extends RelationCache with TableInfo<$RelationCacheTable, RelationCacheRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelationCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathKeyMeta = const VerificationMeta(
    'pathKey',
  );
  @override
  late final GeneratedColumn<String> pathKey = GeneratedColumn<String>(
    'path_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _termEnMeta = const VerificationMeta('termEn');
  @override
  late final GeneratedColumn<String> termEn = GeneratedColumn<String>(
    'term_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _termHiMeta = const VerificationMeta('termHi');
  @override
  late final GeneratedColumn<String> termHi = GeneratedColumn<String>(
    'term_hi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sideMeta = const VerificationMeta('side');
  @override
  late final GeneratedColumn<String> side = GeneratedColumn<String>(
    'side',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _generationMeta = const VerificationMeta(
    'generation',
  );
  @override
  late final GeneratedColumn<int> generation = GeneratedColumn<int>(
    'generation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _viaIdsMeta = const VerificationMeta('viaIds');
  @override
  late final GeneratedColumn<String> viaIds = GeneratedColumn<String>(
    'via_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _graphVersionMeta = const VerificationMeta(
    'graphVersion',
  );
  @override
  late final GeneratedColumn<int> graphVersion = GeneratedColumn<int>(
    'graph_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    personId,
    pathKey,
    termEn,
    termHi,
    side,
    distance,
    generation,
    viaIds,
    graphVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relation_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<RelationCacheRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('path_key')) {
      context.handle(
        _pathKeyMeta,
        pathKey.isAcceptableOrUnknown(data['path_key']!, _pathKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_pathKeyMeta);
    }
    if (data.containsKey('term_en')) {
      context.handle(
        _termEnMeta,
        termEn.isAcceptableOrUnknown(data['term_en']!, _termEnMeta),
      );
    } else if (isInserting) {
      context.missing(_termEnMeta);
    }
    if (data.containsKey('term_hi')) {
      context.handle(
        _termHiMeta,
        termHi.isAcceptableOrUnknown(data['term_hi']!, _termHiMeta),
      );
    } else if (isInserting) {
      context.missing(_termHiMeta);
    }
    if (data.containsKey('side')) {
      context.handle(
        _sideMeta,
        side.isAcceptableOrUnknown(data['side']!, _sideMeta),
      );
    } else if (isInserting) {
      context.missing(_sideMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('generation')) {
      context.handle(
        _generationMeta,
        generation.isAcceptableOrUnknown(data['generation']!, _generationMeta),
      );
    } else if (isInserting) {
      context.missing(_generationMeta);
    }
    if (data.containsKey('via_ids')) {
      context.handle(
        _viaIdsMeta,
        viaIds.isAcceptableOrUnknown(data['via_ids']!, _viaIdsMeta),
      );
    } else if (isInserting) {
      context.missing(_viaIdsMeta);
    }
    if (data.containsKey('graph_version')) {
      context.handle(
        _graphVersionMeta,
        graphVersion.isAcceptableOrUnknown(
          data['graph_version']!,
          _graphVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_graphVersionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {personId};
  @override
  RelationCacheRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelationCacheRow(
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      pathKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_key'],
      )!,
      termEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}term_en'],
      )!,
      termHi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}term_hi'],
      )!,
      side: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distance'],
      )!,
      generation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}generation'],
      )!,
      viaIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}via_ids'],
      )!,
      graphVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}graph_version'],
      )!,
    );
  }

  @override
  $RelationCacheTable createAlias(String alias) {
    return $RelationCacheTable(attachedDatabase, alias);
  }
}

class RelationCacheRow extends DataClass implements Insertable<RelationCacheRow> {
  final String personId;
  final String pathKey;
  final String termEn;
  final String termHi;
  final String side;
  final int distance;
  final int generation;

  /// JSON array of person ids along the path.
  final String viaIds;
  final int graphVersion;
  const RelationCacheRow({
    required this.personId,
    required this.pathKey,
    required this.termEn,
    required this.termHi,
    required this.side,
    required this.distance,
    required this.generation,
    required this.viaIds,
    required this.graphVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['person_id'] = Variable<String>(personId);
    map['path_key'] = Variable<String>(pathKey);
    map['term_en'] = Variable<String>(termEn);
    map['term_hi'] = Variable<String>(termHi);
    map['side'] = Variable<String>(side);
    map['distance'] = Variable<int>(distance);
    map['generation'] = Variable<int>(generation);
    map['via_ids'] = Variable<String>(viaIds);
    map['graph_version'] = Variable<int>(graphVersion);
    return map;
  }

  RelationCacheCompanion toCompanion(bool nullToAbsent) {
    return RelationCacheCompanion(
      personId: Value(personId),
      pathKey: Value(pathKey),
      termEn: Value(termEn),
      termHi: Value(termHi),
      side: Value(side),
      distance: Value(distance),
      generation: Value(generation),
      viaIds: Value(viaIds),
      graphVersion: Value(graphVersion),
    );
  }

  factory RelationCacheRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelationCacheRow(
      personId: serializer.fromJson<String>(json['person_id']),
      pathKey: serializer.fromJson<String>(json['path_key']),
      termEn: serializer.fromJson<String>(json['term_en']),
      termHi: serializer.fromJson<String>(json['term_hi']),
      side: serializer.fromJson<String>(json['side']),
      distance: serializer.fromJson<int>(json['distance']),
      generation: serializer.fromJson<int>(json['generation']),
      viaIds: serializer.fromJson<String>(json['via_ids']),
      graphVersion: serializer.fromJson<int>(json['graph_version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'person_id': serializer.toJson<String>(personId),
      'path_key': serializer.toJson<String>(pathKey),
      'term_en': serializer.toJson<String>(termEn),
      'term_hi': serializer.toJson<String>(termHi),
      'side': serializer.toJson<String>(side),
      'distance': serializer.toJson<int>(distance),
      'generation': serializer.toJson<int>(generation),
      'via_ids': serializer.toJson<String>(viaIds),
      'graph_version': serializer.toJson<int>(graphVersion),
    };
  }

  RelationCacheRow copyWith({
    String? personId,
    String? pathKey,
    String? termEn,
    String? termHi,
    String? side,
    int? distance,
    int? generation,
    String? viaIds,
    int? graphVersion,
  }) => RelationCacheRow(
    personId: personId ?? this.personId,
    pathKey: pathKey ?? this.pathKey,
    termEn: termEn ?? this.termEn,
    termHi: termHi ?? this.termHi,
    side: side ?? this.side,
    distance: distance ?? this.distance,
    generation: generation ?? this.generation,
    viaIds: viaIds ?? this.viaIds,
    graphVersion: graphVersion ?? this.graphVersion,
  );
  RelationCacheRow copyWithCompanion(RelationCacheCompanion data) {
    return RelationCacheRow(
      personId: data.personId.present ? data.personId.value : this.personId,
      pathKey: data.pathKey.present ? data.pathKey.value : this.pathKey,
      termEn: data.termEn.present ? data.termEn.value : this.termEn,
      termHi: data.termHi.present ? data.termHi.value : this.termHi,
      side: data.side.present ? data.side.value : this.side,
      distance: data.distance.present ? data.distance.value : this.distance,
      generation: data.generation.present ? data.generation.value : this.generation,
      viaIds: data.viaIds.present ? data.viaIds.value : this.viaIds,
      graphVersion: data.graphVersion.present ? data.graphVersion.value : this.graphVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelationCacheRow(')
          ..write('personId: $personId, ')
          ..write('pathKey: $pathKey, ')
          ..write('termEn: $termEn, ')
          ..write('termHi: $termHi, ')
          ..write('side: $side, ')
          ..write('distance: $distance, ')
          ..write('generation: $generation, ')
          ..write('viaIds: $viaIds, ')
          ..write('graphVersion: $graphVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    personId,
    pathKey,
    termEn,
    termHi,
    side,
    distance,
    generation,
    viaIds,
    graphVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelationCacheRow &&
          other.personId == this.personId &&
          other.pathKey == this.pathKey &&
          other.termEn == this.termEn &&
          other.termHi == this.termHi &&
          other.side == this.side &&
          other.distance == this.distance &&
          other.generation == this.generation &&
          other.viaIds == this.viaIds &&
          other.graphVersion == this.graphVersion);
}

class RelationCacheCompanion extends UpdateCompanion<RelationCacheRow> {
  final Value<String> personId;
  final Value<String> pathKey;
  final Value<String> termEn;
  final Value<String> termHi;
  final Value<String> side;
  final Value<int> distance;
  final Value<int> generation;
  final Value<String> viaIds;
  final Value<int> graphVersion;
  final Value<int> rowid;
  const RelationCacheCompanion({
    this.personId = const Value.absent(),
    this.pathKey = const Value.absent(),
    this.termEn = const Value.absent(),
    this.termHi = const Value.absent(),
    this.side = const Value.absent(),
    this.distance = const Value.absent(),
    this.generation = const Value.absent(),
    this.viaIds = const Value.absent(),
    this.graphVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelationCacheCompanion.insert({
    required String personId,
    required String pathKey,
    required String termEn,
    required String termHi,
    required String side,
    required int distance,
    required int generation,
    required String viaIds,
    required int graphVersion,
    this.rowid = const Value.absent(),
  }) : personId = Value(personId),
       pathKey = Value(pathKey),
       termEn = Value(termEn),
       termHi = Value(termHi),
       side = Value(side),
       distance = Value(distance),
       generation = Value(generation),
       viaIds = Value(viaIds),
       graphVersion = Value(graphVersion);
  static Insertable<RelationCacheRow> custom({
    Expression<String>? personId,
    Expression<String>? pathKey,
    Expression<String>? termEn,
    Expression<String>? termHi,
    Expression<String>? side,
    Expression<int>? distance,
    Expression<int>? generation,
    Expression<String>? viaIds,
    Expression<int>? graphVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (personId != null) 'person_id': personId,
      if (pathKey != null) 'path_key': pathKey,
      if (termEn != null) 'term_en': termEn,
      if (termHi != null) 'term_hi': termHi,
      if (side != null) 'side': side,
      if (distance != null) 'distance': distance,
      if (generation != null) 'generation': generation,
      if (viaIds != null) 'via_ids': viaIds,
      if (graphVersion != null) 'graph_version': graphVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelationCacheCompanion copyWith({
    Value<String>? personId,
    Value<String>? pathKey,
    Value<String>? termEn,
    Value<String>? termHi,
    Value<String>? side,
    Value<int>? distance,
    Value<int>? generation,
    Value<String>? viaIds,
    Value<int>? graphVersion,
    Value<int>? rowid,
  }) {
    return RelationCacheCompanion(
      personId: personId ?? this.personId,
      pathKey: pathKey ?? this.pathKey,
      termEn: termEn ?? this.termEn,
      termHi: termHi ?? this.termHi,
      side: side ?? this.side,
      distance: distance ?? this.distance,
      generation: generation ?? this.generation,
      viaIds: viaIds ?? this.viaIds,
      graphVersion: graphVersion ?? this.graphVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (pathKey.present) {
      map['path_key'] = Variable<String>(pathKey.value);
    }
    if (termEn.present) {
      map['term_en'] = Variable<String>(termEn.value);
    }
    if (termHi.present) {
      map['term_hi'] = Variable<String>(termHi.value);
    }
    if (side.present) {
      map['side'] = Variable<String>(side.value);
    }
    if (distance.present) {
      map['distance'] = Variable<int>(distance.value);
    }
    if (generation.present) {
      map['generation'] = Variable<int>(generation.value);
    }
    if (viaIds.present) {
      map['via_ids'] = Variable<String>(viaIds.value);
    }
    if (graphVersion.present) {
      map['graph_version'] = Variable<int>(graphVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelationCacheCompanion(')
          ..write('personId: $personId, ')
          ..write('pathKey: $pathKey, ')
          ..write('termEn: $termEn, ')
          ..write('termHi: $termHi, ')
          ..write('side: $side, ')
          ..write('distance: $distance, ')
          ..write('generation: $generation, ')
          ..write('viaIds: $viaIds, ')
          ..write('graphVersion: $graphVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KvSettingsTable extends KvSettings with TableInfo<$KvSettingsTable, KvSettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KvSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kv_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<KvSettingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  KvSettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KvSettingRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $KvSettingsTable createAlias(String alias) {
    return $KvSettingsTable(attachedDatabase, alias);
  }
}

class KvSettingRow extends DataClass implements Insertable<KvSettingRow> {
  final String key;
  final String value;
  const KvSettingRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  KvSettingsCompanion toCompanion(bool nullToAbsent) {
    return KvSettingsCompanion(key: Value(key), value: Value(value));
  }

  factory KvSettingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KvSettingRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  KvSettingRow copyWith({String? key, String? value}) => KvSettingRow(key: key ?? this.key, value: value ?? this.value);
  KvSettingRow copyWithCompanion(KvSettingsCompanion data) {
    return KvSettingRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KvSettingRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is KvSettingRow && other.key == this.key && other.value == this.value);
}

class KvSettingsCompanion extends UpdateCompanion<KvSettingRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const KvSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KvSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<KvSettingRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KvSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return KvSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KvSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlacesTable places = $PlacesTable(this);
  late final $PeopleTable people = $PeopleTable(this);
  late final $PersonNamesTable personNames = $PersonNamesTable(this);
  late final $PersonContactsTable personContacts = $PersonContactsTable(this);
  late final $PersonAddressesTable personAddresses = $PersonAddressesTable(
    this,
  );
  late final $PersonAttributesTable personAttributes = $PersonAttributesTable(
    this,
  );
  late final $ParentChildTable parentChild = $ParentChildTable(this);
  late final $PartnershipsTable partnerships = $PartnershipsTable(this);
  late final $SocialConnectionsTable socialConnections = $SocialConnectionsTable(this);
  late final $FamilyGroupsTable familyGroups = $FamilyGroupsTable(this);
  late final $FamilyGroupMembersTable familyGroupMembers = $FamilyGroupMembersTable(this);
  late final $PersonMergesTable personMerges = $PersonMergesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $PersonTagsTable personTags = $PersonTagsTable(this);
  late final $InteractionsTable interactions = $InteractionsTable(this);
  late final $InteractionParticipantsTable interactionParticipants = $InteractionParticipantsTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $MediaTable media = $MediaTable(this);
  late final $SyncOutboxTable syncOutbox = $SyncOutboxTable(this);
  late final $SyncCursorsTable syncCursors = $SyncCursorsTable(this);
  late final $SyncIssuesTable syncIssues = $SyncIssuesTable(this);
  late final $MediaFilesTable mediaFiles = $MediaFilesTable(this);
  late final $RelationCacheTable relationCache = $RelationCacheTable(this);
  late final $KvSettingsTable kvSettings = $KvSettingsTable(this);
  late final Index peopleFullNameIdx = Index(
    'people_full_name_idx',
    'CREATE INDEX people_full_name_idx ON people (full_name)',
  );
  late final Index peopleUpdatedIdx = Index(
    'people_updated_idx',
    'CREATE INDEX people_updated_idx ON people (updated_at)',
  );
  late final Index personNamesPersonIdx = Index(
    'person_names_person_idx',
    'CREATE INDEX person_names_person_idx ON person_names (person_id)',
  );
  late final Index personContactsPersonIdx = Index(
    'person_contacts_person_idx',
    'CREATE INDEX person_contacts_person_idx ON person_contacts (person_id)',
  );
  late final Index personContactsValueIdx = Index(
    'person_contacts_value_idx',
    'CREATE INDEX person_contacts_value_idx ON person_contacts (normalized_value)',
  );
  late final Index personAddressesPersonIdx = Index(
    'person_addresses_person_idx',
    'CREATE INDEX person_addresses_person_idx ON person_addresses (person_id)',
  );
  late final Index personAttributesPersonIdx = Index(
    'person_attributes_person_idx',
    'CREATE INDEX person_attributes_person_idx ON person_attributes (person_id)',
  );
  late final Index parentChildParentIdx = Index(
    'parent_child_parent_idx',
    'CREATE INDEX parent_child_parent_idx ON parent_child (parent_id)',
  );
  late final Index parentChildChildIdx = Index(
    'parent_child_child_idx',
    'CREATE INDEX parent_child_child_idx ON parent_child (child_id)',
  );
  late final Index partnershipsAIdx = Index(
    'partnerships_a_idx',
    'CREATE INDEX partnerships_a_idx ON partnerships (person_a_id)',
  );
  late final Index partnershipsBIdx = Index(
    'partnerships_b_idx',
    'CREATE INDEX partnerships_b_idx ON partnerships (person_b_id)',
  );
  late final Index socialPersonIdx = Index(
    'social_person_idx',
    'CREATE INDEX social_person_idx ON social_connections (person_id)',
  );
  late final Index socialOtherIdx = Index(
    'social_other_idx',
    'CREATE INDEX social_other_idx ON social_connections (other_person_id)',
  );
  late final Index familyMembersGroupIdx = Index(
    'family_members_group_idx',
    'CREATE INDEX family_members_group_idx ON family_group_members (family_group_id)',
  );
  late final Index familyMembersPersonIdx = Index(
    'family_members_person_idx',
    'CREATE INDEX family_members_person_idx ON family_group_members (person_id)',
  );
  late final Index personTagsPersonIdx = Index(
    'person_tags_person_idx',
    'CREATE INDEX person_tags_person_idx ON person_tags (person_id)',
  );
  late final Index personTagsTagIdx = Index(
    'person_tags_tag_idx',
    'CREATE INDEX person_tags_tag_idx ON person_tags (tag_id)',
  );
  late final Index interactionsDateIdx = Index(
    'interactions_date_idx',
    'CREATE INDEX interactions_date_idx ON interactions (occurred_at)',
  );
  late final Index participantsInteractionIdx = Index(
    'participants_interaction_idx',
    'CREATE INDEX participants_interaction_idx ON interaction_participants (interaction_id)',
  );
  late final Index participantsPersonIdx = Index(
    'participants_person_idx',
    'CREATE INDEX participants_person_idx ON interaction_participants (person_id)',
  );
  late final Index remindersDueIdx = Index(
    'reminders_due_idx',
    'CREATE INDEX reminders_due_idx ON reminders (due_at)',
  );
  late final Index mediaPersonIdx = Index(
    'media_person_idx',
    'CREATE INDEX media_person_idx ON media (person_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    places,
    people,
    personNames,
    personContacts,
    personAddresses,
    personAttributes,
    parentChild,
    partnerships,
    socialConnections,
    familyGroups,
    familyGroupMembers,
    personMerges,
    tags,
    personTags,
    interactions,
    interactionParticipants,
    reminders,
    media,
    syncOutbox,
    syncCursors,
    syncIssues,
    mediaFiles,
    relationCache,
    kvSettings,
    peopleFullNameIdx,
    peopleUpdatedIdx,
    personNamesPersonIdx,
    personContactsPersonIdx,
    personContactsValueIdx,
    personAddressesPersonIdx,
    personAttributesPersonIdx,
    parentChildParentIdx,
    parentChildChildIdx,
    partnershipsAIdx,
    partnershipsBIdx,
    socialPersonIdx,
    socialOtherIdx,
    familyMembersGroupIdx,
    familyMembersPersonIdx,
    personTagsPersonIdx,
    personTagsTagIdx,
    interactionsDateIdx,
    participantsInteractionIdx,
    participantsPersonIdx,
    remindersDueIdx,
    mediaPersonIdx,
  ];
  @override
  DriftDatabaseOptions get options => const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$PlacesTableCreateCompanionBuilder = PlacesCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String name,
  Value<String?> nameAlt,
  Value<String> placeType,
  Value<String?> parentPlaceId,
  Value<String?> pincode,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<int> rowid,
});
typedef $$PlacesTableUpdateCompanionBuilder = PlacesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> name,
  Value<String?> nameAlt,
  Value<String> placeType,
  Value<String?> parentPlaceId,
  Value<String?> pincode,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<int> rowid,
});

class $$PlacesTableFilterComposer extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAlt => $composableBuilder(
    column: $table.nameAlt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placeType => $composableBuilder(
    column: $table.placeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentPlaceId => $composableBuilder(
    column: $table.parentPlaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pincode => $composableBuilder(
    column: $table.pincode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlacesTableOrderingComposer extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAlt => $composableBuilder(
    column: $table.nameAlt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeType => $composableBuilder(
    column: $table.placeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentPlaceId => $composableBuilder(
    column: $table.parentPlaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pincode => $composableBuilder(
    column: $table.pincode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlacesTableAnnotationComposer extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get name => $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameAlt => $composableBuilder(column: $table.nameAlt, builder: (column) => column);

  GeneratedColumn<String> get placeType => $composableBuilder(column: $table.placeType, builder: (column) => column);

  GeneratedColumn<String> get parentPlaceId => $composableBuilder(
    column: $table.parentPlaceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pincode => $composableBuilder(column: $table.pincode, builder: (column) => column);

  GeneratedColumn<double> get latitude => $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude => $composableBuilder(column: $table.longitude, builder: (column) => column);
}

class $$PlacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlacesTable,
          PlaceRow,
          $$PlacesTableFilterComposer,
          $$PlacesTableOrderingComposer,
          $$PlacesTableAnnotationComposer,
          $$PlacesTableCreateCompanionBuilder,
          $$PlacesTableUpdateCompanionBuilder,
          (PlaceRow, BaseReferences<_$AppDatabase, $PlacesTable, PlaceRow>),
          PlaceRow,
          PrefetchHooks Function()
        > {
  $$PlacesTableTableManager(_$AppDatabase db, $PlacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PlacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PlacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PlacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nameAlt = const Value.absent(),
                Value<String> placeType = const Value.absent(),
                Value<String?> parentPlaceId = const Value.absent(),
                Value<String?> pincode = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlacesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                name: name,
                nameAlt: nameAlt,
                placeType: placeType,
                parentPlaceId: parentPlaceId,
                pincode: pincode,
                latitude: latitude,
                longitude: longitude,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String name,
                Value<String?> nameAlt = const Value.absent(),
                Value<String> placeType = const Value.absent(),
                Value<String?> parentPlaceId = const Value.absent(),
                Value<String?> pincode = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlacesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                name: name,
                nameAlt: nameAlt,
                placeType: placeType,
                parentPlaceId: parentPlaceId,
                pincode: pincode,
                latitude: latitude,
                longitude: longitude,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlacesTable, PlaceRow>(table),
                  BaseReferences<_$AppDatabase, $PlacesTable, PlaceRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlacesTable,
      PlaceRow,
      $$PlacesTableFilterComposer,
      $$PlacesTableOrderingComposer,
      $$PlacesTableAnnotationComposer,
      $$PlacesTableCreateCompanionBuilder,
      $$PlacesTableUpdateCompanionBuilder,
      (PlaceRow, BaseReferences<_$AppDatabase, $PlacesTable, PlaceRow>),
      PlaceRow,
      PrefetchHooks Function()
    >;
typedef $$PeopleTableCreateCompanionBuilder = PeopleCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String fullName,
  Value<String?> fullNameAlt,
  Value<String?> nickname,
  Value<String?> surname,
  Value<String> gender,
  Value<bool?> isLiving,
  Value<int?> birthYear,
  Value<int?> birthMonth,
  Value<int?> birthDay,
  Value<bool> birthDateApprox,
  Value<int?> birthOrder,
  Value<int?> deathYear,
  Value<int?> deathMonth,
  Value<int?> deathDay,
  Value<String?> birthPlaceId,
  Value<String?> nativePlaceId,
  Value<String?> gotra,
  Value<String?> occupation,
  Value<String?> organization,
  Value<String?> designation,
  Value<String?> education,
  Value<String?> notes,
  Value<bool> isSelf,
  Value<bool> isPlaceholder,
  Value<bool> isFavorite,
  Value<bool> notifyBirthday,
  Value<String?> mergedIntoId,
  Value<String> searchText,
  Value<int> rowid,
});
typedef $$PeopleTableUpdateCompanionBuilder = PeopleCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> fullName,
  Value<String?> fullNameAlt,
  Value<String?> nickname,
  Value<String?> surname,
  Value<String> gender,
  Value<bool?> isLiving,
  Value<int?> birthYear,
  Value<int?> birthMonth,
  Value<int?> birthDay,
  Value<bool> birthDateApprox,
  Value<int?> birthOrder,
  Value<int?> deathYear,
  Value<int?> deathMonth,
  Value<int?> deathDay,
  Value<String?> birthPlaceId,
  Value<String?> nativePlaceId,
  Value<String?> gotra,
  Value<String?> occupation,
  Value<String?> organization,
  Value<String?> designation,
  Value<String?> education,
  Value<String?> notes,
  Value<bool> isSelf,
  Value<bool> isPlaceholder,
  Value<bool> isFavorite,
  Value<bool> notifyBirthday,
  Value<String?> mergedIntoId,
  Value<String> searchText,
  Value<int> rowid,
});

class $$PeopleTableFilterComposer extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullNameAlt => $composableBuilder(
    column: $table.fullNameAlt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surname => $composableBuilder(
    column: $table.surname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLiving => $composableBuilder(
    column: $table.isLiving,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birthMonth => $composableBuilder(
    column: $table.birthMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birthDay => $composableBuilder(
    column: $table.birthDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get birthDateApprox => $composableBuilder(
    column: $table.birthDateApprox,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birthOrder => $composableBuilder(
    column: $table.birthOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deathYear => $composableBuilder(
    column: $table.deathYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deathMonth => $composableBuilder(
    column: $table.deathMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deathDay => $composableBuilder(
    column: $table.deathDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthPlaceId => $composableBuilder(
    column: $table.birthPlaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nativePlaceId => $composableBuilder(
    column: $table.nativePlaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gotra => $composableBuilder(
    column: $table.gotra,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organization => $composableBuilder(
    column: $table.organization,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get designation => $composableBuilder(
    column: $table.designation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get education => $composableBuilder(
    column: $table.education,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSelf => $composableBuilder(
    column: $table.isSelf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPlaceholder => $composableBuilder(
    column: $table.isPlaceholder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyBirthday => $composableBuilder(
    column: $table.notifyBirthday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mergedIntoId => $composableBuilder(
    column: $table.mergedIntoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get searchText => $composableBuilder(
    column: $table.searchText,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PeopleTableOrderingComposer extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullNameAlt => $composableBuilder(
    column: $table.fullNameAlt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nickname => $composableBuilder(
    column: $table.nickname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surname => $composableBuilder(
    column: $table.surname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLiving => $composableBuilder(
    column: $table.isLiving,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birthMonth => $composableBuilder(
    column: $table.birthMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birthDay => $composableBuilder(
    column: $table.birthDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get birthDateApprox => $composableBuilder(
    column: $table.birthDateApprox,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birthOrder => $composableBuilder(
    column: $table.birthOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deathYear => $composableBuilder(
    column: $table.deathYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deathMonth => $composableBuilder(
    column: $table.deathMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deathDay => $composableBuilder(
    column: $table.deathDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthPlaceId => $composableBuilder(
    column: $table.birthPlaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nativePlaceId => $composableBuilder(
    column: $table.nativePlaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gotra => $composableBuilder(
    column: $table.gotra,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organization => $composableBuilder(
    column: $table.organization,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get designation => $composableBuilder(
    column: $table.designation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get education => $composableBuilder(
    column: $table.education,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSelf => $composableBuilder(
    column: $table.isSelf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPlaceholder => $composableBuilder(
    column: $table.isPlaceholder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyBirthday => $composableBuilder(
    column: $table.notifyBirthday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mergedIntoId => $composableBuilder(
    column: $table.mergedIntoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get searchText => $composableBuilder(
    column: $table.searchText,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PeopleTableAnnotationComposer extends Composer<_$AppDatabase, $PeopleTable> {
  $$PeopleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get fullName => $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get fullNameAlt => $composableBuilder(
    column: $table.fullNameAlt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nickname => $composableBuilder(column: $table.nickname, builder: (column) => column);

  GeneratedColumn<String> get surname => $composableBuilder(column: $table.surname, builder: (column) => column);

  GeneratedColumn<String> get gender => $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<bool> get isLiving => $composableBuilder(column: $table.isLiving, builder: (column) => column);

  GeneratedColumn<int> get birthYear => $composableBuilder(column: $table.birthYear, builder: (column) => column);

  GeneratedColumn<int> get birthMonth => $composableBuilder(
    column: $table.birthMonth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get birthDay => $composableBuilder(column: $table.birthDay, builder: (column) => column);

  GeneratedColumn<bool> get birthDateApprox => $composableBuilder(
    column: $table.birthDateApprox,
    builder: (column) => column,
  );

  GeneratedColumn<int> get birthOrder => $composableBuilder(
    column: $table.birthOrder,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deathYear => $composableBuilder(column: $table.deathYear, builder: (column) => column);

  GeneratedColumn<int> get deathMonth => $composableBuilder(
    column: $table.deathMonth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get deathDay => $composableBuilder(column: $table.deathDay, builder: (column) => column);

  GeneratedColumn<String> get birthPlaceId => $composableBuilder(
    column: $table.birthPlaceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nativePlaceId => $composableBuilder(
    column: $table.nativePlaceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gotra => $composableBuilder(column: $table.gotra, builder: (column) => column);

  GeneratedColumn<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get organization => $composableBuilder(
    column: $table.organization,
    builder: (column) => column,
  );

  GeneratedColumn<String> get designation => $composableBuilder(
    column: $table.designation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get education => $composableBuilder(column: $table.education, builder: (column) => column);

  GeneratedColumn<String> get notes => $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isSelf => $composableBuilder(column: $table.isSelf, builder: (column) => column);

  GeneratedColumn<bool> get isPlaceholder => $composableBuilder(
    column: $table.isPlaceholder,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notifyBirthday => $composableBuilder(
    column: $table.notifyBirthday,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mergedIntoId => $composableBuilder(
    column: $table.mergedIntoId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get searchText => $composableBuilder(
    column: $table.searchText,
    builder: (column) => column,
  );
}

class $$PeopleTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PeopleTable,
          PersonRow,
          $$PeopleTableFilterComposer,
          $$PeopleTableOrderingComposer,
          $$PeopleTableAnnotationComposer,
          $$PeopleTableCreateCompanionBuilder,
          $$PeopleTableUpdateCompanionBuilder,
          (PersonRow, BaseReferences<_$AppDatabase, $PeopleTable, PersonRow>),
          PersonRow,
          PrefetchHooks Function()
        > {
  $$PeopleTableTableManager(_$AppDatabase db, $PeopleTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PeopleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PeopleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PeopleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> fullNameAlt = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String?> surname = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<bool?> isLiving = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
                Value<int?> birthMonth = const Value.absent(),
                Value<int?> birthDay = const Value.absent(),
                Value<bool> birthDateApprox = const Value.absent(),
                Value<int?> birthOrder = const Value.absent(),
                Value<int?> deathYear = const Value.absent(),
                Value<int?> deathMonth = const Value.absent(),
                Value<int?> deathDay = const Value.absent(),
                Value<String?> birthPlaceId = const Value.absent(),
                Value<String?> nativePlaceId = const Value.absent(),
                Value<String?> gotra = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> organization = const Value.absent(),
                Value<String?> designation = const Value.absent(),
                Value<String?> education = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isSelf = const Value.absent(),
                Value<bool> isPlaceholder = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> notifyBirthday = const Value.absent(),
                Value<String?> mergedIntoId = const Value.absent(),
                Value<String> searchText = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeopleCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                fullName: fullName,
                fullNameAlt: fullNameAlt,
                nickname: nickname,
                surname: surname,
                gender: gender,
                isLiving: isLiving,
                birthYear: birthYear,
                birthMonth: birthMonth,
                birthDay: birthDay,
                birthDateApprox: birthDateApprox,
                birthOrder: birthOrder,
                deathYear: deathYear,
                deathMonth: deathMonth,
                deathDay: deathDay,
                birthPlaceId: birthPlaceId,
                nativePlaceId: nativePlaceId,
                gotra: gotra,
                occupation: occupation,
                organization: organization,
                designation: designation,
                education: education,
                notes: notes,
                isSelf: isSelf,
                isPlaceholder: isPlaceholder,
                isFavorite: isFavorite,
                notifyBirthday: notifyBirthday,
                mergedIntoId: mergedIntoId,
                searchText: searchText,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String fullName,
                Value<String?> fullNameAlt = const Value.absent(),
                Value<String?> nickname = const Value.absent(),
                Value<String?> surname = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<bool?> isLiving = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
                Value<int?> birthMonth = const Value.absent(),
                Value<int?> birthDay = const Value.absent(),
                Value<bool> birthDateApprox = const Value.absent(),
                Value<int?> birthOrder = const Value.absent(),
                Value<int?> deathYear = const Value.absent(),
                Value<int?> deathMonth = const Value.absent(),
                Value<int?> deathDay = const Value.absent(),
                Value<String?> birthPlaceId = const Value.absent(),
                Value<String?> nativePlaceId = const Value.absent(),
                Value<String?> gotra = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> organization = const Value.absent(),
                Value<String?> designation = const Value.absent(),
                Value<String?> education = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isSelf = const Value.absent(),
                Value<bool> isPlaceholder = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> notifyBirthday = const Value.absent(),
                Value<String?> mergedIntoId = const Value.absent(),
                Value<String> searchText = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeopleCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                fullName: fullName,
                fullNameAlt: fullNameAlt,
                nickname: nickname,
                surname: surname,
                gender: gender,
                isLiving: isLiving,
                birthYear: birthYear,
                birthMonth: birthMonth,
                birthDay: birthDay,
                birthDateApprox: birthDateApprox,
                birthOrder: birthOrder,
                deathYear: deathYear,
                deathMonth: deathMonth,
                deathDay: deathDay,
                birthPlaceId: birthPlaceId,
                nativePlaceId: nativePlaceId,
                gotra: gotra,
                occupation: occupation,
                organization: organization,
                designation: designation,
                education: education,
                notes: notes,
                isSelf: isSelf,
                isPlaceholder: isPlaceholder,
                isFavorite: isFavorite,
                notifyBirthday: notifyBirthday,
                mergedIntoId: mergedIntoId,
                searchText: searchText,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PeopleTable, PersonRow>(table),
                  BaseReferences<_$AppDatabase, $PeopleTable, PersonRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PeopleTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PeopleTable,
      PersonRow,
      $$PeopleTableFilterComposer,
      $$PeopleTableOrderingComposer,
      $$PeopleTableAnnotationComposer,
      $$PeopleTableCreateCompanionBuilder,
      $$PeopleTableUpdateCompanionBuilder,
      (PersonRow, BaseReferences<_$AppDatabase, $PeopleTable, PersonRow>),
      PersonRow,
      PrefetchHooks Function()
    >;
typedef $$PersonNamesTableCreateCompanionBuilder = PersonNamesCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String personId,
  required String name,
  Value<String> nameType,
  Value<int> rowid,
});
typedef $$PersonNamesTableUpdateCompanionBuilder = PersonNamesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> personId,
  Value<String> name,
  Value<String> nameType,
  Value<int> rowid,
});

class $$PersonNamesTableFilterComposer extends Composer<_$AppDatabase, $PersonNamesTable> {
  $$PersonNamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameType => $composableBuilder(
    column: $table.nameType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonNamesTableOrderingComposer extends Composer<_$AppDatabase, $PersonNamesTable> {
  $$PersonNamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameType => $composableBuilder(
    column: $table.nameType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonNamesTableAnnotationComposer extends Composer<_$AppDatabase, $PersonNamesTable> {
  $$PersonNamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get name => $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameType => $composableBuilder(column: $table.nameType, builder: (column) => column);
}

class $$PersonNamesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonNamesTable,
          PersonNameRow,
          $$PersonNamesTableFilterComposer,
          $$PersonNamesTableOrderingComposer,
          $$PersonNamesTableAnnotationComposer,
          $$PersonNamesTableCreateCompanionBuilder,
          $$PersonNamesTableUpdateCompanionBuilder,
          (
            PersonNameRow,
            BaseReferences<_$AppDatabase, $PersonNamesTable, PersonNameRow>,
          ),
          PersonNameRow,
          PrefetchHooks Function()
        > {
  $$PersonNamesTableTableManager(_$AppDatabase db, $PersonNamesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PersonNamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PersonNamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PersonNamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonNamesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                name: name,
                nameType: nameType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String personId,
                required String name,
                Value<String> nameType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonNamesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                name: name,
                nameType: nameType,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonNamesTable, PersonNameRow>(table),
                  BaseReferences<_$AppDatabase, $PersonNamesTable, PersonNameRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonNamesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonNamesTable,
      PersonNameRow,
      $$PersonNamesTableFilterComposer,
      $$PersonNamesTableOrderingComposer,
      $$PersonNamesTableAnnotationComposer,
      $$PersonNamesTableCreateCompanionBuilder,
      $$PersonNamesTableUpdateCompanionBuilder,
      (
        PersonNameRow,
        BaseReferences<_$AppDatabase, $PersonNamesTable, PersonNameRow>,
      ),
      PersonNameRow,
      PrefetchHooks Function()
    >;
typedef $$PersonContactsTableCreateCompanionBuilder = PersonContactsCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String personId,
  required String kind,
  required String value,
  Value<String?> normalizedValue,
  Value<String?> label,
  Value<bool> isWhatsapp,
  Value<bool> isPrimary,
  Value<int> rowid,
});
typedef $$PersonContactsTableUpdateCompanionBuilder = PersonContactsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> personId,
  Value<String> kind,
  Value<String> value,
  Value<String?> normalizedValue,
  Value<String?> label,
  Value<bool> isWhatsapp,
  Value<bool> isPrimary,
  Value<int> rowid,
});

class $$PersonContactsTableFilterComposer extends Composer<_$AppDatabase, $PersonContactsTable> {
  $$PersonContactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get normalizedValue => $composableBuilder(
    column: $table.normalizedValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isWhatsapp => $composableBuilder(
    column: $table.isWhatsapp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonContactsTableOrderingComposer extends Composer<_$AppDatabase, $PersonContactsTable> {
  $$PersonContactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get normalizedValue => $composableBuilder(
    column: $table.normalizedValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isWhatsapp => $composableBuilder(
    column: $table.isWhatsapp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonContactsTableAnnotationComposer extends Composer<_$AppDatabase, $PersonContactsTable> {
  $$PersonContactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get value => $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get normalizedValue => $composableBuilder(
    column: $table.normalizedValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get label => $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<bool> get isWhatsapp => $composableBuilder(
    column: $table.isWhatsapp,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPrimary => $composableBuilder(column: $table.isPrimary, builder: (column) => column);
}

class $$PersonContactsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonContactsTable,
          PersonContactRow,
          $$PersonContactsTableFilterComposer,
          $$PersonContactsTableOrderingComposer,
          $$PersonContactsTableAnnotationComposer,
          $$PersonContactsTableCreateCompanionBuilder,
          $$PersonContactsTableUpdateCompanionBuilder,
          (
            PersonContactRow,
            BaseReferences<_$AppDatabase, $PersonContactsTable, PersonContactRow>,
          ),
          PersonContactRow,
          PrefetchHooks Function()
        > {
  $$PersonContactsTableTableManager(
    _$AppDatabase db,
    $PersonContactsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PersonContactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PersonContactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PersonContactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<String?> normalizedValue = const Value.absent(),
                Value<String?> label = const Value.absent(),
                Value<bool> isWhatsapp = const Value.absent(),
                Value<bool> isPrimary = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonContactsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                kind: kind,
                value: value,
                normalizedValue: normalizedValue,
                label: label,
                isWhatsapp: isWhatsapp,
                isPrimary: isPrimary,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String personId,
                required String kind,
                required String value,
                Value<String?> normalizedValue = const Value.absent(),
                Value<String?> label = const Value.absent(),
                Value<bool> isWhatsapp = const Value.absent(),
                Value<bool> isPrimary = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonContactsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                kind: kind,
                value: value,
                normalizedValue: normalizedValue,
                label: label,
                isWhatsapp: isWhatsapp,
                isPrimary: isPrimary,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonContactsTable, PersonContactRow>(table),
                  BaseReferences<_$AppDatabase, $PersonContactsTable, PersonContactRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonContactsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonContactsTable,
      PersonContactRow,
      $$PersonContactsTableFilterComposer,
      $$PersonContactsTableOrderingComposer,
      $$PersonContactsTableAnnotationComposer,
      $$PersonContactsTableCreateCompanionBuilder,
      $$PersonContactsTableUpdateCompanionBuilder,
      (
        PersonContactRow,
        BaseReferences<_$AppDatabase, $PersonContactsTable, PersonContactRow>,
      ),
      PersonContactRow,
      PrefetchHooks Function()
    >;
typedef $$PersonAddressesTableCreateCompanionBuilder = PersonAddressesCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String personId,
  Value<String> label,
  Value<String?> addressLine,
  Value<String?> placeId,
  Value<String?> pincode,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<bool> isPrimary,
  Value<int> rowid,
});
typedef $$PersonAddressesTableUpdateCompanionBuilder = PersonAddressesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> personId,
  Value<String> label,
  Value<String?> addressLine,
  Value<String?> placeId,
  Value<String?> pincode,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<bool> isPrimary,
  Value<int> rowid,
});

class $$PersonAddressesTableFilterComposer extends Composer<_$AppDatabase, $PersonAddressesTable> {
  $$PersonAddressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placeId => $composableBuilder(
    column: $table.placeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pincode => $composableBuilder(
    column: $table.pincode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonAddressesTableOrderingComposer extends Composer<_$AppDatabase, $PersonAddressesTable> {
  $$PersonAddressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeId => $composableBuilder(
    column: $table.placeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pincode => $composableBuilder(
    column: $table.pincode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonAddressesTableAnnotationComposer extends Composer<_$AppDatabase, $PersonAddressesTable> {
  $$PersonAddressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get label => $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => column,
  );

  GeneratedColumn<String> get placeId => $composableBuilder(column: $table.placeId, builder: (column) => column);

  GeneratedColumn<String> get pincode => $composableBuilder(column: $table.pincode, builder: (column) => column);

  GeneratedColumn<double> get latitude => $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude => $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<bool> get isPrimary => $composableBuilder(column: $table.isPrimary, builder: (column) => column);
}

class $$PersonAddressesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonAddressesTable,
          PersonAddressRow,
          $$PersonAddressesTableFilterComposer,
          $$PersonAddressesTableOrderingComposer,
          $$PersonAddressesTableAnnotationComposer,
          $$PersonAddressesTableCreateCompanionBuilder,
          $$PersonAddressesTableUpdateCompanionBuilder,
          (
            PersonAddressRow,
            BaseReferences<_$AppDatabase, $PersonAddressesTable, PersonAddressRow>,
          ),
          PersonAddressRow,
          PrefetchHooks Function()
        > {
  $$PersonAddressesTableTableManager(
    _$AppDatabase db,
    $PersonAddressesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PersonAddressesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PersonAddressesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PersonAddressesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String?> addressLine = const Value.absent(),
                Value<String?> placeId = const Value.absent(),
                Value<String?> pincode = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<bool> isPrimary = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonAddressesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                label: label,
                addressLine: addressLine,
                placeId: placeId,
                pincode: pincode,
                latitude: latitude,
                longitude: longitude,
                isPrimary: isPrimary,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String personId,
                Value<String> label = const Value.absent(),
                Value<String?> addressLine = const Value.absent(),
                Value<String?> placeId = const Value.absent(),
                Value<String?> pincode = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<bool> isPrimary = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonAddressesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                label: label,
                addressLine: addressLine,
                placeId: placeId,
                pincode: pincode,
                latitude: latitude,
                longitude: longitude,
                isPrimary: isPrimary,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonAddressesTable, PersonAddressRow>(table),
                  BaseReferences<_$AppDatabase, $PersonAddressesTable, PersonAddressRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonAddressesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonAddressesTable,
      PersonAddressRow,
      $$PersonAddressesTableFilterComposer,
      $$PersonAddressesTableOrderingComposer,
      $$PersonAddressesTableAnnotationComposer,
      $$PersonAddressesTableCreateCompanionBuilder,
      $$PersonAddressesTableUpdateCompanionBuilder,
      (
        PersonAddressRow,
        BaseReferences<_$AppDatabase, $PersonAddressesTable, PersonAddressRow>,
      ),
      PersonAddressRow,
      PrefetchHooks Function()
    >;
typedef $$PersonAttributesTableCreateCompanionBuilder = PersonAttributesCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String personId,
  required String key,
  Value<String?> value,
  Value<int> rowid,
});
typedef $$PersonAttributesTableUpdateCompanionBuilder = PersonAttributesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> personId,
  Value<String> key,
  Value<String?> value,
  Value<int> rowid,
});

class $$PersonAttributesTableFilterComposer extends Composer<_$AppDatabase, $PersonAttributesTable> {
  $$PersonAttributesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonAttributesTableOrderingComposer extends Composer<_$AppDatabase, $PersonAttributesTable> {
  $$PersonAttributesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonAttributesTableAnnotationComposer extends Composer<_$AppDatabase, $PersonAttributesTable> {
  $$PersonAttributesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get key => $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value => $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$PersonAttributesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonAttributesTable,
          PersonAttributeRow,
          $$PersonAttributesTableFilterComposer,
          $$PersonAttributesTableOrderingComposer,
          $$PersonAttributesTableAnnotationComposer,
          $$PersonAttributesTableCreateCompanionBuilder,
          $$PersonAttributesTableUpdateCompanionBuilder,
          (
            PersonAttributeRow,
            BaseReferences<_$AppDatabase, $PersonAttributesTable, PersonAttributeRow>,
          ),
          PersonAttributeRow,
          PrefetchHooks Function()
        > {
  $$PersonAttributesTableTableManager(
    _$AppDatabase db,
    $PersonAttributesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PersonAttributesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PersonAttributesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PersonAttributesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonAttributesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                key: key,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String personId,
                required String key,
                Value<String?> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonAttributesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonAttributesTable, PersonAttributeRow>(
                    table,
                  ),
                  BaseReferences<_$AppDatabase, $PersonAttributesTable, PersonAttributeRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonAttributesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonAttributesTable,
      PersonAttributeRow,
      $$PersonAttributesTableFilterComposer,
      $$PersonAttributesTableOrderingComposer,
      $$PersonAttributesTableAnnotationComposer,
      $$PersonAttributesTableCreateCompanionBuilder,
      $$PersonAttributesTableUpdateCompanionBuilder,
      (
        PersonAttributeRow,
        BaseReferences<_$AppDatabase, $PersonAttributesTable, PersonAttributeRow>,
      ),
      PersonAttributeRow,
      PrefetchHooks Function()
    >;
typedef $$ParentChildTableCreateCompanionBuilder = ParentChildCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String parentId,
  required String childId,
  Value<String> kind,
  Value<String> certainty,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$ParentChildTableUpdateCompanionBuilder = ParentChildCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> parentId,
  Value<String> childId,
  Value<String> kind,
  Value<String> certainty,
  Value<String?> notes,
  Value<int> rowid,
});

class $$ParentChildTableFilterComposer extends Composer<_$AppDatabase, $ParentChildTable> {
  $$ParentChildTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get certainty => $composableBuilder(
    column: $table.certainty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ParentChildTableOrderingComposer extends Composer<_$AppDatabase, $ParentChildTable> {
  $$ParentChildTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get certainty => $composableBuilder(
    column: $table.certainty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ParentChildTableAnnotationComposer extends Composer<_$AppDatabase, $ParentChildTable> {
  $$ParentChildTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get parentId => $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get childId => $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get certainty => $composableBuilder(column: $table.certainty, builder: (column) => column);

  GeneratedColumn<String> get notes => $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ParentChildTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParentChildTable,
          ParentChildRow,
          $$ParentChildTableFilterComposer,
          $$ParentChildTableOrderingComposer,
          $$ParentChildTableAnnotationComposer,
          $$ParentChildTableCreateCompanionBuilder,
          $$ParentChildTableUpdateCompanionBuilder,
          (
            ParentChildRow,
            BaseReferences<_$AppDatabase, $ParentChildTable, ParentChildRow>,
          ),
          ParentChildRow,
          PrefetchHooks Function()
        > {
  $$ParentChildTableTableManager(_$AppDatabase db, $ParentChildTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$ParentChildTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$ParentChildTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$ParentChildTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> parentId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> certainty = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ParentChildCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                parentId: parentId,
                childId: childId,
                kind: kind,
                certainty: certainty,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String parentId,
                required String childId,
                Value<String> kind = const Value.absent(),
                Value<String> certainty = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ParentChildCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                parentId: parentId,
                childId: childId,
                kind: kind,
                certainty: certainty,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ParentChildTable, ParentChildRow>(table),
                  BaseReferences<_$AppDatabase, $ParentChildTable, ParentChildRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ParentChildTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParentChildTable,
      ParentChildRow,
      $$ParentChildTableFilterComposer,
      $$ParentChildTableOrderingComposer,
      $$ParentChildTableAnnotationComposer,
      $$ParentChildTableCreateCompanionBuilder,
      $$ParentChildTableUpdateCompanionBuilder,
      (
        ParentChildRow,
        BaseReferences<_$AppDatabase, $ParentChildTable, ParentChildRow>,
      ),
      ParentChildRow,
      PrefetchHooks Function()
    >;
typedef $$PartnershipsTableCreateCompanionBuilder = PartnershipsCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String personAId,
  required String personBId,
  Value<String> kind,
  Value<String> status,
  Value<int?> startYear,
  Value<int?> startMonth,
  Value<int?> startDay,
  Value<bool> startDateApprox,
  Value<int?> endYear,
  Value<String?> placeId,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$PartnershipsTableUpdateCompanionBuilder = PartnershipsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> personAId,
  Value<String> personBId,
  Value<String> kind,
  Value<String> status,
  Value<int?> startYear,
  Value<int?> startMonth,
  Value<int?> startDay,
  Value<bool> startDateApprox,
  Value<int?> endYear,
  Value<String?> placeId,
  Value<String?> notes,
  Value<int> rowid,
});

class $$PartnershipsTableFilterComposer extends Composer<_$AppDatabase, $PartnershipsTable> {
  $$PartnershipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personAId => $composableBuilder(
    column: $table.personAId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personBId => $composableBuilder(
    column: $table.personBId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startYear => $composableBuilder(
    column: $table.startYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMonth => $composableBuilder(
    column: $table.startMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startDay => $composableBuilder(
    column: $table.startDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get startDateApprox => $composableBuilder(
    column: $table.startDateApprox,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endYear => $composableBuilder(
    column: $table.endYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placeId => $composableBuilder(
    column: $table.placeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PartnershipsTableOrderingComposer extends Composer<_$AppDatabase, $PartnershipsTable> {
  $$PartnershipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personAId => $composableBuilder(
    column: $table.personAId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personBId => $composableBuilder(
    column: $table.personBId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startYear => $composableBuilder(
    column: $table.startYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMonth => $composableBuilder(
    column: $table.startMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startDay => $composableBuilder(
    column: $table.startDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get startDateApprox => $composableBuilder(
    column: $table.startDateApprox,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endYear => $composableBuilder(
    column: $table.endYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeId => $composableBuilder(
    column: $table.placeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PartnershipsTableAnnotationComposer extends Composer<_$AppDatabase, $PartnershipsTable> {
  $$PartnershipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personAId => $composableBuilder(column: $table.personAId, builder: (column) => column);

  GeneratedColumn<String> get personBId => $composableBuilder(column: $table.personBId, builder: (column) => column);

  GeneratedColumn<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get status => $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get startYear => $composableBuilder(column: $table.startYear, builder: (column) => column);

  GeneratedColumn<int> get startMonth => $composableBuilder(
    column: $table.startMonth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startDay => $composableBuilder(column: $table.startDay, builder: (column) => column);

  GeneratedColumn<bool> get startDateApprox => $composableBuilder(
    column: $table.startDateApprox,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endYear => $composableBuilder(column: $table.endYear, builder: (column) => column);

  GeneratedColumn<String> get placeId => $composableBuilder(column: $table.placeId, builder: (column) => column);

  GeneratedColumn<String> get notes => $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PartnershipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PartnershipsTable,
          PartnershipRow,
          $$PartnershipsTableFilterComposer,
          $$PartnershipsTableOrderingComposer,
          $$PartnershipsTableAnnotationComposer,
          $$PartnershipsTableCreateCompanionBuilder,
          $$PartnershipsTableUpdateCompanionBuilder,
          (
            PartnershipRow,
            BaseReferences<_$AppDatabase, $PartnershipsTable, PartnershipRow>,
          ),
          PartnershipRow,
          PrefetchHooks Function()
        > {
  $$PartnershipsTableTableManager(_$AppDatabase db, $PartnershipsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PartnershipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PartnershipsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PartnershipsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> personAId = const Value.absent(),
                Value<String> personBId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> startYear = const Value.absent(),
                Value<int?> startMonth = const Value.absent(),
                Value<int?> startDay = const Value.absent(),
                Value<bool> startDateApprox = const Value.absent(),
                Value<int?> endYear = const Value.absent(),
                Value<String?> placeId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PartnershipsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personAId: personAId,
                personBId: personBId,
                kind: kind,
                status: status,
                startYear: startYear,
                startMonth: startMonth,
                startDay: startDay,
                startDateApprox: startDateApprox,
                endYear: endYear,
                placeId: placeId,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String personAId,
                required String personBId,
                Value<String> kind = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> startYear = const Value.absent(),
                Value<int?> startMonth = const Value.absent(),
                Value<int?> startDay = const Value.absent(),
                Value<bool> startDateApprox = const Value.absent(),
                Value<int?> endYear = const Value.absent(),
                Value<String?> placeId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PartnershipsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personAId: personAId,
                personBId: personBId,
                kind: kind,
                status: status,
                startYear: startYear,
                startMonth: startMonth,
                startDay: startDay,
                startDateApprox: startDateApprox,
                endYear: endYear,
                placeId: placeId,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PartnershipsTable, PartnershipRow>(table),
                  BaseReferences<_$AppDatabase, $PartnershipsTable, PartnershipRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PartnershipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PartnershipsTable,
      PartnershipRow,
      $$PartnershipsTableFilterComposer,
      $$PartnershipsTableOrderingComposer,
      $$PartnershipsTableAnnotationComposer,
      $$PartnershipsTableCreateCompanionBuilder,
      $$PartnershipsTableUpdateCompanionBuilder,
      (
        PartnershipRow,
        BaseReferences<_$AppDatabase, $PartnershipsTable, PartnershipRow>,
      ),
      PartnershipRow,
      PrefetchHooks Function()
    >;
typedef $$SocialConnectionsTableCreateCompanionBuilder = SocialConnectionsCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String personId,
  required String otherPersonId,
  required String connectionType,
  Value<String?> description,
  Value<int?> sinceYear,
  Value<int> rowid,
});
typedef $$SocialConnectionsTableUpdateCompanionBuilder = SocialConnectionsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> personId,
  Value<String> otherPersonId,
  Value<String> connectionType,
  Value<String?> description,
  Value<int?> sinceYear,
  Value<int> rowid,
});

class $$SocialConnectionsTableFilterComposer extends Composer<_$AppDatabase, $SocialConnectionsTable> {
  $$SocialConnectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get otherPersonId => $composableBuilder(
    column: $table.otherPersonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get connectionType => $composableBuilder(
    column: $table.connectionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sinceYear => $composableBuilder(
    column: $table.sinceYear,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SocialConnectionsTableOrderingComposer extends Composer<_$AppDatabase, $SocialConnectionsTable> {
  $$SocialConnectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get otherPersonId => $composableBuilder(
    column: $table.otherPersonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get connectionType => $composableBuilder(
    column: $table.connectionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sinceYear => $composableBuilder(
    column: $table.sinceYear,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SocialConnectionsTableAnnotationComposer extends Composer<_$AppDatabase, $SocialConnectionsTable> {
  $$SocialConnectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get otherPersonId => $composableBuilder(
    column: $table.otherPersonId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get connectionType => $composableBuilder(
    column: $table.connectionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sinceYear => $composableBuilder(column: $table.sinceYear, builder: (column) => column);
}

class $$SocialConnectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SocialConnectionsTable,
          SocialConnectionRow,
          $$SocialConnectionsTableFilterComposer,
          $$SocialConnectionsTableOrderingComposer,
          $$SocialConnectionsTableAnnotationComposer,
          $$SocialConnectionsTableCreateCompanionBuilder,
          $$SocialConnectionsTableUpdateCompanionBuilder,
          (
            SocialConnectionRow,
            BaseReferences<_$AppDatabase, $SocialConnectionsTable, SocialConnectionRow>,
          ),
          SocialConnectionRow,
          PrefetchHooks Function()
        > {
  $$SocialConnectionsTableTableManager(
    _$AppDatabase db,
    $SocialConnectionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$SocialConnectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$SocialConnectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$SocialConnectionsTableAnnotationComposer(
            $db: db,
            $table: table,
          ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> otherPersonId = const Value.absent(),
                Value<String> connectionType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> sinceYear = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SocialConnectionsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                otherPersonId: otherPersonId,
                connectionType: connectionType,
                description: description,
                sinceYear: sinceYear,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String personId,
                required String otherPersonId,
                required String connectionType,
                Value<String?> description = const Value.absent(),
                Value<int?> sinceYear = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SocialConnectionsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                otherPersonId: otherPersonId,
                connectionType: connectionType,
                description: description,
                sinceYear: sinceYear,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SocialConnectionsTable, SocialConnectionRow>(
                    table,
                  ),
                  BaseReferences<_$AppDatabase, $SocialConnectionsTable, SocialConnectionRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SocialConnectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SocialConnectionsTable,
      SocialConnectionRow,
      $$SocialConnectionsTableFilterComposer,
      $$SocialConnectionsTableOrderingComposer,
      $$SocialConnectionsTableAnnotationComposer,
      $$SocialConnectionsTableCreateCompanionBuilder,
      $$SocialConnectionsTableUpdateCompanionBuilder,
      (
        SocialConnectionRow,
        BaseReferences<_$AppDatabase, $SocialConnectionsTable, SocialConnectionRow>,
      ),
      SocialConnectionRow,
      PrefetchHooks Function()
    >;
typedef $$FamilyGroupsTableCreateCompanionBuilder = FamilyGroupsCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String name,
  Value<String?> nameAlt,
  Value<String?> gotra,
  Value<String?> kuldevta,
  Value<String?> nativePlaceId,
  Value<String?> headPersonId,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$FamilyGroupsTableUpdateCompanionBuilder = FamilyGroupsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> name,
  Value<String?> nameAlt,
  Value<String?> gotra,
  Value<String?> kuldevta,
  Value<String?> nativePlaceId,
  Value<String?> headPersonId,
  Value<String?> notes,
  Value<int> rowid,
});

class $$FamilyGroupsTableFilterComposer extends Composer<_$AppDatabase, $FamilyGroupsTable> {
  $$FamilyGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAlt => $composableBuilder(
    column: $table.nameAlt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gotra => $composableBuilder(
    column: $table.gotra,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kuldevta => $composableBuilder(
    column: $table.kuldevta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nativePlaceId => $composableBuilder(
    column: $table.nativePlaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get headPersonId => $composableBuilder(
    column: $table.headPersonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FamilyGroupsTableOrderingComposer extends Composer<_$AppDatabase, $FamilyGroupsTable> {
  $$FamilyGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAlt => $composableBuilder(
    column: $table.nameAlt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gotra => $composableBuilder(
    column: $table.gotra,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kuldevta => $composableBuilder(
    column: $table.kuldevta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nativePlaceId => $composableBuilder(
    column: $table.nativePlaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get headPersonId => $composableBuilder(
    column: $table.headPersonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FamilyGroupsTableAnnotationComposer extends Composer<_$AppDatabase, $FamilyGroupsTable> {
  $$FamilyGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get name => $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameAlt => $composableBuilder(column: $table.nameAlt, builder: (column) => column);

  GeneratedColumn<String> get gotra => $composableBuilder(column: $table.gotra, builder: (column) => column);

  GeneratedColumn<String> get kuldevta => $composableBuilder(column: $table.kuldevta, builder: (column) => column);

  GeneratedColumn<String> get nativePlaceId => $composableBuilder(
    column: $table.nativePlaceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get headPersonId => $composableBuilder(
    column: $table.headPersonId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes => $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$FamilyGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FamilyGroupsTable,
          FamilyGroupRow,
          $$FamilyGroupsTableFilterComposer,
          $$FamilyGroupsTableOrderingComposer,
          $$FamilyGroupsTableAnnotationComposer,
          $$FamilyGroupsTableCreateCompanionBuilder,
          $$FamilyGroupsTableUpdateCompanionBuilder,
          (
            FamilyGroupRow,
            BaseReferences<_$AppDatabase, $FamilyGroupsTable, FamilyGroupRow>,
          ),
          FamilyGroupRow,
          PrefetchHooks Function()
        > {
  $$FamilyGroupsTableTableManager(_$AppDatabase db, $FamilyGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$FamilyGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$FamilyGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$FamilyGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nameAlt = const Value.absent(),
                Value<String?> gotra = const Value.absent(),
                Value<String?> kuldevta = const Value.absent(),
                Value<String?> nativePlaceId = const Value.absent(),
                Value<String?> headPersonId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FamilyGroupsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                name: name,
                nameAlt: nameAlt,
                gotra: gotra,
                kuldevta: kuldevta,
                nativePlaceId: nativePlaceId,
                headPersonId: headPersonId,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String name,
                Value<String?> nameAlt = const Value.absent(),
                Value<String?> gotra = const Value.absent(),
                Value<String?> kuldevta = const Value.absent(),
                Value<String?> nativePlaceId = const Value.absent(),
                Value<String?> headPersonId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FamilyGroupsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                name: name,
                nameAlt: nameAlt,
                gotra: gotra,
                kuldevta: kuldevta,
                nativePlaceId: nativePlaceId,
                headPersonId: headPersonId,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FamilyGroupsTable, FamilyGroupRow>(table),
                  BaseReferences<_$AppDatabase, $FamilyGroupsTable, FamilyGroupRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FamilyGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FamilyGroupsTable,
      FamilyGroupRow,
      $$FamilyGroupsTableFilterComposer,
      $$FamilyGroupsTableOrderingComposer,
      $$FamilyGroupsTableAnnotationComposer,
      $$FamilyGroupsTableCreateCompanionBuilder,
      $$FamilyGroupsTableUpdateCompanionBuilder,
      (
        FamilyGroupRow,
        BaseReferences<_$AppDatabase, $FamilyGroupsTable, FamilyGroupRow>,
      ),
      FamilyGroupRow,
      PrefetchHooks Function()
    >;
typedef $$FamilyGroupMembersTableCreateCompanionBuilder = FamilyGroupMembersCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String familyGroupId,
  required String personId,
  Value<String?> role,
  Value<int> rowid,
});
typedef $$FamilyGroupMembersTableUpdateCompanionBuilder = FamilyGroupMembersCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> familyGroupId,
  Value<String> personId,
  Value<String?> role,
  Value<int> rowid,
});

class $$FamilyGroupMembersTableFilterComposer extends Composer<_$AppDatabase, $FamilyGroupMembersTable> {
  $$FamilyGroupMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get familyGroupId => $composableBuilder(
    column: $table.familyGroupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FamilyGroupMembersTableOrderingComposer extends Composer<_$AppDatabase, $FamilyGroupMembersTable> {
  $$FamilyGroupMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get familyGroupId => $composableBuilder(
    column: $table.familyGroupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FamilyGroupMembersTableAnnotationComposer extends Composer<_$AppDatabase, $FamilyGroupMembersTable> {
  $$FamilyGroupMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get familyGroupId => $composableBuilder(
    column: $table.familyGroupId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get role => $composableBuilder(column: $table.role, builder: (column) => column);
}

class $$FamilyGroupMembersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FamilyGroupMembersTable,
          FamilyGroupMemberRow,
          $$FamilyGroupMembersTableFilterComposer,
          $$FamilyGroupMembersTableOrderingComposer,
          $$FamilyGroupMembersTableAnnotationComposer,
          $$FamilyGroupMembersTableCreateCompanionBuilder,
          $$FamilyGroupMembersTableUpdateCompanionBuilder,
          (
            FamilyGroupMemberRow,
            BaseReferences<_$AppDatabase, $FamilyGroupMembersTable, FamilyGroupMemberRow>,
          ),
          FamilyGroupMemberRow,
          PrefetchHooks Function()
        > {
  $$FamilyGroupMembersTableTableManager(
    _$AppDatabase db,
    $FamilyGroupMembersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$FamilyGroupMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$FamilyGroupMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$FamilyGroupMembersTableAnnotationComposer(
            $db: db,
            $table: table,
          ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> familyGroupId = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FamilyGroupMembersCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                familyGroupId: familyGroupId,
                personId: personId,
                role: role,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String familyGroupId,
                required String personId,
                Value<String?> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FamilyGroupMembersCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                familyGroupId: familyGroupId,
                personId: personId,
                role: role,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FamilyGroupMembersTable, FamilyGroupMemberRow>(
                    table,
                  ),
                  BaseReferences<_$AppDatabase, $FamilyGroupMembersTable, FamilyGroupMemberRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FamilyGroupMembersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FamilyGroupMembersTable,
      FamilyGroupMemberRow,
      $$FamilyGroupMembersTableFilterComposer,
      $$FamilyGroupMembersTableOrderingComposer,
      $$FamilyGroupMembersTableAnnotationComposer,
      $$FamilyGroupMembersTableCreateCompanionBuilder,
      $$FamilyGroupMembersTableUpdateCompanionBuilder,
      (
        FamilyGroupMemberRow,
        BaseReferences<_$AppDatabase, $FamilyGroupMembersTable, FamilyGroupMemberRow>,
      ),
      FamilyGroupMemberRow,
      PrefetchHooks Function()
    >;
typedef $$PersonMergesTableCreateCompanionBuilder = PersonMergesCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String survivorId,
  required String mergedId,
  required String snapshot,
  Value<int> rowid,
});
typedef $$PersonMergesTableUpdateCompanionBuilder = PersonMergesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> survivorId,
  Value<String> mergedId,
  Value<String> snapshot,
  Value<int> rowid,
});

class $$PersonMergesTableFilterComposer extends Composer<_$AppDatabase, $PersonMergesTable> {
  $$PersonMergesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get survivorId => $composableBuilder(
    column: $table.survivorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mergedId => $composableBuilder(
    column: $table.mergedId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get snapshot => $composableBuilder(
    column: $table.snapshot,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonMergesTableOrderingComposer extends Composer<_$AppDatabase, $PersonMergesTable> {
  $$PersonMergesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get survivorId => $composableBuilder(
    column: $table.survivorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mergedId => $composableBuilder(
    column: $table.mergedId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get snapshot => $composableBuilder(
    column: $table.snapshot,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonMergesTableAnnotationComposer extends Composer<_$AppDatabase, $PersonMergesTable> {
  $$PersonMergesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get survivorId => $composableBuilder(
    column: $table.survivorId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mergedId => $composableBuilder(column: $table.mergedId, builder: (column) => column);

  GeneratedColumn<String> get snapshot => $composableBuilder(column: $table.snapshot, builder: (column) => column);
}

class $$PersonMergesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonMergesTable,
          PersonMergeRow,
          $$PersonMergesTableFilterComposer,
          $$PersonMergesTableOrderingComposer,
          $$PersonMergesTableAnnotationComposer,
          $$PersonMergesTableCreateCompanionBuilder,
          $$PersonMergesTableUpdateCompanionBuilder,
          (
            PersonMergeRow,
            BaseReferences<_$AppDatabase, $PersonMergesTable, PersonMergeRow>,
          ),
          PersonMergeRow,
          PrefetchHooks Function()
        > {
  $$PersonMergesTableTableManager(_$AppDatabase db, $PersonMergesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PersonMergesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PersonMergesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PersonMergesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> survivorId = const Value.absent(),
                Value<String> mergedId = const Value.absent(),
                Value<String> snapshot = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonMergesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                survivorId: survivorId,
                mergedId: mergedId,
                snapshot: snapshot,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String survivorId,
                required String mergedId,
                required String snapshot,
                Value<int> rowid = const Value.absent(),
              }) => PersonMergesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                survivorId: survivorId,
                mergedId: mergedId,
                snapshot: snapshot,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonMergesTable, PersonMergeRow>(table),
                  BaseReferences<_$AppDatabase, $PersonMergesTable, PersonMergeRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonMergesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonMergesTable,
      PersonMergeRow,
      $$PersonMergesTableFilterComposer,
      $$PersonMergesTableOrderingComposer,
      $$PersonMergesTableAnnotationComposer,
      $$PersonMergesTableCreateCompanionBuilder,
      $$PersonMergesTableUpdateCompanionBuilder,
      (
        PersonMergeRow,
        BaseReferences<_$AppDatabase, $PersonMergesTable, PersonMergeRow>,
      ),
      PersonMergeRow,
      PrefetchHooks Function()
    >;
typedef $$TagsTableCreateCompanionBuilder = TagsCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String name,
  Value<String?> nameAlt,
  Value<String?> color,
  Value<String?> icon,
  Value<int> rowid,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> name,
  Value<String?> nameAlt,
  Value<String?> color,
  Value<String?> icon,
  Value<int> rowid,
});

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameAlt => $composableBuilder(
    column: $table.nameAlt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameAlt => $composableBuilder(
    column: $table.nameAlt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get name => $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameAlt => $composableBuilder(column: $table.nameAlt, builder: (column) => column);

  GeneratedColumn<String> get color => $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get icon => $composableBuilder(column: $table.icon, builder: (column) => column);
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          TagRow,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (TagRow, BaseReferences<_$AppDatabase, $TagsTable, TagRow>),
          TagRow,
          PrefetchHooks Function()
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> nameAlt = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                name: name,
                nameAlt: nameAlt,
                color: color,
                icon: icon,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String name,
                Value<String?> nameAlt = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                name: name,
                nameAlt: nameAlt,
                color: color,
                icon: icon,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TagsTable, TagRow>(table),
                  BaseReferences<_$AppDatabase, $TagsTable, TagRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      TagRow,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (TagRow, BaseReferences<_$AppDatabase, $TagsTable, TagRow>),
      TagRow,
      PrefetchHooks Function()
    >;
typedef $$PersonTagsTableCreateCompanionBuilder = PersonTagsCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String personId,
  required String tagId,
  Value<int> rowid,
});
typedef $$PersonTagsTableUpdateCompanionBuilder = PersonTagsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> personId,
  Value<String> tagId,
  Value<int> rowid,
});

class $$PersonTagsTableFilterComposer extends Composer<_$AppDatabase, $PersonTagsTable> {
  $$PersonTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonTagsTableOrderingComposer extends Composer<_$AppDatabase, $PersonTagsTable> {
  $$PersonTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonTagsTableAnnotationComposer extends Composer<_$AppDatabase, $PersonTagsTable> {
  $$PersonTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get tagId => $composableBuilder(column: $table.tagId, builder: (column) => column);
}

class $$PersonTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonTagsTable,
          PersonTagRow,
          $$PersonTagsTableFilterComposer,
          $$PersonTagsTableOrderingComposer,
          $$PersonTagsTableAnnotationComposer,
          $$PersonTagsTableCreateCompanionBuilder,
          $$PersonTagsTableUpdateCompanionBuilder,
          (
            PersonTagRow,
            BaseReferences<_$AppDatabase, $PersonTagsTable, PersonTagRow>,
          ),
          PersonTagRow,
          PrefetchHooks Function()
        > {
  $$PersonTagsTableTableManager(_$AppDatabase db, $PersonTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$PersonTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$PersonTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PersonTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonTagsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                tagId: tagId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String personId,
                required String tagId,
                Value<int> rowid = const Value.absent(),
              }) => PersonTagsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonTagsTable, PersonTagRow>(table),
                  BaseReferences<_$AppDatabase, $PersonTagsTable, PersonTagRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonTagsTable,
      PersonTagRow,
      $$PersonTagsTableFilterComposer,
      $$PersonTagsTableOrderingComposer,
      $$PersonTagsTableAnnotationComposer,
      $$PersonTagsTableCreateCompanionBuilder,
      $$PersonTagsTableUpdateCompanionBuilder,
      (
        PersonTagRow,
        BaseReferences<_$AppDatabase, $PersonTagsTable, PersonTagRow>,
      ),
      PersonTagRow,
      PrefetchHooks Function()
    >;
typedef $$InteractionsTableCreateCompanionBuilder = InteractionsCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String?> title,
  Value<String> interactionType,
  required DateTime occurredAt,
  Value<int?> durationMinutes,
  Value<String?> placeId,
  Value<String?> locationText,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<String?> notes,
  Value<String?> followUpOn,
  Value<int> rowid,
});
typedef $$InteractionsTableUpdateCompanionBuilder = InteractionsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String?> title,
  Value<String> interactionType,
  Value<DateTime> occurredAt,
  Value<int?> durationMinutes,
  Value<String?> placeId,
  Value<String?> locationText,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<String?> notes,
  Value<String?> followUpOn,
  Value<int> rowid,
});

class $$InteractionsTableFilterComposer extends Composer<_$AppDatabase, $InteractionsTable> {
  $$InteractionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interactionType => $composableBuilder(
    column: $table.interactionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placeId => $composableBuilder(
    column: $table.placeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationText => $composableBuilder(
    column: $table.locationText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get followUpOn => $composableBuilder(
    column: $table.followUpOn,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InteractionsTableOrderingComposer extends Composer<_$AppDatabase, $InteractionsTable> {
  $$InteractionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interactionType => $composableBuilder(
    column: $table.interactionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeId => $composableBuilder(
    column: $table.placeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationText => $composableBuilder(
    column: $table.locationText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get followUpOn => $composableBuilder(
    column: $table.followUpOn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InteractionsTableAnnotationComposer extends Composer<_$AppDatabase, $InteractionsTable> {
  $$InteractionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get title => $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get interactionType => $composableBuilder(
    column: $table.interactionType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get placeId => $composableBuilder(column: $table.placeId, builder: (column) => column);

  GeneratedColumn<String> get locationText => $composableBuilder(
    column: $table.locationText,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude => $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude => $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get notes => $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get followUpOn => $composableBuilder(
    column: $table.followUpOn,
    builder: (column) => column,
  );
}

class $$InteractionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InteractionsTable,
          InteractionRow,
          $$InteractionsTableFilterComposer,
          $$InteractionsTableOrderingComposer,
          $$InteractionsTableAnnotationComposer,
          $$InteractionsTableCreateCompanionBuilder,
          $$InteractionsTableUpdateCompanionBuilder,
          (
            InteractionRow,
            BaseReferences<_$AppDatabase, $InteractionsTable, InteractionRow>,
          ),
          InteractionRow,
          PrefetchHooks Function()
        > {
  $$InteractionsTableTableManager(_$AppDatabase db, $InteractionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$InteractionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$InteractionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$InteractionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String> interactionType = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> placeId = const Value.absent(),
                Value<String?> locationText = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> followUpOn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InteractionsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                title: title,
                interactionType: interactionType,
                occurredAt: occurredAt,
                durationMinutes: durationMinutes,
                placeId: placeId,
                locationText: locationText,
                latitude: latitude,
                longitude: longitude,
                notes: notes,
                followUpOn: followUpOn,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String> interactionType = const Value.absent(),
                required DateTime occurredAt,
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> placeId = const Value.absent(),
                Value<String?> locationText = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> followUpOn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InteractionsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                title: title,
                interactionType: interactionType,
                occurredAt: occurredAt,
                durationMinutes: durationMinutes,
                placeId: placeId,
                locationText: locationText,
                latitude: latitude,
                longitude: longitude,
                notes: notes,
                followUpOn: followUpOn,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$InteractionsTable, InteractionRow>(table),
                  BaseReferences<_$AppDatabase, $InteractionsTable, InteractionRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InteractionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InteractionsTable,
      InteractionRow,
      $$InteractionsTableFilterComposer,
      $$InteractionsTableOrderingComposer,
      $$InteractionsTableAnnotationComposer,
      $$InteractionsTableCreateCompanionBuilder,
      $$InteractionsTableUpdateCompanionBuilder,
      (
        InteractionRow,
        BaseReferences<_$AppDatabase, $InteractionsTable, InteractionRow>,
      ),
      InteractionRow,
      PrefetchHooks Function()
    >;
typedef $$InteractionParticipantsTableCreateCompanionBuilder = InteractionParticipantsCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  required String interactionId,
  required String personId,
  Value<String> role,
  Value<int> rowid,
});
typedef $$InteractionParticipantsTableUpdateCompanionBuilder = InteractionParticipantsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String> interactionId,
  Value<String> personId,
  Value<String> role,
  Value<int> rowid,
});

class $$InteractionParticipantsTableFilterComposer extends Composer<_$AppDatabase, $InteractionParticipantsTable> {
  $$InteractionParticipantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InteractionParticipantsTableOrderingComposer extends Composer<_$AppDatabase, $InteractionParticipantsTable> {
  $$InteractionParticipantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InteractionParticipantsTableAnnotationComposer extends Composer<_$AppDatabase, $InteractionParticipantsTable> {
  $$InteractionParticipantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get role => $composableBuilder(column: $table.role, builder: (column) => column);
}

class $$InteractionParticipantsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InteractionParticipantsTable,
          InteractionParticipantRow,
          $$InteractionParticipantsTableFilterComposer,
          $$InteractionParticipantsTableOrderingComposer,
          $$InteractionParticipantsTableAnnotationComposer,
          $$InteractionParticipantsTableCreateCompanionBuilder,
          $$InteractionParticipantsTableUpdateCompanionBuilder,
          (
            InteractionParticipantRow,
            BaseReferences<_$AppDatabase, $InteractionParticipantsTable, InteractionParticipantRow>,
          ),
          InteractionParticipantRow,
          PrefetchHooks Function()
        > {
  $$InteractionParticipantsTableTableManager(
    _$AppDatabase db,
    $InteractionParticipantsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$InteractionParticipantsTableFilterComposer(
            $db: db,
            $table: table,
          ),
          createOrderingComposer: () => $$InteractionParticipantsTableOrderingComposer(
            $db: db,
            $table: table,
          ),
          createComputedFieldComposer: () => $$InteractionParticipantsTableAnnotationComposer(
            $db: db,
            $table: table,
          ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String> interactionId = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InteractionParticipantsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                interactionId: interactionId,
                personId: personId,
                role: role,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                required String interactionId,
                required String personId,
                Value<String> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InteractionParticipantsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                interactionId: interactionId,
                personId: personId,
                role: role,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$InteractionParticipantsTable, InteractionParticipantRow>(table),
                  BaseReferences<_$AppDatabase, $InteractionParticipantsTable, InteractionParticipantRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InteractionParticipantsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InteractionParticipantsTable,
      InteractionParticipantRow,
      $$InteractionParticipantsTableFilterComposer,
      $$InteractionParticipantsTableOrderingComposer,
      $$InteractionParticipantsTableAnnotationComposer,
      $$InteractionParticipantsTableCreateCompanionBuilder,
      $$InteractionParticipantsTableUpdateCompanionBuilder,
      (
        InteractionParticipantRow,
        BaseReferences<_$AppDatabase, $InteractionParticipantsTable, InteractionParticipantRow>,
      ),
      InteractionParticipantRow,
      PrefetchHooks Function()
    >;
typedef $$RemindersTableCreateCompanionBuilder = RemindersCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String?> personId,
  Value<String?> interactionId,
  Value<String> reminderType,
  required String title,
  required DateTime dueAt,
  Value<String> recurrence,
  Value<String?> notes,
  Value<DateTime?> completedAt,
  Value<int> rowid,
});
typedef $$RemindersTableUpdateCompanionBuilder = RemindersCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String?> personId,
  Value<String?> interactionId,
  Value<String> reminderType,
  Value<String> title,
  Value<DateTime> dueAt,
  Value<String> recurrence,
  Value<String?> notes,
  Value<DateTime?> completedAt,
  Value<int> rowid,
});

class $$RemindersTableFilterComposer extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reminderType => $composableBuilder(
    column: $table.reminderType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrence => $composableBuilder(
    column: $table.recurrence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RemindersTableOrderingComposer extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reminderType => $composableBuilder(
    column: $table.reminderType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueAt => $composableBuilder(
    column: $table.dueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrence => $composableBuilder(
    column: $table.recurrence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RemindersTableAnnotationComposer extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reminderType => $composableBuilder(
    column: $table.reminderType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title => $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get dueAt => $composableBuilder(column: $table.dueAt, builder: (column) => column);

  GeneratedColumn<String> get recurrence => $composableBuilder(
    column: $table.recurrence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes => $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          ReminderRow,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (
            ReminderRow,
            BaseReferences<_$AppDatabase, $RemindersTable, ReminderRow>,
          ),
          ReminderRow,
          PrefetchHooks Function()
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> interactionId = const Value.absent(),
                Value<String> reminderType = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> dueAt = const Value.absent(),
                Value<String> recurrence = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                interactionId: interactionId,
                reminderType: reminderType,
                title: title,
                dueAt: dueAt,
                recurrence: recurrence,
                notes: notes,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> interactionId = const Value.absent(),
                Value<String> reminderType = const Value.absent(),
                required String title,
                required DateTime dueAt,
                Value<String> recurrence = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                interactionId: interactionId,
                reminderType: reminderType,
                title: title,
                dueAt: dueAt,
                recurrence: recurrence,
                notes: notes,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RemindersTable, ReminderRow>(table),
                  BaseReferences<_$AppDatabase, $RemindersTable, ReminderRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      ReminderRow,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (
        ReminderRow,
        BaseReferences<_$AppDatabase, $RemindersTable, ReminderRow>,
      ),
      ReminderRow,
      PrefetchHooks Function()
    >;
typedef $$MediaTableCreateCompanionBuilder = MediaCompanion Function({
  required String id,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String?> personId,
  Value<String?> interactionId,
  required String kind,
  required String fileName,
  required String mimeType,
  Value<int?> sizeBytes,
  Value<int?> width,
  Value<int?> height,
  Value<int?> durationMs,
  Value<String?> sha256,
  Value<String?> caption,
  Value<DateTime?> takenAt,
  Value<int> rowid,
});
typedef $$MediaTableUpdateCompanionBuilder = MediaCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> serverSeq,
  Value<String?> personId,
  Value<String?> interactionId,
  Value<String> kind,
  Value<String> fileName,
  Value<String> mimeType,
  Value<int?> sizeBytes,
  Value<int?> width,
  Value<int?> height,
  Value<int?> durationMs,
  Value<String?> sha256,
  Value<String?> caption,
  Value<DateTime?> takenAt,
  Value<int> rowid,
});

class $$MediaTableFilterComposer extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MediaTableOrderingComposer extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverSeq => $composableBuilder(
    column: $table.serverSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MediaTableAnnotationComposer extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt => $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt => $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get serverSeq => $composableBuilder(column: $table.serverSeq, builder: (column) => column);

  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get interactionId => $composableBuilder(
    column: $table.interactionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind => $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get fileName => $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get mimeType => $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes => $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<int> get width => $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height => $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get durationMs => $composableBuilder(
    column: $table.durationMs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sha256 => $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<String> get caption => $composableBuilder(column: $table.caption, builder: (column) => column);

  GeneratedColumn<DateTime> get takenAt => $composableBuilder(column: $table.takenAt, builder: (column) => column);
}

class $$MediaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaTable,
          MediaRow,
          $$MediaTableFilterComposer,
          $$MediaTableOrderingComposer,
          $$MediaTableAnnotationComposer,
          $$MediaTableCreateCompanionBuilder,
          $$MediaTableUpdateCompanionBuilder,
          (MediaRow, BaseReferences<_$AppDatabase, $MediaTable, MediaRow>),
          MediaRow,
          PrefetchHooks Function()
        > {
  $$MediaTableTableManager(_$AppDatabase db, $MediaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$MediaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$MediaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$MediaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> interactionId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> mimeType = const Value.absent(),
                Value<int?> sizeBytes = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                Value<String?> sha256 = const Value.absent(),
                Value<String?> caption = const Value.absent(),
                Value<DateTime?> takenAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                interactionId: interactionId,
                kind: kind,
                fileName: fileName,
                mimeType: mimeType,
                sizeBytes: sizeBytes,
                width: width,
                height: height,
                durationMs: durationMs,
                sha256: sha256,
                caption: caption,
                takenAt: takenAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> serverSeq = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> interactionId = const Value.absent(),
                required String kind,
                required String fileName,
                required String mimeType,
                Value<int?> sizeBytes = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
                Value<int?> durationMs = const Value.absent(),
                Value<String?> sha256 = const Value.absent(),
                Value<String?> caption = const Value.absent(),
                Value<DateTime?> takenAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                serverSeq: serverSeq,
                personId: personId,
                interactionId: interactionId,
                kind: kind,
                fileName: fileName,
                mimeType: mimeType,
                sizeBytes: sizeBytes,
                width: width,
                height: height,
                durationMs: durationMs,
                sha256: sha256,
                caption: caption,
                takenAt: takenAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MediaTable, MediaRow>(table),
                  BaseReferences<_$AppDatabase, $MediaTable, MediaRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MediaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaTable,
      MediaRow,
      $$MediaTableFilterComposer,
      $$MediaTableOrderingComposer,
      $$MediaTableAnnotationComposer,
      $$MediaTableCreateCompanionBuilder,
      $$MediaTableUpdateCompanionBuilder,
      (MediaRow, BaseReferences<_$AppDatabase, $MediaTable, MediaRow>),
      MediaRow,
      PrefetchHooks Function()
    >;
typedef $$SyncOutboxTableCreateCompanionBuilder = SyncOutboxCompanion Function({
  Value<int> seq,
  required String entity,
  required String recordId,
  required String payload,
  required DateTime createdAt,
  Value<int> attempts,
  Value<DateTime?> nextAttemptAt,
  Value<String?> lastError,
});
typedef $$SyncOutboxTableUpdateCompanionBuilder = SyncOutboxCompanion Function({
  Value<int> seq,
  Value<String> entity,
  Value<String> recordId,
  Value<String> payload,
  Value<DateTime> createdAt,
  Value<int> attempts,
  Value<DateTime?> nextAttemptAt,
  Value<String?> lastError,
});

class $$SyncOutboxTableFilterComposer extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get seq => $composableBuilder(
    column: $table.seq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncOutboxTableOrderingComposer extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get seq => $composableBuilder(
    column: $table.seq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncOutboxTableAnnotationComposer extends Composer<_$AppDatabase, $SyncOutboxTable> {
  $$SyncOutboxTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get seq => $composableBuilder(column: $table.seq, builder: (column) => column);

  GeneratedColumn<String> get entity => $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<String> get recordId => $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumn<String> get payload => $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get attempts => $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get nextAttemptAt => $composableBuilder(
    column: $table.nextAttemptAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError => $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$SyncOutboxTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncOutboxTable,
          OutboxEntry,
          $$SyncOutboxTableFilterComposer,
          $$SyncOutboxTableOrderingComposer,
          $$SyncOutboxTableAnnotationComposer,
          $$SyncOutboxTableCreateCompanionBuilder,
          $$SyncOutboxTableUpdateCompanionBuilder,
          (
            OutboxEntry,
            BaseReferences<_$AppDatabase, $SyncOutboxTable, OutboxEntry>,
          ),
          OutboxEntry,
          PrefetchHooks Function()
        > {
  $$SyncOutboxTableTableManager(_$AppDatabase db, $SyncOutboxTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$SyncOutboxTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$SyncOutboxTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$SyncOutboxTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> seq = const Value.absent(),
                Value<String> entity = const Value.absent(),
                Value<String> recordId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> nextAttemptAt = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => SyncOutboxCompanion(
                seq: seq,
                entity: entity,
                recordId: recordId,
                payload: payload,
                createdAt: createdAt,
                attempts: attempts,
                nextAttemptAt: nextAttemptAt,
                lastError: lastError,
              ),
          createCompanionCallback:
              ({
                Value<int> seq = const Value.absent(),
                required String entity,
                required String recordId,
                required String payload,
                required DateTime createdAt,
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> nextAttemptAt = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => SyncOutboxCompanion.insert(
                seq: seq,
                entity: entity,
                recordId: recordId,
                payload: payload,
                createdAt: createdAt,
                attempts: attempts,
                nextAttemptAt: nextAttemptAt,
                lastError: lastError,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncOutboxTable, OutboxEntry>(table),
                  BaseReferences<_$AppDatabase, $SyncOutboxTable, OutboxEntry>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncOutboxTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncOutboxTable,
      OutboxEntry,
      $$SyncOutboxTableFilterComposer,
      $$SyncOutboxTableOrderingComposer,
      $$SyncOutboxTableAnnotationComposer,
      $$SyncOutboxTableCreateCompanionBuilder,
      $$SyncOutboxTableUpdateCompanionBuilder,
      (
        OutboxEntry,
        BaseReferences<_$AppDatabase, $SyncOutboxTable, OutboxEntry>,
      ),
      OutboxEntry,
      PrefetchHooks Function()
    >;
typedef $$SyncCursorsTableCreateCompanionBuilder = SyncCursorsCompanion Function({
  required String entity,
  Value<int> lastServerSeq,
  Value<DateTime?> lastPulledAt,
  Value<int> rowid,
});
typedef $$SyncCursorsTableUpdateCompanionBuilder = SyncCursorsCompanion Function({
  Value<String> entity,
  Value<int> lastServerSeq,
  Value<DateTime?> lastPulledAt,
  Value<int> rowid,
});

class $$SyncCursorsTableFilterComposer extends Composer<_$AppDatabase, $SyncCursorsTable> {
  $$SyncCursorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastServerSeq => $composableBuilder(
    column: $table.lastServerSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncCursorsTableOrderingComposer extends Composer<_$AppDatabase, $SyncCursorsTable> {
  $$SyncCursorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastServerSeq => $composableBuilder(
    column: $table.lastServerSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncCursorsTableAnnotationComposer extends Composer<_$AppDatabase, $SyncCursorsTable> {
  $$SyncCursorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get entity => $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<int> get lastServerSeq => $composableBuilder(
    column: $table.lastServerSeq,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => column,
  );
}

class $$SyncCursorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncCursorsTable,
          SyncCursorRow,
          $$SyncCursorsTableFilterComposer,
          $$SyncCursorsTableOrderingComposer,
          $$SyncCursorsTableAnnotationComposer,
          $$SyncCursorsTableCreateCompanionBuilder,
          $$SyncCursorsTableUpdateCompanionBuilder,
          (
            SyncCursorRow,
            BaseReferences<_$AppDatabase, $SyncCursorsTable, SyncCursorRow>,
          ),
          SyncCursorRow,
          PrefetchHooks Function()
        > {
  $$SyncCursorsTableTableManager(_$AppDatabase db, $SyncCursorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$SyncCursorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$SyncCursorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$SyncCursorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> entity = const Value.absent(),
                Value<int> lastServerSeq = const Value.absent(),
                Value<DateTime?> lastPulledAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncCursorsCompanion(
                entity: entity,
                lastServerSeq: lastServerSeq,
                lastPulledAt: lastPulledAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String entity,
                Value<int> lastServerSeq = const Value.absent(),
                Value<DateTime?> lastPulledAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncCursorsCompanion.insert(
                entity: entity,
                lastServerSeq: lastServerSeq,
                lastPulledAt: lastPulledAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncCursorsTable, SyncCursorRow>(table),
                  BaseReferences<_$AppDatabase, $SyncCursorsTable, SyncCursorRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncCursorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncCursorsTable,
      SyncCursorRow,
      $$SyncCursorsTableFilterComposer,
      $$SyncCursorsTableOrderingComposer,
      $$SyncCursorsTableAnnotationComposer,
      $$SyncCursorsTableCreateCompanionBuilder,
      $$SyncCursorsTableUpdateCompanionBuilder,
      (
        SyncCursorRow,
        BaseReferences<_$AppDatabase, $SyncCursorsTable, SyncCursorRow>,
      ),
      SyncCursorRow,
      PrefetchHooks Function()
    >;
typedef $$SyncIssuesTableCreateCompanionBuilder = SyncIssuesCompanion Function({
  Value<int> id,
  required String entity,
  required String recordId,
  required String payload,
  Value<String?> errorCode,
  Value<String?> message,
  required DateTime createdAt,
  Value<DateTime?> resolvedAt,
});
typedef $$SyncIssuesTableUpdateCompanionBuilder = SyncIssuesCompanion Function({
  Value<int> id,
  Value<String> entity,
  Value<String> recordId,
  Value<String> payload,
  Value<String?> errorCode,
  Value<String?> message,
  Value<DateTime> createdAt,
  Value<DateTime?> resolvedAt,
});

class $$SyncIssuesTableFilterComposer extends Composer<_$AppDatabase, $SyncIssuesTable> {
  $$SyncIssuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncIssuesTableOrderingComposer extends Composer<_$AppDatabase, $SyncIssuesTable> {
  $$SyncIssuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncIssuesTableAnnotationComposer extends Composer<_$AppDatabase, $SyncIssuesTable> {
  $$SyncIssuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entity => $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<String> get recordId => $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumn<String> get payload => $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<String> get errorCode => $composableBuilder(column: $table.errorCode, builder: (column) => column);

  GeneratedColumn<String> get message => $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt => $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get resolvedAt => $composableBuilder(
    column: $table.resolvedAt,
    builder: (column) => column,
  );
}

class $$SyncIssuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncIssuesTable,
          SyncIssueRow,
          $$SyncIssuesTableFilterComposer,
          $$SyncIssuesTableOrderingComposer,
          $$SyncIssuesTableAnnotationComposer,
          $$SyncIssuesTableCreateCompanionBuilder,
          $$SyncIssuesTableUpdateCompanionBuilder,
          (
            SyncIssueRow,
            BaseReferences<_$AppDatabase, $SyncIssuesTable, SyncIssueRow>,
          ),
          SyncIssueRow,
          PrefetchHooks Function()
        > {
  $$SyncIssuesTableTableManager(_$AppDatabase db, $SyncIssuesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$SyncIssuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$SyncIssuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$SyncIssuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entity = const Value.absent(),
                Value<String> recordId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> resolvedAt = const Value.absent(),
              }) => SyncIssuesCompanion(
                id: id,
                entity: entity,
                recordId: recordId,
                payload: payload,
                errorCode: errorCode,
                message: message,
                createdAt: createdAt,
                resolvedAt: resolvedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entity,
                required String recordId,
                required String payload,
                Value<String?> errorCode = const Value.absent(),
                Value<String?> message = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> resolvedAt = const Value.absent(),
              }) => SyncIssuesCompanion.insert(
                id: id,
                entity: entity,
                recordId: recordId,
                payload: payload,
                errorCode: errorCode,
                message: message,
                createdAt: createdAt,
                resolvedAt: resolvedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncIssuesTable, SyncIssueRow>(table),
                  BaseReferences<_$AppDatabase, $SyncIssuesTable, SyncIssueRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncIssuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncIssuesTable,
      SyncIssueRow,
      $$SyncIssuesTableFilterComposer,
      $$SyncIssuesTableOrderingComposer,
      $$SyncIssuesTableAnnotationComposer,
      $$SyncIssuesTableCreateCompanionBuilder,
      $$SyncIssuesTableUpdateCompanionBuilder,
      (
        SyncIssueRow,
        BaseReferences<_$AppDatabase, $SyncIssuesTable, SyncIssueRow>,
      ),
      SyncIssueRow,
      PrefetchHooks Function()
    >;
typedef $$MediaFilesTableCreateCompanionBuilder = MediaFilesCompanion Function({
  required String mediaId,
  Value<String?> localPath,
  Value<String?> thumbPath,
  Value<String> uploadState,
  Value<String> downloadState,
  Value<int> rowid,
});
typedef $$MediaFilesTableUpdateCompanionBuilder = MediaFilesCompanion Function({
  Value<String> mediaId,
  Value<String?> localPath,
  Value<String?> thumbPath,
  Value<String> uploadState,
  Value<String> downloadState,
  Value<int> rowid,
});

class $$MediaFilesTableFilterComposer extends Composer<_$AppDatabase, $MediaFilesTable> {
  $$MediaFilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get mediaId => $composableBuilder(
    column: $table.mediaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbPath => $composableBuilder(
    column: $table.thumbPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uploadState => $composableBuilder(
    column: $table.uploadState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get downloadState => $composableBuilder(
    column: $table.downloadState,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MediaFilesTableOrderingComposer extends Composer<_$AppDatabase, $MediaFilesTable> {
  $$MediaFilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get mediaId => $composableBuilder(
    column: $table.mediaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbPath => $composableBuilder(
    column: $table.thumbPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uploadState => $composableBuilder(
    column: $table.uploadState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get downloadState => $composableBuilder(
    column: $table.downloadState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MediaFilesTableAnnotationComposer extends Composer<_$AppDatabase, $MediaFilesTable> {
  $$MediaFilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get mediaId => $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<String> get localPath => $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get thumbPath => $composableBuilder(column: $table.thumbPath, builder: (column) => column);

  GeneratedColumn<String> get uploadState => $composableBuilder(
    column: $table.uploadState,
    builder: (column) => column,
  );

  GeneratedColumn<String> get downloadState => $composableBuilder(
    column: $table.downloadState,
    builder: (column) => column,
  );
}

class $$MediaFilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaFilesTable,
          MediaFileRow,
          $$MediaFilesTableFilterComposer,
          $$MediaFilesTableOrderingComposer,
          $$MediaFilesTableAnnotationComposer,
          $$MediaFilesTableCreateCompanionBuilder,
          $$MediaFilesTableUpdateCompanionBuilder,
          (
            MediaFileRow,
            BaseReferences<_$AppDatabase, $MediaFilesTable, MediaFileRow>,
          ),
          MediaFileRow,
          PrefetchHooks Function()
        > {
  $$MediaFilesTableTableManager(_$AppDatabase db, $MediaFilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$MediaFilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$MediaFilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$MediaFilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> mediaId = const Value.absent(),
                Value<String?> localPath = const Value.absent(),
                Value<String?> thumbPath = const Value.absent(),
                Value<String> uploadState = const Value.absent(),
                Value<String> downloadState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaFilesCompanion(
                mediaId: mediaId,
                localPath: localPath,
                thumbPath: thumbPath,
                uploadState: uploadState,
                downloadState: downloadState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String mediaId,
                Value<String?> localPath = const Value.absent(),
                Value<String?> thumbPath = const Value.absent(),
                Value<String> uploadState = const Value.absent(),
                Value<String> downloadState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaFilesCompanion.insert(
                mediaId: mediaId,
                localPath: localPath,
                thumbPath: thumbPath,
                uploadState: uploadState,
                downloadState: downloadState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MediaFilesTable, MediaFileRow>(table),
                  BaseReferences<_$AppDatabase, $MediaFilesTable, MediaFileRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MediaFilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaFilesTable,
      MediaFileRow,
      $$MediaFilesTableFilterComposer,
      $$MediaFilesTableOrderingComposer,
      $$MediaFilesTableAnnotationComposer,
      $$MediaFilesTableCreateCompanionBuilder,
      $$MediaFilesTableUpdateCompanionBuilder,
      (
        MediaFileRow,
        BaseReferences<_$AppDatabase, $MediaFilesTable, MediaFileRow>,
      ),
      MediaFileRow,
      PrefetchHooks Function()
    >;
typedef $$RelationCacheTableCreateCompanionBuilder = RelationCacheCompanion Function({
  required String personId,
  required String pathKey,
  required String termEn,
  required String termHi,
  required String side,
  required int distance,
  required int generation,
  required String viaIds,
  required int graphVersion,
  Value<int> rowid,
});
typedef $$RelationCacheTableUpdateCompanionBuilder = RelationCacheCompanion Function({
  Value<String> personId,
  Value<String> pathKey,
  Value<String> termEn,
  Value<String> termHi,
  Value<String> side,
  Value<int> distance,
  Value<int> generation,
  Value<String> viaIds,
  Value<int> graphVersion,
  Value<int> rowid,
});

class $$RelationCacheTableFilterComposer extends Composer<_$AppDatabase, $RelationCacheTable> {
  $$RelationCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pathKey => $composableBuilder(
    column: $table.pathKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get termEn => $composableBuilder(
    column: $table.termEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get termHi => $composableBuilder(
    column: $table.termHi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get generation => $composableBuilder(
    column: $table.generation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get viaIds => $composableBuilder(
    column: $table.viaIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get graphVersion => $composableBuilder(
    column: $table.graphVersion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RelationCacheTableOrderingComposer extends Composer<_$AppDatabase, $RelationCacheTable> {
  $$RelationCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathKey => $composableBuilder(
    column: $table.pathKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get termEn => $composableBuilder(
    column: $table.termEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get termHi => $composableBuilder(
    column: $table.termHi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get generation => $composableBuilder(
    column: $table.generation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get viaIds => $composableBuilder(
    column: $table.viaIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get graphVersion => $composableBuilder(
    column: $table.graphVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RelationCacheTableAnnotationComposer extends Composer<_$AppDatabase, $RelationCacheTable> {
  $$RelationCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get personId => $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get pathKey => $composableBuilder(column: $table.pathKey, builder: (column) => column);

  GeneratedColumn<String> get termEn => $composableBuilder(column: $table.termEn, builder: (column) => column);

  GeneratedColumn<String> get termHi => $composableBuilder(column: $table.termHi, builder: (column) => column);

  GeneratedColumn<String> get side => $composableBuilder(column: $table.side, builder: (column) => column);

  GeneratedColumn<int> get distance => $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<int> get generation => $composableBuilder(
    column: $table.generation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get viaIds => $composableBuilder(column: $table.viaIds, builder: (column) => column);

  GeneratedColumn<int> get graphVersion => $composableBuilder(
    column: $table.graphVersion,
    builder: (column) => column,
  );
}

class $$RelationCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RelationCacheTable,
          RelationCacheRow,
          $$RelationCacheTableFilterComposer,
          $$RelationCacheTableOrderingComposer,
          $$RelationCacheTableAnnotationComposer,
          $$RelationCacheTableCreateCompanionBuilder,
          $$RelationCacheTableUpdateCompanionBuilder,
          (
            RelationCacheRow,
            BaseReferences<_$AppDatabase, $RelationCacheTable, RelationCacheRow>,
          ),
          RelationCacheRow,
          PrefetchHooks Function()
        > {
  $$RelationCacheTableTableManager(_$AppDatabase db, $RelationCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$RelationCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$RelationCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$RelationCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> personId = const Value.absent(),
                Value<String> pathKey = const Value.absent(),
                Value<String> termEn = const Value.absent(),
                Value<String> termHi = const Value.absent(),
                Value<String> side = const Value.absent(),
                Value<int> distance = const Value.absent(),
                Value<int> generation = const Value.absent(),
                Value<String> viaIds = const Value.absent(),
                Value<int> graphVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RelationCacheCompanion(
                personId: personId,
                pathKey: pathKey,
                termEn: termEn,
                termHi: termHi,
                side: side,
                distance: distance,
                generation: generation,
                viaIds: viaIds,
                graphVersion: graphVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String personId,
                required String pathKey,
                required String termEn,
                required String termHi,
                required String side,
                required int distance,
                required int generation,
                required String viaIds,
                required int graphVersion,
                Value<int> rowid = const Value.absent(),
              }) => RelationCacheCompanion.insert(
                personId: personId,
                pathKey: pathKey,
                termEn: termEn,
                termHi: termHi,
                side: side,
                distance: distance,
                generation: generation,
                viaIds: viaIds,
                graphVersion: graphVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RelationCacheTable, RelationCacheRow>(table),
                  BaseReferences<_$AppDatabase, $RelationCacheTable, RelationCacheRow>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RelationCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RelationCacheTable,
      RelationCacheRow,
      $$RelationCacheTableFilterComposer,
      $$RelationCacheTableOrderingComposer,
      $$RelationCacheTableAnnotationComposer,
      $$RelationCacheTableCreateCompanionBuilder,
      $$RelationCacheTableUpdateCompanionBuilder,
      (
        RelationCacheRow,
        BaseReferences<_$AppDatabase, $RelationCacheTable, RelationCacheRow>,
      ),
      RelationCacheRow,
      PrefetchHooks Function()
    >;
typedef $$KvSettingsTableCreateCompanionBuilder = KvSettingsCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$KvSettingsTableUpdateCompanionBuilder = KvSettingsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$KvSettingsTableFilterComposer extends Composer<_$AppDatabase, $KvSettingsTable> {
  $$KvSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KvSettingsTableOrderingComposer extends Composer<_$AppDatabase, $KvSettingsTable> {
  $$KvSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KvSettingsTableAnnotationComposer extends Composer<_$AppDatabase, $KvSettingsTable> {
  $$KvSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key => $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value => $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$KvSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KvSettingsTable,
          KvSettingRow,
          $$KvSettingsTableFilterComposer,
          $$KvSettingsTableOrderingComposer,
          $$KvSettingsTableAnnotationComposer,
          $$KvSettingsTableCreateCompanionBuilder,
          $$KvSettingsTableUpdateCompanionBuilder,
          (
            KvSettingRow,
            BaseReferences<_$AppDatabase, $KvSettingsTable, KvSettingRow>,
          ),
          KvSettingRow,
          PrefetchHooks Function()
        > {
  $$KvSettingsTableTableManager(_$AppDatabase db, $KvSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$KvSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$KvSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$KvSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => KvSettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => KvSettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KvSettingsTable, KvSettingRow>(table),
                  BaseReferences<_$AppDatabase, $KvSettingsTable, KvSettingRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KvSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KvSettingsTable,
      KvSettingRow,
      $$KvSettingsTableFilterComposer,
      $$KvSettingsTableOrderingComposer,
      $$KvSettingsTableAnnotationComposer,
      $$KvSettingsTableCreateCompanionBuilder,
      $$KvSettingsTableUpdateCompanionBuilder,
      (
        KvSettingRow,
        BaseReferences<_$AppDatabase, $KvSettingsTable, KvSettingRow>,
      ),
      KvSettingRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlacesTableTableManager get places => $$PlacesTableTableManager(_db, _db.places);
  $$PeopleTableTableManager get people => $$PeopleTableTableManager(_db, _db.people);
  $$PersonNamesTableTableManager get personNames => $$PersonNamesTableTableManager(_db, _db.personNames);
  $$PersonContactsTableTableManager get personContacts => $$PersonContactsTableTableManager(_db, _db.personContacts);
  $$PersonAddressesTableTableManager get personAddresses =>
      $$PersonAddressesTableTableManager(_db, _db.personAddresses);
  $$PersonAttributesTableTableManager get personAttributes =>
      $$PersonAttributesTableTableManager(_db, _db.personAttributes);
  $$ParentChildTableTableManager get parentChild => $$ParentChildTableTableManager(_db, _db.parentChild);
  $$PartnershipsTableTableManager get partnerships => $$PartnershipsTableTableManager(_db, _db.partnerships);
  $$SocialConnectionsTableTableManager get socialConnections =>
      $$SocialConnectionsTableTableManager(_db, _db.socialConnections);
  $$FamilyGroupsTableTableManager get familyGroups => $$FamilyGroupsTableTableManager(_db, _db.familyGroups);
  $$FamilyGroupMembersTableTableManager get familyGroupMembers =>
      $$FamilyGroupMembersTableTableManager(_db, _db.familyGroupMembers);
  $$PersonMergesTableTableManager get personMerges => $$PersonMergesTableTableManager(_db, _db.personMerges);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$PersonTagsTableTableManager get personTags => $$PersonTagsTableTableManager(_db, _db.personTags);
  $$InteractionsTableTableManager get interactions => $$InteractionsTableTableManager(_db, _db.interactions);
  $$InteractionParticipantsTableTableManager get interactionParticipants => $$InteractionParticipantsTableTableManager(
    _db,
    _db.interactionParticipants,
  );
  $$RemindersTableTableManager get reminders => $$RemindersTableTableManager(_db, _db.reminders);
  $$MediaTableTableManager get media => $$MediaTableTableManager(_db, _db.media);
  $$SyncOutboxTableTableManager get syncOutbox => $$SyncOutboxTableTableManager(_db, _db.syncOutbox);
  $$SyncCursorsTableTableManager get syncCursors => $$SyncCursorsTableTableManager(_db, _db.syncCursors);
  $$SyncIssuesTableTableManager get syncIssues => $$SyncIssuesTableTableManager(_db, _db.syncIssues);
  $$MediaFilesTableTableManager get mediaFiles => $$MediaFilesTableTableManager(_db, _db.mediaFiles);
  $$RelationCacheTableTableManager get relationCache => $$RelationCacheTableTableManager(_db, _db.relationCache);
  $$KvSettingsTableTableManager get kvSettings => $$KvSettingsTableTableManager(_db, _db.kvSettings);
}
