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
  static const VerificationMeta _eacArmorMeta =
      const VerificationMeta('eacArmor');
  @override
  late final GeneratedColumn<int> eacArmor = GeneratedColumn<int>(
      'eac_armor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _eacDodgerMeta =
      const VerificationMeta('eacDodger');
  @override
  late final GeneratedColumn<int> eacDodger = GeneratedColumn<int>(
      'eac_dodger', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _eacNaturalMeta =
      const VerificationMeta('eacNatural');
  @override
  late final GeneratedColumn<int> eacNatural = GeneratedColumn<int>(
      'eac_natural', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _eacDeflectMeta =
      const VerificationMeta('eacDeflect');
  @override
  late final GeneratedColumn<int> eacDeflect = GeneratedColumn<int>(
      'eac_deflect', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _eacMiscMeta =
      const VerificationMeta('eacMisc');
  @override
  late final GeneratedColumn<int> eacMisc = GeneratedColumn<int>(
      'eac_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kacArmorMeta =
      const VerificationMeta('kacArmor');
  @override
  late final GeneratedColumn<int> kacArmor = GeneratedColumn<int>(
      'kac_armor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kacDodgerMeta =
      const VerificationMeta('kacDodger');
  @override
  late final GeneratedColumn<int> kacDodger = GeneratedColumn<int>(
      'kac_dodger', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kacNaturalMeta =
      const VerificationMeta('kacNatural');
  @override
  late final GeneratedColumn<int> kacNatural = GeneratedColumn<int>(
      'kac_natural', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kacDeflectMeta =
      const VerificationMeta('kacDeflect');
  @override
  late final GeneratedColumn<int> kacDeflect = GeneratedColumn<int>(
      'kac_deflect', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kacMiscMeta =
      const VerificationMeta('kacMisc');
  @override
  late final GeneratedColumn<int> kacMisc = GeneratedColumn<int>(
      'kac_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _moveSpeedMeta =
      const VerificationMeta('moveSpeed');
  @override
  late final GeneratedColumn<int> moveSpeed = GeneratedColumn<int>(
      'move_speed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _flySpeedMeta =
      const VerificationMeta('flySpeed');
  @override
  late final GeneratedColumn<int> flySpeed = GeneratedColumn<int>(
      'fly_speed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _swimSpeedMeta =
      const VerificationMeta('swimSpeed');
  @override
  late final GeneratedColumn<int> swimSpeed = GeneratedColumn<int>(
      'swim_speed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _initMiscMeta =
      const VerificationMeta('initMisc');
  @override
  late final GeneratedColumn<int> initMisc = GeneratedColumn<int>(
      'init_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _babMeta = const VerificationMeta('bab');
  @override
  late final GeneratedColumn<int> bab = GeneratedColumn<int>(
      'bab', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mabMiscMeta =
      const VerificationMeta('mabMisc');
  @override
  late final GeneratedColumn<int> mabMisc = GeneratedColumn<int>(
      'mab_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mabTempMeta =
      const VerificationMeta('mabTemp');
  @override
  late final GeneratedColumn<int> mabTemp = GeneratedColumn<int>(
      'mab_temp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tabMiscMeta =
      const VerificationMeta('tabMisc');
  @override
  late final GeneratedColumn<int> tabMisc = GeneratedColumn<int>(
      'tab_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tabTempMeta =
      const VerificationMeta('tabTemp');
  @override
  late final GeneratedColumn<int> tabTemp = GeneratedColumn<int>(
      'tab_temp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rabMiscMeta =
      const VerificationMeta('rabMisc');
  @override
  late final GeneratedColumn<int> rabMisc = GeneratedColumn<int>(
      'rab_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _rabTempMeta =
      const VerificationMeta('rabTemp');
  @override
  late final GeneratedColumn<int> rabTemp = GeneratedColumn<int>(
      'rab_temp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
        damageLog,
        eacArmor,
        eacDodger,
        eacNatural,
        eacDeflect,
        eacMisc,
        kacArmor,
        kacDodger,
        kacNatural,
        kacDeflect,
        kacMisc,
        moveSpeed,
        flySpeed,
        swimSpeed,
        initMisc,
        bab,
        mabMisc,
        mabTemp,
        tabMisc,
        tabTemp,
        rabMisc,
        rabTemp
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
    if (data.containsKey('eac_armor')) {
      context.handle(_eacArmorMeta,
          eacArmor.isAcceptableOrUnknown(data['eac_armor']!, _eacArmorMeta));
    } else if (isInserting) {
      context.missing(_eacArmorMeta);
    }
    if (data.containsKey('eac_dodger')) {
      context.handle(_eacDodgerMeta,
          eacDodger.isAcceptableOrUnknown(data['eac_dodger']!, _eacDodgerMeta));
    } else if (isInserting) {
      context.missing(_eacDodgerMeta);
    }
    if (data.containsKey('eac_natural')) {
      context.handle(
          _eacNaturalMeta,
          eacNatural.isAcceptableOrUnknown(
              data['eac_natural']!, _eacNaturalMeta));
    } else if (isInserting) {
      context.missing(_eacNaturalMeta);
    }
    if (data.containsKey('eac_deflect')) {
      context.handle(
          _eacDeflectMeta,
          eacDeflect.isAcceptableOrUnknown(
              data['eac_deflect']!, _eacDeflectMeta));
    } else if (isInserting) {
      context.missing(_eacDeflectMeta);
    }
    if (data.containsKey('eac_misc')) {
      context.handle(_eacMiscMeta,
          eacMisc.isAcceptableOrUnknown(data['eac_misc']!, _eacMiscMeta));
    } else if (isInserting) {
      context.missing(_eacMiscMeta);
    }
    if (data.containsKey('kac_armor')) {
      context.handle(_kacArmorMeta,
          kacArmor.isAcceptableOrUnknown(data['kac_armor']!, _kacArmorMeta));
    } else if (isInserting) {
      context.missing(_kacArmorMeta);
    }
    if (data.containsKey('kac_dodger')) {
      context.handle(_kacDodgerMeta,
          kacDodger.isAcceptableOrUnknown(data['kac_dodger']!, _kacDodgerMeta));
    } else if (isInserting) {
      context.missing(_kacDodgerMeta);
    }
    if (data.containsKey('kac_natural')) {
      context.handle(
          _kacNaturalMeta,
          kacNatural.isAcceptableOrUnknown(
              data['kac_natural']!, _kacNaturalMeta));
    } else if (isInserting) {
      context.missing(_kacNaturalMeta);
    }
    if (data.containsKey('kac_deflect')) {
      context.handle(
          _kacDeflectMeta,
          kacDeflect.isAcceptableOrUnknown(
              data['kac_deflect']!, _kacDeflectMeta));
    } else if (isInserting) {
      context.missing(_kacDeflectMeta);
    }
    if (data.containsKey('kac_misc')) {
      context.handle(_kacMiscMeta,
          kacMisc.isAcceptableOrUnknown(data['kac_misc']!, _kacMiscMeta));
    } else if (isInserting) {
      context.missing(_kacMiscMeta);
    }
    if (data.containsKey('move_speed')) {
      context.handle(_moveSpeedMeta,
          moveSpeed.isAcceptableOrUnknown(data['move_speed']!, _moveSpeedMeta));
    } else if (isInserting) {
      context.missing(_moveSpeedMeta);
    }
    if (data.containsKey('fly_speed')) {
      context.handle(_flySpeedMeta,
          flySpeed.isAcceptableOrUnknown(data['fly_speed']!, _flySpeedMeta));
    } else if (isInserting) {
      context.missing(_flySpeedMeta);
    }
    if (data.containsKey('swim_speed')) {
      context.handle(_swimSpeedMeta,
          swimSpeed.isAcceptableOrUnknown(data['swim_speed']!, _swimSpeedMeta));
    } else if (isInserting) {
      context.missing(_swimSpeedMeta);
    }
    if (data.containsKey('init_misc')) {
      context.handle(_initMiscMeta,
          initMisc.isAcceptableOrUnknown(data['init_misc']!, _initMiscMeta));
    } else if (isInserting) {
      context.missing(_initMiscMeta);
    }
    if (data.containsKey('bab')) {
      context.handle(
          _babMeta, bab.isAcceptableOrUnknown(data['bab']!, _babMeta));
    } else if (isInserting) {
      context.missing(_babMeta);
    }
    if (data.containsKey('mab_misc')) {
      context.handle(_mabMiscMeta,
          mabMisc.isAcceptableOrUnknown(data['mab_misc']!, _mabMiscMeta));
    } else if (isInserting) {
      context.missing(_mabMiscMeta);
    }
    if (data.containsKey('mab_temp')) {
      context.handle(_mabTempMeta,
          mabTemp.isAcceptableOrUnknown(data['mab_temp']!, _mabTempMeta));
    } else if (isInserting) {
      context.missing(_mabTempMeta);
    }
    if (data.containsKey('tab_misc')) {
      context.handle(_tabMiscMeta,
          tabMisc.isAcceptableOrUnknown(data['tab_misc']!, _tabMiscMeta));
    } else if (isInserting) {
      context.missing(_tabMiscMeta);
    }
    if (data.containsKey('tab_temp')) {
      context.handle(_tabTempMeta,
          tabTemp.isAcceptableOrUnknown(data['tab_temp']!, _tabTempMeta));
    } else if (isInserting) {
      context.missing(_tabTempMeta);
    }
    if (data.containsKey('rab_misc')) {
      context.handle(_rabMiscMeta,
          rabMisc.isAcceptableOrUnknown(data['rab_misc']!, _rabMiscMeta));
    } else if (isInserting) {
      context.missing(_rabMiscMeta);
    }
    if (data.containsKey('rab_temp')) {
      context.handle(_rabTempMeta,
          rabTemp.isAcceptableOrUnknown(data['rab_temp']!, _rabTempMeta));
    } else if (isInserting) {
      context.missing(_rabTempMeta);
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
      eacArmor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}eac_armor'])!,
      eacDodger: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}eac_dodger'])!,
      eacNatural: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}eac_natural'])!,
      eacDeflect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}eac_deflect'])!,
      eacMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}eac_misc'])!,
      kacArmor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kac_armor'])!,
      kacDodger: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kac_dodger'])!,
      kacNatural: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kac_natural'])!,
      kacDeflect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kac_deflect'])!,
      kacMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kac_misc'])!,
      moveSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}move_speed'])!,
      flySpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fly_speed'])!,
      swimSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}swim_speed'])!,
      initMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}init_misc'])!,
      bab: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bab'])!,
      mabMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mab_misc'])!,
      mabTemp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mab_temp'])!,
      tabMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tab_misc'])!,
      tabTemp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tab_temp'])!,
      rabMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rab_misc'])!,
      rabTemp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rab_temp'])!,
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
  final int eacArmor;
  final int eacDodger;
  final int eacNatural;
  final int eacDeflect;
  final int eacMisc;
  final int kacArmor;
  final int kacDodger;
  final int kacNatural;
  final int kacDeflect;
  final int kacMisc;
  final int moveSpeed;
  final int flySpeed;
  final int swimSpeed;
  final int initMisc;
  final int bab;
  final int mabMisc;
  final int mabTemp;
  final int tabMisc;
  final int tabTemp;
  final int rabMisc;
  final int rabTemp;
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
      required this.damageLog,
      required this.eacArmor,
      required this.eacDodger,
      required this.eacNatural,
      required this.eacDeflect,
      required this.eacMisc,
      required this.kacArmor,
      required this.kacDodger,
      required this.kacNatural,
      required this.kacDeflect,
      required this.kacMisc,
      required this.moveSpeed,
      required this.flySpeed,
      required this.swimSpeed,
      required this.initMisc,
      required this.bab,
      required this.mabMisc,
      required this.mabTemp,
      required this.tabMisc,
      required this.tabTemp,
      required this.rabMisc,
      required this.rabTemp});
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
    map['eac_armor'] = Variable<int>(eacArmor);
    map['eac_dodger'] = Variable<int>(eacDodger);
    map['eac_natural'] = Variable<int>(eacNatural);
    map['eac_deflect'] = Variable<int>(eacDeflect);
    map['eac_misc'] = Variable<int>(eacMisc);
    map['kac_armor'] = Variable<int>(kacArmor);
    map['kac_dodger'] = Variable<int>(kacDodger);
    map['kac_natural'] = Variable<int>(kacNatural);
    map['kac_deflect'] = Variable<int>(kacDeflect);
    map['kac_misc'] = Variable<int>(kacMisc);
    map['move_speed'] = Variable<int>(moveSpeed);
    map['fly_speed'] = Variable<int>(flySpeed);
    map['swim_speed'] = Variable<int>(swimSpeed);
    map['init_misc'] = Variable<int>(initMisc);
    map['bab'] = Variable<int>(bab);
    map['mab_misc'] = Variable<int>(mabMisc);
    map['mab_temp'] = Variable<int>(mabTemp);
    map['tab_misc'] = Variable<int>(tabMisc);
    map['tab_temp'] = Variable<int>(tabTemp);
    map['rab_misc'] = Variable<int>(rabMisc);
    map['rab_temp'] = Variable<int>(rabTemp);
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
      eacArmor: Value(eacArmor),
      eacDodger: Value(eacDodger),
      eacNatural: Value(eacNatural),
      eacDeflect: Value(eacDeflect),
      eacMisc: Value(eacMisc),
      kacArmor: Value(kacArmor),
      kacDodger: Value(kacDodger),
      kacNatural: Value(kacNatural),
      kacDeflect: Value(kacDeflect),
      kacMisc: Value(kacMisc),
      moveSpeed: Value(moveSpeed),
      flySpeed: Value(flySpeed),
      swimSpeed: Value(swimSpeed),
      initMisc: Value(initMisc),
      bab: Value(bab),
      mabMisc: Value(mabMisc),
      mabTemp: Value(mabTemp),
      tabMisc: Value(tabMisc),
      tabTemp: Value(tabTemp),
      rabMisc: Value(rabMisc),
      rabTemp: Value(rabTemp),
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
      eacArmor: serializer.fromJson<int>(json['eacArmor']),
      eacDodger: serializer.fromJson<int>(json['eacDodger']),
      eacNatural: serializer.fromJson<int>(json['eacNatural']),
      eacDeflect: serializer.fromJson<int>(json['eacDeflect']),
      eacMisc: serializer.fromJson<int>(json['eacMisc']),
      kacArmor: serializer.fromJson<int>(json['kacArmor']),
      kacDodger: serializer.fromJson<int>(json['kacDodger']),
      kacNatural: serializer.fromJson<int>(json['kacNatural']),
      kacDeflect: serializer.fromJson<int>(json['kacDeflect']),
      kacMisc: serializer.fromJson<int>(json['kacMisc']),
      moveSpeed: serializer.fromJson<int>(json['moveSpeed']),
      flySpeed: serializer.fromJson<int>(json['flySpeed']),
      swimSpeed: serializer.fromJson<int>(json['swimSpeed']),
      initMisc: serializer.fromJson<int>(json['initMisc']),
      bab: serializer.fromJson<int>(json['bab']),
      mabMisc: serializer.fromJson<int>(json['mabMisc']),
      mabTemp: serializer.fromJson<int>(json['mabTemp']),
      tabMisc: serializer.fromJson<int>(json['tabMisc']),
      tabTemp: serializer.fromJson<int>(json['tabTemp']),
      rabMisc: serializer.fromJson<int>(json['rabMisc']),
      rabTemp: serializer.fromJson<int>(json['rabTemp']),
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
      'eacArmor': serializer.toJson<int>(eacArmor),
      'eacDodger': serializer.toJson<int>(eacDodger),
      'eacNatural': serializer.toJson<int>(eacNatural),
      'eacDeflect': serializer.toJson<int>(eacDeflect),
      'eacMisc': serializer.toJson<int>(eacMisc),
      'kacArmor': serializer.toJson<int>(kacArmor),
      'kacDodger': serializer.toJson<int>(kacDodger),
      'kacNatural': serializer.toJson<int>(kacNatural),
      'kacDeflect': serializer.toJson<int>(kacDeflect),
      'kacMisc': serializer.toJson<int>(kacMisc),
      'moveSpeed': serializer.toJson<int>(moveSpeed),
      'flySpeed': serializer.toJson<int>(flySpeed),
      'swimSpeed': serializer.toJson<int>(swimSpeed),
      'initMisc': serializer.toJson<int>(initMisc),
      'bab': serializer.toJson<int>(bab),
      'mabMisc': serializer.toJson<int>(mabMisc),
      'mabTemp': serializer.toJson<int>(mabTemp),
      'tabMisc': serializer.toJson<int>(tabMisc),
      'tabTemp': serializer.toJson<int>(tabTemp),
      'rabMisc': serializer.toJson<int>(rabMisc),
      'rabTemp': serializer.toJson<int>(rabTemp),
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
          String? damageLog,
          int? eacArmor,
          int? eacDodger,
          int? eacNatural,
          int? eacDeflect,
          int? eacMisc,
          int? kacArmor,
          int? kacDodger,
          int? kacNatural,
          int? kacDeflect,
          int? kacMisc,
          int? moveSpeed,
          int? flySpeed,
          int? swimSpeed,
          int? initMisc,
          int? bab,
          int? mabMisc,
          int? mabTemp,
          int? tabMisc,
          int? tabTemp,
          int? rabMisc,
          int? rabTemp}) =>
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
        eacArmor: eacArmor ?? this.eacArmor,
        eacDodger: eacDodger ?? this.eacDodger,
        eacNatural: eacNatural ?? this.eacNatural,
        eacDeflect: eacDeflect ?? this.eacDeflect,
        eacMisc: eacMisc ?? this.eacMisc,
        kacArmor: kacArmor ?? this.kacArmor,
        kacDodger: kacDodger ?? this.kacDodger,
        kacNatural: kacNatural ?? this.kacNatural,
        kacDeflect: kacDeflect ?? this.kacDeflect,
        kacMisc: kacMisc ?? this.kacMisc,
        moveSpeed: moveSpeed ?? this.moveSpeed,
        flySpeed: flySpeed ?? this.flySpeed,
        swimSpeed: swimSpeed ?? this.swimSpeed,
        initMisc: initMisc ?? this.initMisc,
        bab: bab ?? this.bab,
        mabMisc: mabMisc ?? this.mabMisc,
        mabTemp: mabTemp ?? this.mabTemp,
        tabMisc: tabMisc ?? this.tabMisc,
        tabTemp: tabTemp ?? this.tabTemp,
        rabMisc: rabMisc ?? this.rabMisc,
        rabTemp: rabTemp ?? this.rabTemp,
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
      eacArmor: data.eacArmor.present ? data.eacArmor.value : this.eacArmor,
      eacDodger: data.eacDodger.present ? data.eacDodger.value : this.eacDodger,
      eacNatural:
          data.eacNatural.present ? data.eacNatural.value : this.eacNatural,
      eacDeflect:
          data.eacDeflect.present ? data.eacDeflect.value : this.eacDeflect,
      eacMisc: data.eacMisc.present ? data.eacMisc.value : this.eacMisc,
      kacArmor: data.kacArmor.present ? data.kacArmor.value : this.kacArmor,
      kacDodger: data.kacDodger.present ? data.kacDodger.value : this.kacDodger,
      kacNatural:
          data.kacNatural.present ? data.kacNatural.value : this.kacNatural,
      kacDeflect:
          data.kacDeflect.present ? data.kacDeflect.value : this.kacDeflect,
      kacMisc: data.kacMisc.present ? data.kacMisc.value : this.kacMisc,
      moveSpeed: data.moveSpeed.present ? data.moveSpeed.value : this.moveSpeed,
      flySpeed: data.flySpeed.present ? data.flySpeed.value : this.flySpeed,
      swimSpeed: data.swimSpeed.present ? data.swimSpeed.value : this.swimSpeed,
      initMisc: data.initMisc.present ? data.initMisc.value : this.initMisc,
      bab: data.bab.present ? data.bab.value : this.bab,
      mabMisc: data.mabMisc.present ? data.mabMisc.value : this.mabMisc,
      mabTemp: data.mabTemp.present ? data.mabTemp.value : this.mabTemp,
      tabMisc: data.tabMisc.present ? data.tabMisc.value : this.tabMisc,
      tabTemp: data.tabTemp.present ? data.tabTemp.value : this.tabTemp,
      rabMisc: data.rabMisc.present ? data.rabMisc.value : this.rabMisc,
      rabTemp: data.rabTemp.present ? data.rabTemp.value : this.rabTemp,
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
          ..write('damageLog: $damageLog, ')
          ..write('eacArmor: $eacArmor, ')
          ..write('eacDodger: $eacDodger, ')
          ..write('eacNatural: $eacNatural, ')
          ..write('eacDeflect: $eacDeflect, ')
          ..write('eacMisc: $eacMisc, ')
          ..write('kacArmor: $kacArmor, ')
          ..write('kacDodger: $kacDodger, ')
          ..write('kacNatural: $kacNatural, ')
          ..write('kacDeflect: $kacDeflect, ')
          ..write('kacMisc: $kacMisc, ')
          ..write('moveSpeed: $moveSpeed, ')
          ..write('flySpeed: $flySpeed, ')
          ..write('swimSpeed: $swimSpeed, ')
          ..write('initMisc: $initMisc, ')
          ..write('bab: $bab, ')
          ..write('mabMisc: $mabMisc, ')
          ..write('mabTemp: $mabTemp, ')
          ..write('tabMisc: $tabMisc, ')
          ..write('tabTemp: $tabTemp, ')
          ..write('rabMisc: $rabMisc, ')
          ..write('rabTemp: $rabTemp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
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
        damageLog,
        eacArmor,
        eacDodger,
        eacNatural,
        eacDeflect,
        eacMisc,
        kacArmor,
        kacDodger,
        kacNatural,
        kacDeflect,
        kacMisc,
        moveSpeed,
        flySpeed,
        swimSpeed,
        initMisc,
        bab,
        mabMisc,
        mabTemp,
        tabMisc,
        tabTemp,
        rabMisc,
        rabTemp
      ]);
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
          other.damageLog == this.damageLog &&
          other.eacArmor == this.eacArmor &&
          other.eacDodger == this.eacDodger &&
          other.eacNatural == this.eacNatural &&
          other.eacDeflect == this.eacDeflect &&
          other.eacMisc == this.eacMisc &&
          other.kacArmor == this.kacArmor &&
          other.kacDodger == this.kacDodger &&
          other.kacNatural == this.kacNatural &&
          other.kacDeflect == this.kacDeflect &&
          other.kacMisc == this.kacMisc &&
          other.moveSpeed == this.moveSpeed &&
          other.flySpeed == this.flySpeed &&
          other.swimSpeed == this.swimSpeed &&
          other.initMisc == this.initMisc &&
          other.bab == this.bab &&
          other.mabMisc == this.mabMisc &&
          other.mabTemp == this.mabTemp &&
          other.tabMisc == this.tabMisc &&
          other.tabTemp == this.tabTemp &&
          other.rabMisc == this.rabMisc &&
          other.rabTemp == this.rabTemp);
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
  final Value<int> eacArmor;
  final Value<int> eacDodger;
  final Value<int> eacNatural;
  final Value<int> eacDeflect;
  final Value<int> eacMisc;
  final Value<int> kacArmor;
  final Value<int> kacDodger;
  final Value<int> kacNatural;
  final Value<int> kacDeflect;
  final Value<int> kacMisc;
  final Value<int> moveSpeed;
  final Value<int> flySpeed;
  final Value<int> swimSpeed;
  final Value<int> initMisc;
  final Value<int> bab;
  final Value<int> mabMisc;
  final Value<int> mabTemp;
  final Value<int> tabMisc;
  final Value<int> tabTemp;
  final Value<int> rabMisc;
  final Value<int> rabTemp;
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
    this.eacArmor = const Value.absent(),
    this.eacDodger = const Value.absent(),
    this.eacNatural = const Value.absent(),
    this.eacDeflect = const Value.absent(),
    this.eacMisc = const Value.absent(),
    this.kacArmor = const Value.absent(),
    this.kacDodger = const Value.absent(),
    this.kacNatural = const Value.absent(),
    this.kacDeflect = const Value.absent(),
    this.kacMisc = const Value.absent(),
    this.moveSpeed = const Value.absent(),
    this.flySpeed = const Value.absent(),
    this.swimSpeed = const Value.absent(),
    this.initMisc = const Value.absent(),
    this.bab = const Value.absent(),
    this.mabMisc = const Value.absent(),
    this.mabTemp = const Value.absent(),
    this.tabMisc = const Value.absent(),
    this.tabTemp = const Value.absent(),
    this.rabMisc = const Value.absent(),
    this.rabTemp = const Value.absent(),
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
    required int eacArmor,
    required int eacDodger,
    required int eacNatural,
    required int eacDeflect,
    required int eacMisc,
    required int kacArmor,
    required int kacDodger,
    required int kacNatural,
    required int kacDeflect,
    required int kacMisc,
    required int moveSpeed,
    required int flySpeed,
    required int swimSpeed,
    required int initMisc,
    required int bab,
    required int mabMisc,
    required int mabTemp,
    required int tabMisc,
    required int tabTemp,
    required int rabMisc,
    required int rabTemp,
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
        damageLog = Value(damageLog),
        eacArmor = Value(eacArmor),
        eacDodger = Value(eacDodger),
        eacNatural = Value(eacNatural),
        eacDeflect = Value(eacDeflect),
        eacMisc = Value(eacMisc),
        kacArmor = Value(kacArmor),
        kacDodger = Value(kacDodger),
        kacNatural = Value(kacNatural),
        kacDeflect = Value(kacDeflect),
        kacMisc = Value(kacMisc),
        moveSpeed = Value(moveSpeed),
        flySpeed = Value(flySpeed),
        swimSpeed = Value(swimSpeed),
        initMisc = Value(initMisc),
        bab = Value(bab),
        mabMisc = Value(mabMisc),
        mabTemp = Value(mabTemp),
        tabMisc = Value(tabMisc),
        tabTemp = Value(tabTemp),
        rabMisc = Value(rabMisc),
        rabTemp = Value(rabTemp);
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
    Expression<int>? eacArmor,
    Expression<int>? eacDodger,
    Expression<int>? eacNatural,
    Expression<int>? eacDeflect,
    Expression<int>? eacMisc,
    Expression<int>? kacArmor,
    Expression<int>? kacDodger,
    Expression<int>? kacNatural,
    Expression<int>? kacDeflect,
    Expression<int>? kacMisc,
    Expression<int>? moveSpeed,
    Expression<int>? flySpeed,
    Expression<int>? swimSpeed,
    Expression<int>? initMisc,
    Expression<int>? bab,
    Expression<int>? mabMisc,
    Expression<int>? mabTemp,
    Expression<int>? tabMisc,
    Expression<int>? tabTemp,
    Expression<int>? rabMisc,
    Expression<int>? rabTemp,
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
      if (eacArmor != null) 'eac_armor': eacArmor,
      if (eacDodger != null) 'eac_dodger': eacDodger,
      if (eacNatural != null) 'eac_natural': eacNatural,
      if (eacDeflect != null) 'eac_deflect': eacDeflect,
      if (eacMisc != null) 'eac_misc': eacMisc,
      if (kacArmor != null) 'kac_armor': kacArmor,
      if (kacDodger != null) 'kac_dodger': kacDodger,
      if (kacNatural != null) 'kac_natural': kacNatural,
      if (kacDeflect != null) 'kac_deflect': kacDeflect,
      if (kacMisc != null) 'kac_misc': kacMisc,
      if (moveSpeed != null) 'move_speed': moveSpeed,
      if (flySpeed != null) 'fly_speed': flySpeed,
      if (swimSpeed != null) 'swim_speed': swimSpeed,
      if (initMisc != null) 'init_misc': initMisc,
      if (bab != null) 'bab': bab,
      if (mabMisc != null) 'mab_misc': mabMisc,
      if (mabTemp != null) 'mab_temp': mabTemp,
      if (tabMisc != null) 'tab_misc': tabMisc,
      if (tabTemp != null) 'tab_temp': tabTemp,
      if (rabMisc != null) 'rab_misc': rabMisc,
      if (rabTemp != null) 'rab_temp': rabTemp,
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
      Value<String>? damageLog,
      Value<int>? eacArmor,
      Value<int>? eacDodger,
      Value<int>? eacNatural,
      Value<int>? eacDeflect,
      Value<int>? eacMisc,
      Value<int>? kacArmor,
      Value<int>? kacDodger,
      Value<int>? kacNatural,
      Value<int>? kacDeflect,
      Value<int>? kacMisc,
      Value<int>? moveSpeed,
      Value<int>? flySpeed,
      Value<int>? swimSpeed,
      Value<int>? initMisc,
      Value<int>? bab,
      Value<int>? mabMisc,
      Value<int>? mabTemp,
      Value<int>? tabMisc,
      Value<int>? tabTemp,
      Value<int>? rabMisc,
      Value<int>? rabTemp}) {
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
      eacArmor: eacArmor ?? this.eacArmor,
      eacDodger: eacDodger ?? this.eacDodger,
      eacNatural: eacNatural ?? this.eacNatural,
      eacDeflect: eacDeflect ?? this.eacDeflect,
      eacMisc: eacMisc ?? this.eacMisc,
      kacArmor: kacArmor ?? this.kacArmor,
      kacDodger: kacDodger ?? this.kacDodger,
      kacNatural: kacNatural ?? this.kacNatural,
      kacDeflect: kacDeflect ?? this.kacDeflect,
      kacMisc: kacMisc ?? this.kacMisc,
      moveSpeed: moveSpeed ?? this.moveSpeed,
      flySpeed: flySpeed ?? this.flySpeed,
      swimSpeed: swimSpeed ?? this.swimSpeed,
      initMisc: initMisc ?? this.initMisc,
      bab: bab ?? this.bab,
      mabMisc: mabMisc ?? this.mabMisc,
      mabTemp: mabTemp ?? this.mabTemp,
      tabMisc: tabMisc ?? this.tabMisc,
      tabTemp: tabTemp ?? this.tabTemp,
      rabMisc: rabMisc ?? this.rabMisc,
      rabTemp: rabTemp ?? this.rabTemp,
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
    if (eacArmor.present) {
      map['eac_armor'] = Variable<int>(eacArmor.value);
    }
    if (eacDodger.present) {
      map['eac_dodger'] = Variable<int>(eacDodger.value);
    }
    if (eacNatural.present) {
      map['eac_natural'] = Variable<int>(eacNatural.value);
    }
    if (eacDeflect.present) {
      map['eac_deflect'] = Variable<int>(eacDeflect.value);
    }
    if (eacMisc.present) {
      map['eac_misc'] = Variable<int>(eacMisc.value);
    }
    if (kacArmor.present) {
      map['kac_armor'] = Variable<int>(kacArmor.value);
    }
    if (kacDodger.present) {
      map['kac_dodger'] = Variable<int>(kacDodger.value);
    }
    if (kacNatural.present) {
      map['kac_natural'] = Variable<int>(kacNatural.value);
    }
    if (kacDeflect.present) {
      map['kac_deflect'] = Variable<int>(kacDeflect.value);
    }
    if (kacMisc.present) {
      map['kac_misc'] = Variable<int>(kacMisc.value);
    }
    if (moveSpeed.present) {
      map['move_speed'] = Variable<int>(moveSpeed.value);
    }
    if (flySpeed.present) {
      map['fly_speed'] = Variable<int>(flySpeed.value);
    }
    if (swimSpeed.present) {
      map['swim_speed'] = Variable<int>(swimSpeed.value);
    }
    if (initMisc.present) {
      map['init_misc'] = Variable<int>(initMisc.value);
    }
    if (bab.present) {
      map['bab'] = Variable<int>(bab.value);
    }
    if (mabMisc.present) {
      map['mab_misc'] = Variable<int>(mabMisc.value);
    }
    if (mabTemp.present) {
      map['mab_temp'] = Variable<int>(mabTemp.value);
    }
    if (tabMisc.present) {
      map['tab_misc'] = Variable<int>(tabMisc.value);
    }
    if (tabTemp.present) {
      map['tab_temp'] = Variable<int>(tabTemp.value);
    }
    if (rabMisc.present) {
      map['rab_misc'] = Variable<int>(rabMisc.value);
    }
    if (rabTemp.present) {
      map['rab_temp'] = Variable<int>(rabTemp.value);
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
          ..write('damageLog: $damageLog, ')
          ..write('eacArmor: $eacArmor, ')
          ..write('eacDodger: $eacDodger, ')
          ..write('eacNatural: $eacNatural, ')
          ..write('eacDeflect: $eacDeflect, ')
          ..write('eacMisc: $eacMisc, ')
          ..write('kacArmor: $kacArmor, ')
          ..write('kacDodger: $kacDodger, ')
          ..write('kacNatural: $kacNatural, ')
          ..write('kacDeflect: $kacDeflect, ')
          ..write('kacMisc: $kacMisc, ')
          ..write('moveSpeed: $moveSpeed, ')
          ..write('flySpeed: $flySpeed, ')
          ..write('swimSpeed: $swimSpeed, ')
          ..write('initMisc: $initMisc, ')
          ..write('bab: $bab, ')
          ..write('mabMisc: $mabMisc, ')
          ..write('mabTemp: $mabTemp, ')
          ..write('tabMisc: $tabMisc, ')
          ..write('tabTemp: $tabTemp, ')
          ..write('rabMisc: $rabMisc, ')
          ..write('rabTemp: $rabTemp')
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
  required int eacArmor,
  required int eacDodger,
  required int eacNatural,
  required int eacDeflect,
  required int eacMisc,
  required int kacArmor,
  required int kacDodger,
  required int kacNatural,
  required int kacDeflect,
  required int kacMisc,
  required int moveSpeed,
  required int flySpeed,
  required int swimSpeed,
  required int initMisc,
  required int bab,
  required int mabMisc,
  required int mabTemp,
  required int tabMisc,
  required int tabTemp,
  required int rabMisc,
  required int rabTemp,
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
  Value<int> eacArmor,
  Value<int> eacDodger,
  Value<int> eacNatural,
  Value<int> eacDeflect,
  Value<int> eacMisc,
  Value<int> kacArmor,
  Value<int> kacDodger,
  Value<int> kacNatural,
  Value<int> kacDeflect,
  Value<int> kacMisc,
  Value<int> moveSpeed,
  Value<int> flySpeed,
  Value<int> swimSpeed,
  Value<int> initMisc,
  Value<int> bab,
  Value<int> mabMisc,
  Value<int> mabTemp,
  Value<int> tabMisc,
  Value<int> tabTemp,
  Value<int> rabMisc,
  Value<int> rabTemp,
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

  ColumnFilters<int> get eacArmor => $composableBuilder(
      column: $table.eacArmor, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get eacDodger => $composableBuilder(
      column: $table.eacDodger, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get eacNatural => $composableBuilder(
      column: $table.eacNatural, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get eacDeflect => $composableBuilder(
      column: $table.eacDeflect, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get eacMisc => $composableBuilder(
      column: $table.eacMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kacArmor => $composableBuilder(
      column: $table.kacArmor, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kacDodger => $composableBuilder(
      column: $table.kacDodger, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kacNatural => $composableBuilder(
      column: $table.kacNatural, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kacDeflect => $composableBuilder(
      column: $table.kacDeflect, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kacMisc => $composableBuilder(
      column: $table.kacMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get moveSpeed => $composableBuilder(
      column: $table.moveSpeed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get flySpeed => $composableBuilder(
      column: $table.flySpeed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get swimSpeed => $composableBuilder(
      column: $table.swimSpeed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get initMisc => $composableBuilder(
      column: $table.initMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bab => $composableBuilder(
      column: $table.bab, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get mabMisc => $composableBuilder(
      column: $table.mabMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get mabTemp => $composableBuilder(
      column: $table.mabTemp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tabMisc => $composableBuilder(
      column: $table.tabMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tabTemp => $composableBuilder(
      column: $table.tabTemp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rabMisc => $composableBuilder(
      column: $table.rabMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rabTemp => $composableBuilder(
      column: $table.rabTemp, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<int> get eacArmor => $composableBuilder(
      column: $table.eacArmor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get eacDodger => $composableBuilder(
      column: $table.eacDodger, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get eacNatural => $composableBuilder(
      column: $table.eacNatural, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get eacDeflect => $composableBuilder(
      column: $table.eacDeflect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get eacMisc => $composableBuilder(
      column: $table.eacMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kacArmor => $composableBuilder(
      column: $table.kacArmor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kacDodger => $composableBuilder(
      column: $table.kacDodger, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kacNatural => $composableBuilder(
      column: $table.kacNatural, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kacDeflect => $composableBuilder(
      column: $table.kacDeflect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kacMisc => $composableBuilder(
      column: $table.kacMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get moveSpeed => $composableBuilder(
      column: $table.moveSpeed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get flySpeed => $composableBuilder(
      column: $table.flySpeed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get swimSpeed => $composableBuilder(
      column: $table.swimSpeed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get initMisc => $composableBuilder(
      column: $table.initMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bab => $composableBuilder(
      column: $table.bab, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mabMisc => $composableBuilder(
      column: $table.mabMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mabTemp => $composableBuilder(
      column: $table.mabTemp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tabMisc => $composableBuilder(
      column: $table.tabMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tabTemp => $composableBuilder(
      column: $table.tabTemp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rabMisc => $composableBuilder(
      column: $table.rabMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rabTemp => $composableBuilder(
      column: $table.rabTemp, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get eacArmor =>
      $composableBuilder(column: $table.eacArmor, builder: (column) => column);

  GeneratedColumn<int> get eacDodger =>
      $composableBuilder(column: $table.eacDodger, builder: (column) => column);

  GeneratedColumn<int> get eacNatural => $composableBuilder(
      column: $table.eacNatural, builder: (column) => column);

  GeneratedColumn<int> get eacDeflect => $composableBuilder(
      column: $table.eacDeflect, builder: (column) => column);

  GeneratedColumn<int> get eacMisc =>
      $composableBuilder(column: $table.eacMisc, builder: (column) => column);

  GeneratedColumn<int> get kacArmor =>
      $composableBuilder(column: $table.kacArmor, builder: (column) => column);

  GeneratedColumn<int> get kacDodger =>
      $composableBuilder(column: $table.kacDodger, builder: (column) => column);

  GeneratedColumn<int> get kacNatural => $composableBuilder(
      column: $table.kacNatural, builder: (column) => column);

  GeneratedColumn<int> get kacDeflect => $composableBuilder(
      column: $table.kacDeflect, builder: (column) => column);

  GeneratedColumn<int> get kacMisc =>
      $composableBuilder(column: $table.kacMisc, builder: (column) => column);

  GeneratedColumn<int> get moveSpeed =>
      $composableBuilder(column: $table.moveSpeed, builder: (column) => column);

  GeneratedColumn<int> get flySpeed =>
      $composableBuilder(column: $table.flySpeed, builder: (column) => column);

  GeneratedColumn<int> get swimSpeed =>
      $composableBuilder(column: $table.swimSpeed, builder: (column) => column);

  GeneratedColumn<int> get initMisc =>
      $composableBuilder(column: $table.initMisc, builder: (column) => column);

  GeneratedColumn<int> get bab =>
      $composableBuilder(column: $table.bab, builder: (column) => column);

  GeneratedColumn<int> get mabMisc =>
      $composableBuilder(column: $table.mabMisc, builder: (column) => column);

  GeneratedColumn<int> get mabTemp =>
      $composableBuilder(column: $table.mabTemp, builder: (column) => column);

  GeneratedColumn<int> get tabMisc =>
      $composableBuilder(column: $table.tabMisc, builder: (column) => column);

  GeneratedColumn<int> get tabTemp =>
      $composableBuilder(column: $table.tabTemp, builder: (column) => column);

  GeneratedColumn<int> get rabMisc =>
      $composableBuilder(column: $table.rabMisc, builder: (column) => column);

  GeneratedColumn<int> get rabTemp =>
      $composableBuilder(column: $table.rabTemp, builder: (column) => column);
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
            Value<int> eacArmor = const Value.absent(),
            Value<int> eacDodger = const Value.absent(),
            Value<int> eacNatural = const Value.absent(),
            Value<int> eacDeflect = const Value.absent(),
            Value<int> eacMisc = const Value.absent(),
            Value<int> kacArmor = const Value.absent(),
            Value<int> kacDodger = const Value.absent(),
            Value<int> kacNatural = const Value.absent(),
            Value<int> kacDeflect = const Value.absent(),
            Value<int> kacMisc = const Value.absent(),
            Value<int> moveSpeed = const Value.absent(),
            Value<int> flySpeed = const Value.absent(),
            Value<int> swimSpeed = const Value.absent(),
            Value<int> initMisc = const Value.absent(),
            Value<int> bab = const Value.absent(),
            Value<int> mabMisc = const Value.absent(),
            Value<int> mabTemp = const Value.absent(),
            Value<int> tabMisc = const Value.absent(),
            Value<int> tabTemp = const Value.absent(),
            Value<int> rabMisc = const Value.absent(),
            Value<int> rabTemp = const Value.absent(),
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
            eacArmor: eacArmor,
            eacDodger: eacDodger,
            eacNatural: eacNatural,
            eacDeflect: eacDeflect,
            eacMisc: eacMisc,
            kacArmor: kacArmor,
            kacDodger: kacDodger,
            kacNatural: kacNatural,
            kacDeflect: kacDeflect,
            kacMisc: kacMisc,
            moveSpeed: moveSpeed,
            flySpeed: flySpeed,
            swimSpeed: swimSpeed,
            initMisc: initMisc,
            bab: bab,
            mabMisc: mabMisc,
            mabTemp: mabTemp,
            tabMisc: tabMisc,
            tabTemp: tabTemp,
            rabMisc: rabMisc,
            rabTemp: rabTemp,
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
            required int eacArmor,
            required int eacDodger,
            required int eacNatural,
            required int eacDeflect,
            required int eacMisc,
            required int kacArmor,
            required int kacDodger,
            required int kacNatural,
            required int kacDeflect,
            required int kacMisc,
            required int moveSpeed,
            required int flySpeed,
            required int swimSpeed,
            required int initMisc,
            required int bab,
            required int mabMisc,
            required int mabTemp,
            required int tabMisc,
            required int tabTemp,
            required int rabMisc,
            required int rabTemp,
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
            eacArmor: eacArmor,
            eacDodger: eacDodger,
            eacNatural: eacNatural,
            eacDeflect: eacDeflect,
            eacMisc: eacMisc,
            kacArmor: kacArmor,
            kacDodger: kacDodger,
            kacNatural: kacNatural,
            kacDeflect: kacDeflect,
            kacMisc: kacMisc,
            moveSpeed: moveSpeed,
            flySpeed: flySpeed,
            swimSpeed: swimSpeed,
            initMisc: initMisc,
            bab: bab,
            mabMisc: mabMisc,
            mabTemp: mabTemp,
            tabMisc: tabMisc,
            tabTemp: tabTemp,
            rabMisc: rabMisc,
            rabTemp: rabTemp,
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
