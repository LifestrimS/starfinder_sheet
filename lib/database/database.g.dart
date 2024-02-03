// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TableCharacterTable extends TableCharacter
    with TableInfo<$TableCharacterTable, TableCharacterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TableCharacterTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _chNameMeta = const VerificationMeta('chName');
  @override
  late final GeneratedColumn<String> chName = GeneratedColumn<String>(
      'chName', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chClassMeta =
      const VerificationMeta('chClass');
  @override
  late final GeneratedColumn<String> chClass = GeneratedColumn<String>(
      'chClass', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, chName, chClass];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_character';
  @override
  VerificationContext validateIntegrity(Insertable<TableCharacterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chName')) {
      context.handle(_chNameMeta,
          chName.isAcceptableOrUnknown(data['chName']!, _chNameMeta));
    } else if (isInserting) {
      context.missing(_chNameMeta);
    }
    if (data.containsKey('chClass')) {
      context.handle(_chClassMeta,
          chClass.isAcceptableOrUnknown(data['chClass']!, _chClassMeta));
    } else if (isInserting) {
      context.missing(_chClassMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableCharacterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TableCharacterData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      chName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chName'])!,
      chClass: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chClass'])!,
    );
  }

  @override
  $TableCharacterTable createAlias(String alias) {
    return $TableCharacterTable(attachedDatabase, alias);
  }
}

class TableCharacterData extends DataClass
    implements Insertable<TableCharacterData> {
  final int id;
  final String chName;
  final String chClass;
  const TableCharacterData(
      {required this.id, required this.chName, required this.chClass});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chName'] = Variable<String>(chName);
    map['chClass'] = Variable<String>(chClass);
    return map;
  }

  TableCharacterCompanion toCompanion(bool nullToAbsent) {
    return TableCharacterCompanion(
      id: Value(id),
      chName: Value(chName),
      chClass: Value(chClass),
    );
  }

  factory TableCharacterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableCharacterData(
      id: serializer.fromJson<int>(json['id']),
      chName: serializer.fromJson<String>(json['chName']),
      chClass: serializer.fromJson<String>(json['chClass']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chName': serializer.toJson<String>(chName),
      'chClass': serializer.toJson<String>(chClass),
    };
  }

  TableCharacterData copyWith({int? id, String? chName, String? chClass}) =>
      TableCharacterData(
        id: id ?? this.id,
        chName: chName ?? this.chName,
        chClass: chClass ?? this.chClass,
      );
  @override
  String toString() {
    return (StringBuffer('TableCharacterData(')
          ..write('id: $id, ')
          ..write('chName: $chName, ')
          ..write('chClass: $chClass')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chName, chClass);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableCharacterData &&
          other.id == this.id &&
          other.chName == this.chName &&
          other.chClass == this.chClass);
}

class TableCharacterCompanion extends UpdateCompanion<TableCharacterData> {
  final Value<int> id;
  final Value<String> chName;
  final Value<String> chClass;
  const TableCharacterCompanion({
    this.id = const Value.absent(),
    this.chName = const Value.absent(),
    this.chClass = const Value.absent(),
  });
  TableCharacterCompanion.insert({
    this.id = const Value.absent(),
    required String chName,
    required String chClass,
  })  : chName = Value(chName),
        chClass = Value(chClass);
  static Insertable<TableCharacterData> custom({
    Expression<int>? id,
    Expression<String>? chName,
    Expression<String>? chClass,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chName != null) 'chName': chName,
      if (chClass != null) 'chClass': chClass,
    });
  }

  TableCharacterCompanion copyWith(
      {Value<int>? id, Value<String>? chName, Value<String>? chClass}) {
    return TableCharacterCompanion(
      id: id ?? this.id,
      chName: chName ?? this.chName,
      chClass: chClass ?? this.chClass,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chName.present) {
      map['chName'] = Variable<String>(chName.value);
    }
    if (chClass.present) {
      map['chClass'] = Variable<String>(chClass.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableCharacterCompanion(')
          ..write('id: $id, ')
          ..write('chName: $chName, ')
          ..write('chClass: $chClass')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $TableCharacterTable tableCharacter = $TableCharacterTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tableCharacter];
}
