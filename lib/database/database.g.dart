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
  static const VerificationMeta _charNameMeta =
      const VerificationMeta('charName');
  @override
  late final GeneratedColumn<String> charName = GeneratedColumn<String>(
      'char_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _charClassMeta =
      const VerificationMeta('charClass');
  @override
  late final GeneratedColumn<String> charClass = GeneratedColumn<String>(
      'char_class', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lvlMeta = const VerificationMeta('lvl');
  @override
  late final GeneratedColumn<int> lvl = GeneratedColumn<int>(
      'lvl', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _raceMeta = const VerificationMeta('race');
  @override
  late final GeneratedColumn<String> race = GeneratedColumn<String>(
      'race', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _alignmentMeta =
      const VerificationMeta('alignment');
  @override
  late final GeneratedColumn<String> alignment = GeneratedColumn<String>(
      'alignment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
      'size', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, charName, charClass, lvl, race, alignment, size];
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
    if (data.containsKey('char_name')) {
      context.handle(_charNameMeta,
          charName.isAcceptableOrUnknown(data['char_name']!, _charNameMeta));
    } else if (isInserting) {
      context.missing(_charNameMeta);
    }
    if (data.containsKey('char_class')) {
      context.handle(_charClassMeta,
          charClass.isAcceptableOrUnknown(data['char_class']!, _charClassMeta));
    } else if (isInserting) {
      context.missing(_charClassMeta);
    }
    if (data.containsKey('lvl')) {
      context.handle(
          _lvlMeta, lvl.isAcceptableOrUnknown(data['lvl']!, _lvlMeta));
    } else if (isInserting) {
      context.missing(_lvlMeta);
    }
    if (data.containsKey('race')) {
      context.handle(
          _raceMeta, race.isAcceptableOrUnknown(data['race']!, _raceMeta));
    } else if (isInserting) {
      context.missing(_raceMeta);
    }
    if (data.containsKey('alignment')) {
      context.handle(_alignmentMeta,
          alignment.isAcceptableOrUnknown(data['alignment']!, _alignmentMeta));
    } else if (isInserting) {
      context.missing(_alignmentMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
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
      charName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}char_name'])!,
      charClass: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}char_class'])!,
      lvl: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lvl'])!,
      race: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}race'])!,
      alignment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alignment'])!,
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}size'])!,
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
  final String charName;
  final String charClass;
  final int lvl;
  final String race;
  final String alignment;
  final String size;
  const TableCharacterData(
      {required this.id,
      required this.charName,
      required this.charClass,
      required this.lvl,
      required this.race,
      required this.alignment,
      required this.size});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['char_name'] = Variable<String>(charName);
    map['char_class'] = Variable<String>(charClass);
    map['lvl'] = Variable<int>(lvl);
    map['race'] = Variable<String>(race);
    map['alignment'] = Variable<String>(alignment);
    map['size'] = Variable<String>(size);
    return map;
  }

  TableCharacterCompanion toCompanion(bool nullToAbsent) {
    return TableCharacterCompanion(
      id: Value(id),
      charName: Value(charName),
      charClass: Value(charClass),
      lvl: Value(lvl),
      race: Value(race),
      alignment: Value(alignment),
      size: Value(size),
    );
  }

  factory TableCharacterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableCharacterData(
      id: serializer.fromJson<int>(json['id']),
      charName: serializer.fromJson<String>(json['charName']),
      charClass: serializer.fromJson<String>(json['charClass']),
      lvl: serializer.fromJson<int>(json['lvl']),
      race: serializer.fromJson<String>(json['race']),
      alignment: serializer.fromJson<String>(json['alignment']),
      size: serializer.fromJson<String>(json['size']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'charName': serializer.toJson<String>(charName),
      'charClass': serializer.toJson<String>(charClass),
      'lvl': serializer.toJson<int>(lvl),
      'race': serializer.toJson<String>(race),
      'alignment': serializer.toJson<String>(alignment),
      'size': serializer.toJson<String>(size),
    };
  }

  TableCharacterData copyWith(
          {int? id,
          String? charName,
          String? charClass,
          int? lvl,
          String? race,
          String? alignment,
          String? size}) =>
      TableCharacterData(
        id: id ?? this.id,
        charName: charName ?? this.charName,
        charClass: charClass ?? this.charClass,
        lvl: lvl ?? this.lvl,
        race: race ?? this.race,
        alignment: alignment ?? this.alignment,
        size: size ?? this.size,
      );
  TableCharacterData copyWithCompanion(TableCharacterCompanion data) {
    return TableCharacterData(
      id: data.id.present ? data.id.value : this.id,
      charName: data.charName.present ? data.charName.value : this.charName,
      charClass: data.charClass.present ? data.charClass.value : this.charClass,
      lvl: data.lvl.present ? data.lvl.value : this.lvl,
      race: data.race.present ? data.race.value : this.race,
      alignment: data.alignment.present ? data.alignment.value : this.alignment,
      size: data.size.present ? data.size.value : this.size,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TableCharacterData(')
          ..write('id: $id, ')
          ..write('charName: $charName, ')
          ..write('charClass: $charClass, ')
          ..write('lvl: $lvl, ')
          ..write('race: $race, ')
          ..write('alignment: $alignment, ')
          ..write('size: $size')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, charName, charClass, lvl, race, alignment, size);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableCharacterData &&
          other.id == this.id &&
          other.charName == this.charName &&
          other.charClass == this.charClass &&
          other.lvl == this.lvl &&
          other.race == this.race &&
          other.alignment == this.alignment &&
          other.size == this.size);
}

class TableCharacterCompanion extends UpdateCompanion<TableCharacterData> {
  final Value<int> id;
  final Value<String> charName;
  final Value<String> charClass;
  final Value<int> lvl;
  final Value<String> race;
  final Value<String> alignment;
  final Value<String> size;
  const TableCharacterCompanion({
    this.id = const Value.absent(),
    this.charName = const Value.absent(),
    this.charClass = const Value.absent(),
    this.lvl = const Value.absent(),
    this.race = const Value.absent(),
    this.alignment = const Value.absent(),
    this.size = const Value.absent(),
  });
  TableCharacterCompanion.insert({
    this.id = const Value.absent(),
    required String charName,
    required String charClass,
    required int lvl,
    required String race,
    required String alignment,
    required String size,
  })  : charName = Value(charName),
        charClass = Value(charClass),
        lvl = Value(lvl),
        race = Value(race),
        alignment = Value(alignment),
        size = Value(size);
  static Insertable<TableCharacterData> custom({
    Expression<int>? id,
    Expression<String>? charName,
    Expression<String>? charClass,
    Expression<int>? lvl,
    Expression<String>? race,
    Expression<String>? alignment,
    Expression<String>? size,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (charName != null) 'char_name': charName,
      if (charClass != null) 'char_class': charClass,
      if (lvl != null) 'lvl': lvl,
      if (race != null) 'race': race,
      if (alignment != null) 'alignment': alignment,
      if (size != null) 'size': size,
    });
  }

  TableCharacterCompanion copyWith(
      {Value<int>? id,
      Value<String>? charName,
      Value<String>? charClass,
      Value<int>? lvl,
      Value<String>? race,
      Value<String>? alignment,
      Value<String>? size}) {
    return TableCharacterCompanion(
      id: id ?? this.id,
      charName: charName ?? this.charName,
      charClass: charClass ?? this.charClass,
      lvl: lvl ?? this.lvl,
      race: race ?? this.race,
      alignment: alignment ?? this.alignment,
      size: size ?? this.size,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (charName.present) {
      map['char_name'] = Variable<String>(charName.value);
    }
    if (charClass.present) {
      map['char_class'] = Variable<String>(charClass.value);
    }
    if (lvl.present) {
      map['lvl'] = Variable<int>(lvl.value);
    }
    if (race.present) {
      map['race'] = Variable<String>(race.value);
    }
    if (alignment.present) {
      map['alignment'] = Variable<String>(alignment.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableCharacterCompanion(')
          ..write('id: $id, ')
          ..write('charName: $charName, ')
          ..write('charClass: $charClass, ')
          ..write('lvl: $lvl, ')
          ..write('race: $race, ')
          ..write('alignment: $alignment, ')
          ..write('size: $size')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TableCharacterTable tableCharacter = $TableCharacterTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tableCharacter];
}

typedef $$TableCharacterTableCreateCompanionBuilder = TableCharacterCompanion
    Function({
  Value<int> id,
  required String charName,
  required String charClass,
  required int lvl,
  required String race,
  required String alignment,
  required String size,
});
typedef $$TableCharacterTableUpdateCompanionBuilder = TableCharacterCompanion
    Function({
  Value<int> id,
  Value<String> charName,
  Value<String> charClass,
  Value<int> lvl,
  Value<String> race,
  Value<String> alignment,
  Value<String> size,
});

class $$TableCharacterTableFilterComposer
    extends Composer<_$AppDatabase, $TableCharacterTable> {
  $$TableCharacterTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get charName => $composableBuilder(
      column: $table.charName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get charClass => $composableBuilder(
      column: $table.charClass, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lvl => $composableBuilder(
      column: $table.lvl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get race => $composableBuilder(
      column: $table.race, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get alignment => $composableBuilder(
      column: $table.alignment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get size => $composableBuilder(
      column: $table.size, builder: (column) => ColumnFilters(column));
}

class $$TableCharacterTableOrderingComposer
    extends Composer<_$AppDatabase, $TableCharacterTable> {
  $$TableCharacterTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get charName => $composableBuilder(
      column: $table.charName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get charClass => $composableBuilder(
      column: $table.charClass, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lvl => $composableBuilder(
      column: $table.lvl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get race => $composableBuilder(
      column: $table.race, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get alignment => $composableBuilder(
      column: $table.alignment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get size => $composableBuilder(
      column: $table.size, builder: (column) => ColumnOrderings(column));
}

class $$TableCharacterTableAnnotationComposer
    extends Composer<_$AppDatabase, $TableCharacterTable> {
  $$TableCharacterTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get charName =>
      $composableBuilder(column: $table.charName, builder: (column) => column);

  GeneratedColumn<String> get charClass =>
      $composableBuilder(column: $table.charClass, builder: (column) => column);

  GeneratedColumn<int> get lvl =>
      $composableBuilder(column: $table.lvl, builder: (column) => column);

  GeneratedColumn<String> get race =>
      $composableBuilder(column: $table.race, builder: (column) => column);

  GeneratedColumn<String> get alignment =>
      $composableBuilder(column: $table.alignment, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);
}

class $$TableCharacterTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TableCharacterTable,
    TableCharacterData,
    $$TableCharacterTableFilterComposer,
    $$TableCharacterTableOrderingComposer,
    $$TableCharacterTableAnnotationComposer,
    $$TableCharacterTableCreateCompanionBuilder,
    $$TableCharacterTableUpdateCompanionBuilder,
    (
      TableCharacterData,
      BaseReferences<_$AppDatabase, $TableCharacterTable, TableCharacterData>
    ),
    TableCharacterData,
    PrefetchHooks Function()> {
  $$TableCharacterTableTableManager(
      _$AppDatabase db, $TableCharacterTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TableCharacterTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TableCharacterTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TableCharacterTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> charName = const Value.absent(),
            Value<String> charClass = const Value.absent(),
            Value<int> lvl = const Value.absent(),
            Value<String> race = const Value.absent(),
            Value<String> alignment = const Value.absent(),
            Value<String> size = const Value.absent(),
          }) =>
              TableCharacterCompanion(
            id: id,
            charName: charName,
            charClass: charClass,
            lvl: lvl,
            race: race,
            alignment: alignment,
            size: size,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String charName,
            required String charClass,
            required int lvl,
            required String race,
            required String alignment,
            required String size,
          }) =>
              TableCharacterCompanion.insert(
            id: id,
            charName: charName,
            charClass: charClass,
            lvl: lvl,
            race: race,
            alignment: alignment,
            size: size,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TableCharacterTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TableCharacterTable,
    TableCharacterData,
    $$TableCharacterTableFilterComposer,
    $$TableCharacterTableOrderingComposer,
    $$TableCharacterTableAnnotationComposer,
    $$TableCharacterTableCreateCompanionBuilder,
    $$TableCharacterTableUpdateCompanionBuilder,
    (
      TableCharacterData,
      BaseReferences<_$AppDatabase, $TableCharacterTable, TableCharacterData>
    ),
    TableCharacterData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TableCharacterTableTableManager get tableCharacter =>
      $$TableCharacterTableTableManager(_db, _db.tableCharacter);
}
