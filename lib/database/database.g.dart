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
  static const VerificationMeta _strengthMeta =
      const VerificationMeta('strength');
  @override
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
      'strength', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dexterityMeta =
      const VerificationMeta('dexterity');
  @override
  late final GeneratedColumn<int> dexterity = GeneratedColumn<int>(
      'dexterity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _constitutionMeta =
      const VerificationMeta('constitution');
  @override
  late final GeneratedColumn<int> constitution = GeneratedColumn<int>(
      'constitution', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intelligenceMeta =
      const VerificationMeta('intelligence');
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
      'intelligence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wisdomMeta = const VerificationMeta('wisdom');
  @override
  late final GeneratedColumn<int> wisdom = GeneratedColumn<int>(
      'wisdom', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _charismaMeta =
      const VerificationMeta('charisma');
  @override
  late final GeneratedColumn<int> charisma = GeneratedColumn<int>(
      'charisma', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxHpMeta = const VerificationMeta('maxHp');
  @override
  late final GeneratedColumn<int> maxHp = GeneratedColumn<int>(
      'max_hp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentHpMeta =
      const VerificationMeta('currentHp');
  @override
  late final GeneratedColumn<int> currentHp = GeneratedColumn<int>(
      'current_hp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxStamMeta =
      const VerificationMeta('maxStam');
  @override
  late final GeneratedColumn<int> maxStam = GeneratedColumn<int>(
      'max_stam', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentStamMeta =
      const VerificationMeta('currentStam');
  @override
  late final GeneratedColumn<int> currentStam = GeneratedColumn<int>(
      'current_stam', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxResolveMeta =
      const VerificationMeta('maxResolve');
  @override
  late final GeneratedColumn<int> maxResolve = GeneratedColumn<int>(
      'max_resolve', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currentResolveMeta =
      const VerificationMeta('currentResolve');
  @override
  late final GeneratedColumn<int> currentResolve = GeneratedColumn<int>(
      'current_resolve', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _damageLogMeta =
      const VerificationMeta('damageLog');
  @override
  late final GeneratedColumn<String> damageLog = GeneratedColumn<String>(
      'damage_log', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        charName,
        charClass,
        lvl,
        race,
        alignment,
        size,
        strength,
        dexterity,
        constitution,
        intelligence,
        wisdom,
        charisma,
        maxHp,
        currentHp,
        maxStam,
        currentStam,
        maxResolve,
        currentResolve,
        damageLog
      ];
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
    if (data.containsKey('strength')) {
      context.handle(_strengthMeta,
          strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta));
    } else if (isInserting) {
      context.missing(_strengthMeta);
    }
    if (data.containsKey('dexterity')) {
      context.handle(_dexterityMeta,
          dexterity.isAcceptableOrUnknown(data['dexterity']!, _dexterityMeta));
    } else if (isInserting) {
      context.missing(_dexterityMeta);
    }
    if (data.containsKey('constitution')) {
      context.handle(
          _constitutionMeta,
          constitution.isAcceptableOrUnknown(
              data['constitution']!, _constitutionMeta));
    } else if (isInserting) {
      context.missing(_constitutionMeta);
    }
    if (data.containsKey('intelligence')) {
      context.handle(
          _intelligenceMeta,
          intelligence.isAcceptableOrUnknown(
              data['intelligence']!, _intelligenceMeta));
    } else if (isInserting) {
      context.missing(_intelligenceMeta);
    }
    if (data.containsKey('wisdom')) {
      context.handle(_wisdomMeta,
          wisdom.isAcceptableOrUnknown(data['wisdom']!, _wisdomMeta));
    } else if (isInserting) {
      context.missing(_wisdomMeta);
    }
    if (data.containsKey('charisma')) {
      context.handle(_charismaMeta,
          charisma.isAcceptableOrUnknown(data['charisma']!, _charismaMeta));
    } else if (isInserting) {
      context.missing(_charismaMeta);
    }
    if (data.containsKey('max_hp')) {
      context.handle(
          _maxHpMeta, maxHp.isAcceptableOrUnknown(data['max_hp']!, _maxHpMeta));
    } else if (isInserting) {
      context.missing(_maxHpMeta);
    }
    if (data.containsKey('current_hp')) {
      context.handle(_currentHpMeta,
          currentHp.isAcceptableOrUnknown(data['current_hp']!, _currentHpMeta));
    } else if (isInserting) {
      context.missing(_currentHpMeta);
    }
    if (data.containsKey('max_stam')) {
      context.handle(_maxStamMeta,
          maxStam.isAcceptableOrUnknown(data['max_stam']!, _maxStamMeta));
    } else if (isInserting) {
      context.missing(_maxStamMeta);
    }
    if (data.containsKey('current_stam')) {
      context.handle(
          _currentStamMeta,
          currentStam.isAcceptableOrUnknown(
              data['current_stam']!, _currentStamMeta));
    } else if (isInserting) {
      context.missing(_currentStamMeta);
    }
    if (data.containsKey('max_resolve')) {
      context.handle(
          _maxResolveMeta,
          maxResolve.isAcceptableOrUnknown(
              data['max_resolve']!, _maxResolveMeta));
    } else if (isInserting) {
      context.missing(_maxResolveMeta);
    }
    if (data.containsKey('current_resolve')) {
      context.handle(
          _currentResolveMeta,
          currentResolve.isAcceptableOrUnknown(
              data['current_resolve']!, _currentResolveMeta));
    } else if (isInserting) {
      context.missing(_currentResolveMeta);
    }
    if (data.containsKey('damage_log')) {
      context.handle(_damageLogMeta,
          damageLog.isAcceptableOrUnknown(data['damage_log']!, _damageLogMeta));
    } else if (isInserting) {
      context.missing(_damageLogMeta);
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
      strength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}strength'])!,
      dexterity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dexterity'])!,
      constitution: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}constitution'])!,
      intelligence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intelligence'])!,
      wisdom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wisdom'])!,
      charisma: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charisma'])!,
      maxHp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_hp'])!,
      currentHp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_hp'])!,
      maxStam: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_stam'])!,
      currentStam: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_stam'])!,
      maxResolve: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_resolve'])!,
      currentResolve: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_resolve'])!,
      damageLog: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}damage_log'])!,
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
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final int maxHp;
  final int currentHp;
  final int maxStam;
  final int currentStam;
  final int maxResolve;
  final int currentResolve;
  final String damageLog;
  const TableCharacterData(
      {required this.id,
      required this.charName,
      required this.charClass,
      required this.lvl,
      required this.race,
      required this.alignment,
      required this.size,
      required this.strength,
      required this.dexterity,
      required this.constitution,
      required this.intelligence,
      required this.wisdom,
      required this.charisma,
      required this.maxHp,
      required this.currentHp,
      required this.maxStam,
      required this.currentStam,
      required this.maxResolve,
      required this.currentResolve,
      required this.damageLog});
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
    map['strength'] = Variable<int>(strength);
    map['dexterity'] = Variable<int>(dexterity);
    map['constitution'] = Variable<int>(constitution);
    map['intelligence'] = Variable<int>(intelligence);
    map['wisdom'] = Variable<int>(wisdom);
    map['charisma'] = Variable<int>(charisma);
    map['max_hp'] = Variable<int>(maxHp);
    map['current_hp'] = Variable<int>(currentHp);
    map['max_stam'] = Variable<int>(maxStam);
    map['current_stam'] = Variable<int>(currentStam);
    map['max_resolve'] = Variable<int>(maxResolve);
    map['current_resolve'] = Variable<int>(currentResolve);
    map['damage_log'] = Variable<String>(damageLog);
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
      strength: Value(strength),
      dexterity: Value(dexterity),
      constitution: Value(constitution),
      intelligence: Value(intelligence),
      wisdom: Value(wisdom),
      charisma: Value(charisma),
      maxHp: Value(maxHp),
      currentHp: Value(currentHp),
      maxStam: Value(maxStam),
      currentStam: Value(currentStam),
      maxResolve: Value(maxResolve),
      currentResolve: Value(currentResolve),
      damageLog: Value(damageLog),
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
      strength: serializer.fromJson<int>(json['strength']),
      dexterity: serializer.fromJson<int>(json['dexterity']),
      constitution: serializer.fromJson<int>(json['constitution']),
      intelligence: serializer.fromJson<int>(json['intelligence']),
      wisdom: serializer.fromJson<int>(json['wisdom']),
      charisma: serializer.fromJson<int>(json['charisma']),
      maxHp: serializer.fromJson<int>(json['maxHp']),
      currentHp: serializer.fromJson<int>(json['currentHp']),
      maxStam: serializer.fromJson<int>(json['maxStam']),
      currentStam: serializer.fromJson<int>(json['currentStam']),
      maxResolve: serializer.fromJson<int>(json['maxResolve']),
      currentResolve: serializer.fromJson<int>(json['currentResolve']),
      damageLog: serializer.fromJson<String>(json['damageLog']),
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
      'strength': serializer.toJson<int>(strength),
      'dexterity': serializer.toJson<int>(dexterity),
      'constitution': serializer.toJson<int>(constitution),
      'intelligence': serializer.toJson<int>(intelligence),
      'wisdom': serializer.toJson<int>(wisdom),
      'charisma': serializer.toJson<int>(charisma),
      'maxHp': serializer.toJson<int>(maxHp),
      'currentHp': serializer.toJson<int>(currentHp),
      'maxStam': serializer.toJson<int>(maxStam),
      'currentStam': serializer.toJson<int>(currentStam),
      'maxResolve': serializer.toJson<int>(maxResolve),
      'currentResolve': serializer.toJson<int>(currentResolve),
      'damageLog': serializer.toJson<String>(damageLog),
    };
  }

  TableCharacterData copyWith(
          {int? id,
          String? charName,
          String? charClass,
          int? lvl,
          String? race,
          String? alignment,
          String? size,
          int? strength,
          int? dexterity,
          int? constitution,
          int? intelligence,
          int? wisdom,
          int? charisma,
          int? maxHp,
          int? currentHp,
          int? maxStam,
          int? currentStam,
          int? maxResolve,
          int? currentResolve,
          String? damageLog}) =>
      TableCharacterData(
        id: id ?? this.id,
        charName: charName ?? this.charName,
        charClass: charClass ?? this.charClass,
        lvl: lvl ?? this.lvl,
        race: race ?? this.race,
        alignment: alignment ?? this.alignment,
        size: size ?? this.size,
        strength: strength ?? this.strength,
        dexterity: dexterity ?? this.dexterity,
        constitution: constitution ?? this.constitution,
        intelligence: intelligence ?? this.intelligence,
        wisdom: wisdom ?? this.wisdom,
        charisma: charisma ?? this.charisma,
        maxHp: maxHp ?? this.maxHp,
        currentHp: currentHp ?? this.currentHp,
        maxStam: maxStam ?? this.maxStam,
        currentStam: currentStam ?? this.currentStam,
        maxResolve: maxResolve ?? this.maxResolve,
        currentResolve: currentResolve ?? this.currentResolve,
        damageLog: damageLog ?? this.damageLog,
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
      strength: data.strength.present ? data.strength.value : this.strength,
      dexterity: data.dexterity.present ? data.dexterity.value : this.dexterity,
      constitution: data.constitution.present
          ? data.constitution.value
          : this.constitution,
      intelligence: data.intelligence.present
          ? data.intelligence.value
          : this.intelligence,
      wisdom: data.wisdom.present ? data.wisdom.value : this.wisdom,
      charisma: data.charisma.present ? data.charisma.value : this.charisma,
      maxHp: data.maxHp.present ? data.maxHp.value : this.maxHp,
      currentHp: data.currentHp.present ? data.currentHp.value : this.currentHp,
      maxStam: data.maxStam.present ? data.maxStam.value : this.maxStam,
      currentStam:
          data.currentStam.present ? data.currentStam.value : this.currentStam,
      maxResolve:
          data.maxResolve.present ? data.maxResolve.value : this.maxResolve,
      currentResolve: data.currentResolve.present
          ? data.currentResolve.value
          : this.currentResolve,
      damageLog: data.damageLog.present ? data.damageLog.value : this.damageLog,
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
          ..write('size: $size, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('maxHp: $maxHp, ')
          ..write('currentHp: $currentHp, ')
          ..write('maxStam: $maxStam, ')
          ..write('currentStam: $currentStam, ')
          ..write('maxResolve: $maxResolve, ')
          ..write('currentResolve: $currentResolve, ')
          ..write('damageLog: $damageLog')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      charName,
      charClass,
      lvl,
      race,
      alignment,
      size,
      strength,
      dexterity,
      constitution,
      intelligence,
      wisdom,
      charisma,
      maxHp,
      currentHp,
      maxStam,
      currentStam,
      maxResolve,
      currentResolve,
      damageLog);
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
          other.size == this.size &&
          other.strength == this.strength &&
          other.dexterity == this.dexterity &&
          other.constitution == this.constitution &&
          other.intelligence == this.intelligence &&
          other.wisdom == this.wisdom &&
          other.charisma == this.charisma &&
          other.maxHp == this.maxHp &&
          other.currentHp == this.currentHp &&
          other.maxStam == this.maxStam &&
          other.currentStam == this.currentStam &&
          other.maxResolve == this.maxResolve &&
          other.currentResolve == this.currentResolve &&
          other.damageLog == this.damageLog);
}

class TableCharacterCompanion extends UpdateCompanion<TableCharacterData> {
  final Value<int> id;
  final Value<String> charName;
  final Value<String> charClass;
  final Value<int> lvl;
  final Value<String> race;
  final Value<String> alignment;
  final Value<String> size;
  final Value<int> strength;
  final Value<int> dexterity;
  final Value<int> constitution;
  final Value<int> intelligence;
  final Value<int> wisdom;
  final Value<int> charisma;
  final Value<int> maxHp;
  final Value<int> currentHp;
  final Value<int> maxStam;
  final Value<int> currentStam;
  final Value<int> maxResolve;
  final Value<int> currentResolve;
  final Value<String> damageLog;
  const TableCharacterCompanion({
    this.id = const Value.absent(),
    this.charName = const Value.absent(),
    this.charClass = const Value.absent(),
    this.lvl = const Value.absent(),
    this.race = const Value.absent(),
    this.alignment = const Value.absent(),
    this.size = const Value.absent(),
    this.strength = const Value.absent(),
    this.dexterity = const Value.absent(),
    this.constitution = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.charisma = const Value.absent(),
    this.maxHp = const Value.absent(),
    this.currentHp = const Value.absent(),
    this.maxStam = const Value.absent(),
    this.currentStam = const Value.absent(),
    this.maxResolve = const Value.absent(),
    this.currentResolve = const Value.absent(),
    this.damageLog = const Value.absent(),
  });
  TableCharacterCompanion.insert({
    this.id = const Value.absent(),
    required String charName,
    required String charClass,
    required int lvl,
    required String race,
    required String alignment,
    required String size,
    required int strength,
    required int dexterity,
    required int constitution,
    required int intelligence,
    required int wisdom,
    required int charisma,
    required int maxHp,
    required int currentHp,
    required int maxStam,
    required int currentStam,
    required int maxResolve,
    required int currentResolve,
    required String damageLog,
  })  : charName = Value(charName),
        charClass = Value(charClass),
        lvl = Value(lvl),
        race = Value(race),
        alignment = Value(alignment),
        size = Value(size),
        strength = Value(strength),
        dexterity = Value(dexterity),
        constitution = Value(constitution),
        intelligence = Value(intelligence),
        wisdom = Value(wisdom),
        charisma = Value(charisma),
        maxHp = Value(maxHp),
        currentHp = Value(currentHp),
        maxStam = Value(maxStam),
        currentStam = Value(currentStam),
        maxResolve = Value(maxResolve),
        currentResolve = Value(currentResolve),
        damageLog = Value(damageLog);
  static Insertable<TableCharacterData> custom({
    Expression<int>? id,
    Expression<String>? charName,
    Expression<String>? charClass,
    Expression<int>? lvl,
    Expression<String>? race,
    Expression<String>? alignment,
    Expression<String>? size,
    Expression<int>? strength,
    Expression<int>? dexterity,
    Expression<int>? constitution,
    Expression<int>? intelligence,
    Expression<int>? wisdom,
    Expression<int>? charisma,
    Expression<int>? maxHp,
    Expression<int>? currentHp,
    Expression<int>? maxStam,
    Expression<int>? currentStam,
    Expression<int>? maxResolve,
    Expression<int>? currentResolve,
    Expression<String>? damageLog,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (charName != null) 'char_name': charName,
      if (charClass != null) 'char_class': charClass,
      if (lvl != null) 'lvl': lvl,
      if (race != null) 'race': race,
      if (alignment != null) 'alignment': alignment,
      if (size != null) 'size': size,
      if (strength != null) 'strength': strength,
      if (dexterity != null) 'dexterity': dexterity,
      if (constitution != null) 'constitution': constitution,
      if (intelligence != null) 'intelligence': intelligence,
      if (wisdom != null) 'wisdom': wisdom,
      if (charisma != null) 'charisma': charisma,
      if (maxHp != null) 'max_hp': maxHp,
      if (currentHp != null) 'current_hp': currentHp,
      if (maxStam != null) 'max_stam': maxStam,
      if (currentStam != null) 'current_stam': currentStam,
      if (maxResolve != null) 'max_resolve': maxResolve,
      if (currentResolve != null) 'current_resolve': currentResolve,
      if (damageLog != null) 'damage_log': damageLog,
    });
  }

  TableCharacterCompanion copyWith(
      {Value<int>? id,
      Value<String>? charName,
      Value<String>? charClass,
      Value<int>? lvl,
      Value<String>? race,
      Value<String>? alignment,
      Value<String>? size,
      Value<int>? strength,
      Value<int>? dexterity,
      Value<int>? constitution,
      Value<int>? intelligence,
      Value<int>? wisdom,
      Value<int>? charisma,
      Value<int>? maxHp,
      Value<int>? currentHp,
      Value<int>? maxStam,
      Value<int>? currentStam,
      Value<int>? maxResolve,
      Value<int>? currentResolve,
      Value<String>? damageLog}) {
    return TableCharacterCompanion(
      id: id ?? this.id,
      charName: charName ?? this.charName,
      charClass: charClass ?? this.charClass,
      lvl: lvl ?? this.lvl,
      race: race ?? this.race,
      alignment: alignment ?? this.alignment,
      size: size ?? this.size,
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      maxHp: maxHp ?? this.maxHp,
      currentHp: currentHp ?? this.currentHp,
      maxStam: maxStam ?? this.maxStam,
      currentStam: currentStam ?? this.currentStam,
      maxResolve: maxResolve ?? this.maxResolve,
      currentResolve: currentResolve ?? this.currentResolve,
      damageLog: damageLog ?? this.damageLog,
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
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (dexterity.present) {
      map['dexterity'] = Variable<int>(dexterity.value);
    }
    if (constitution.present) {
      map['constitution'] = Variable<int>(constitution.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (wisdom.present) {
      map['wisdom'] = Variable<int>(wisdom.value);
    }
    if (charisma.present) {
      map['charisma'] = Variable<int>(charisma.value);
    }
    if (maxHp.present) {
      map['max_hp'] = Variable<int>(maxHp.value);
    }
    if (currentHp.present) {
      map['current_hp'] = Variable<int>(currentHp.value);
    }
    if (maxStam.present) {
      map['max_stam'] = Variable<int>(maxStam.value);
    }
    if (currentStam.present) {
      map['current_stam'] = Variable<int>(currentStam.value);
    }
    if (maxResolve.present) {
      map['max_resolve'] = Variable<int>(maxResolve.value);
    }
    if (currentResolve.present) {
      map['current_resolve'] = Variable<int>(currentResolve.value);
    }
    if (damageLog.present) {
      map['damage_log'] = Variable<String>(damageLog.value);
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
          ..write('size: $size, ')
          ..write('strength: $strength, ')
          ..write('dexterity: $dexterity, ')
          ..write('constitution: $constitution, ')
          ..write('intelligence: $intelligence, ')
          ..write('wisdom: $wisdom, ')
          ..write('charisma: $charisma, ')
          ..write('maxHp: $maxHp, ')
          ..write('currentHp: $currentHp, ')
          ..write('maxStam: $maxStam, ')
          ..write('currentStam: $currentStam, ')
          ..write('maxResolve: $maxResolve, ')
          ..write('currentResolve: $currentResolve, ')
          ..write('damageLog: $damageLog')
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
  required int strength,
  required int dexterity,
  required int constitution,
  required int intelligence,
  required int wisdom,
  required int charisma,
  required int maxHp,
  required int currentHp,
  required int maxStam,
  required int currentStam,
  required int maxResolve,
  required int currentResolve,
  required String damageLog,
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
  Value<int> strength,
  Value<int> dexterity,
  Value<int> constitution,
  Value<int> intelligence,
  Value<int> wisdom,
  Value<int> charisma,
  Value<int> maxHp,
  Value<int> currentHp,
  Value<int> maxStam,
  Value<int> currentStam,
  Value<int> maxResolve,
  Value<int> currentResolve,
  Value<String> damageLog,
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

  ColumnFilters<int> get strength => $composableBuilder(
      column: $table.strength, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dexterity => $composableBuilder(
      column: $table.dexterity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get constitution => $composableBuilder(
      column: $table.constitution, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get intelligence => $composableBuilder(
      column: $table.intelligence, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wisdom => $composableBuilder(
      column: $table.wisdom, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get charisma => $composableBuilder(
      column: $table.charisma, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxHp => $composableBuilder(
      column: $table.maxHp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentHp => $composableBuilder(
      column: $table.currentHp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxStam => $composableBuilder(
      column: $table.maxStam, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentStam => $composableBuilder(
      column: $table.currentStam, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxResolve => $composableBuilder(
      column: $table.maxResolve, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentResolve => $composableBuilder(
      column: $table.currentResolve,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get damageLog => $composableBuilder(
      column: $table.damageLog, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<int> get strength => $composableBuilder(
      column: $table.strength, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dexterity => $composableBuilder(
      column: $table.dexterity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get constitution => $composableBuilder(
      column: $table.constitution,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get intelligence => $composableBuilder(
      column: $table.intelligence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wisdom => $composableBuilder(
      column: $table.wisdom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get charisma => $composableBuilder(
      column: $table.charisma, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxHp => $composableBuilder(
      column: $table.maxHp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentHp => $composableBuilder(
      column: $table.currentHp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxStam => $composableBuilder(
      column: $table.maxStam, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentStam => $composableBuilder(
      column: $table.currentStam, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxResolve => $composableBuilder(
      column: $table.maxResolve, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentResolve => $composableBuilder(
      column: $table.currentResolve,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get damageLog => $composableBuilder(
      column: $table.damageLog, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<int> get dexterity =>
      $composableBuilder(column: $table.dexterity, builder: (column) => column);

  GeneratedColumn<int> get constitution => $composableBuilder(
      column: $table.constitution, builder: (column) => column);

  GeneratedColumn<int> get intelligence => $composableBuilder(
      column: $table.intelligence, builder: (column) => column);

  GeneratedColumn<int> get wisdom =>
      $composableBuilder(column: $table.wisdom, builder: (column) => column);

  GeneratedColumn<int> get charisma =>
      $composableBuilder(column: $table.charisma, builder: (column) => column);

  GeneratedColumn<int> get maxHp =>
      $composableBuilder(column: $table.maxHp, builder: (column) => column);

  GeneratedColumn<int> get currentHp =>
      $composableBuilder(column: $table.currentHp, builder: (column) => column);

  GeneratedColumn<int> get maxStam =>
      $composableBuilder(column: $table.maxStam, builder: (column) => column);

  GeneratedColumn<int> get currentStam => $composableBuilder(
      column: $table.currentStam, builder: (column) => column);

  GeneratedColumn<int> get maxResolve => $composableBuilder(
      column: $table.maxResolve, builder: (column) => column);

  GeneratedColumn<int> get currentResolve => $composableBuilder(
      column: $table.currentResolve, builder: (column) => column);

  GeneratedColumn<String> get damageLog =>
      $composableBuilder(column: $table.damageLog, builder: (column) => column);
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
            Value<int> strength = const Value.absent(),
            Value<int> dexterity = const Value.absent(),
            Value<int> constitution = const Value.absent(),
            Value<int> intelligence = const Value.absent(),
            Value<int> wisdom = const Value.absent(),
            Value<int> charisma = const Value.absent(),
            Value<int> maxHp = const Value.absent(),
            Value<int> currentHp = const Value.absent(),
            Value<int> maxStam = const Value.absent(),
            Value<int> currentStam = const Value.absent(),
            Value<int> maxResolve = const Value.absent(),
            Value<int> currentResolve = const Value.absent(),
            Value<String> damageLog = const Value.absent(),
          }) =>
              TableCharacterCompanion(
            id: id,
            charName: charName,
            charClass: charClass,
            lvl: lvl,
            race: race,
            alignment: alignment,
            size: size,
            strength: strength,
            dexterity: dexterity,
            constitution: constitution,
            intelligence: intelligence,
            wisdom: wisdom,
            charisma: charisma,
            maxHp: maxHp,
            currentHp: currentHp,
            maxStam: maxStam,
            currentStam: currentStam,
            maxResolve: maxResolve,
            currentResolve: currentResolve,
            damageLog: damageLog,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String charName,
            required String charClass,
            required int lvl,
            required String race,
            required String alignment,
            required String size,
            required int strength,
            required int dexterity,
            required int constitution,
            required int intelligence,
            required int wisdom,
            required int charisma,
            required int maxHp,
            required int currentHp,
            required int maxStam,
            required int currentStam,
            required int maxResolve,
            required int currentResolve,
            required String damageLog,
          }) =>
              TableCharacterCompanion.insert(
            id: id,
            charName: charName,
            charClass: charClass,
            lvl: lvl,
            race: race,
            alignment: alignment,
            size: size,
            strength: strength,
            dexterity: dexterity,
            constitution: constitution,
            intelligence: intelligence,
            wisdom: wisdom,
            charisma: charisma,
            maxHp: maxHp,
            currentHp: currentHp,
            maxStam: maxStam,
            currentStam: currentStam,
            maxResolve: maxResolve,
            currentResolve: currentResolve,
            damageLog: damageLog,
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
