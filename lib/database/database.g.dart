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
  static const VerificationMeta _strengthTmpMeta =
      const VerificationMeta('strengthTmp');
  @override
  late final GeneratedColumn<int> strengthTmp = GeneratedColumn<int>(
      'strength_tmp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dexterityMeta =
      const VerificationMeta('dexterity');
  @override
  late final GeneratedColumn<int> dexterity = GeneratedColumn<int>(
      'dexterity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dexterityTmpMeta =
      const VerificationMeta('dexterityTmp');
  @override
  late final GeneratedColumn<int> dexterityTmp = GeneratedColumn<int>(
      'dexterity_tmp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _constitutionMeta =
      const VerificationMeta('constitution');
  @override
  late final GeneratedColumn<int> constitution = GeneratedColumn<int>(
      'constitution', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _constitutionTmpMeta =
      const VerificationMeta('constitutionTmp');
  @override
  late final GeneratedColumn<int> constitutionTmp = GeneratedColumn<int>(
      'constitution_tmp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intelligenceMeta =
      const VerificationMeta('intelligence');
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
      'intelligence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intelligenceTmpMeta =
      const VerificationMeta('intelligenceTmp');
  @override
  late final GeneratedColumn<int> intelligenceTmp = GeneratedColumn<int>(
      'intelligence_tmp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wisdomMeta = const VerificationMeta('wisdom');
  @override
  late final GeneratedColumn<int> wisdom = GeneratedColumn<int>(
      'wisdom', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _wisdomTmpMeta =
      const VerificationMeta('wisdomTmp');
  @override
  late final GeneratedColumn<int> wisdomTmp = GeneratedColumn<int>(
      'wisdom_tmp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _charismaMeta =
      const VerificationMeta('charisma');
  @override
  late final GeneratedColumn<int> charisma = GeneratedColumn<int>(
      'charisma', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _charismaTmpMeta =
      const VerificationMeta('charismaTmp');
  @override
  late final GeneratedColumn<int> charismaTmp = GeneratedColumn<int>(
      'charisma_tmp', aliasedName, false,
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
  static const VerificationMeta _fortBaseMeta =
      const VerificationMeta('fortBase');
  @override
  late final GeneratedColumn<int> fortBase = GeneratedColumn<int>(
      'fort_base', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fortMagicMeta =
      const VerificationMeta('fortMagic');
  @override
  late final GeneratedColumn<int> fortMagic = GeneratedColumn<int>(
      'fort_magic', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fortMiscMeta =
      const VerificationMeta('fortMisc');
  @override
  late final GeneratedColumn<int> fortMisc = GeneratedColumn<int>(
      'fort_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fortTempMeta =
      const VerificationMeta('fortTemp');
  @override
  late final GeneratedColumn<int> fortTemp = GeneratedColumn<int>(
      'fort_temp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _refBaseMeta =
      const VerificationMeta('refBase');
  @override
  late final GeneratedColumn<int> refBase = GeneratedColumn<int>(
      'ref_base', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _refMagicMeta =
      const VerificationMeta('refMagic');
  @override
  late final GeneratedColumn<int> refMagic = GeneratedColumn<int>(
      'ref_magic', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _refMiscMeta =
      const VerificationMeta('refMisc');
  @override
  late final GeneratedColumn<int> refMisc = GeneratedColumn<int>(
      'ref_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _refTempMeta =
      const VerificationMeta('refTemp');
  @override
  late final GeneratedColumn<int> refTemp = GeneratedColumn<int>(
      'ref_temp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _willBaseMeta =
      const VerificationMeta('willBase');
  @override
  late final GeneratedColumn<int> willBase = GeneratedColumn<int>(
      'will_base', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _willMagicMeta =
      const VerificationMeta('willMagic');
  @override
  late final GeneratedColumn<int> willMagic = GeneratedColumn<int>(
      'will_magic', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _willMiscMeta =
      const VerificationMeta('willMisc');
  @override
  late final GeneratedColumn<int> willMisc = GeneratedColumn<int>(
      'will_misc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _willTempMeta =
      const VerificationMeta('willTemp');
  @override
  late final GeneratedColumn<int> willTemp = GeneratedColumn<int>(
      'will_temp', aliasedName, false,
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
        strengthTmp,
        dexterity,
        dexterityTmp,
        constitution,
        constitutionTmp,
        intelligence,
        intelligenceTmp,
        wisdom,
        wisdomTmp,
        charisma,
        charismaTmp,
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
        rabTemp,
        fortBase,
        fortMagic,
        fortMisc,
        fortTemp,
        refBase,
        refMagic,
        refMisc,
        refTemp,
        willBase,
        willMagic,
        willMisc,
        willTemp
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
    if (data.containsKey('strength_tmp')) {
      context.handle(
          _strengthTmpMeta,
          strengthTmp.isAcceptableOrUnknown(
              data['strength_tmp']!, _strengthTmpMeta));
    } else if (isInserting) {
      context.missing(_strengthTmpMeta);
    }
    if (data.containsKey('dexterity')) {
      context.handle(_dexterityMeta,
          dexterity.isAcceptableOrUnknown(data['dexterity']!, _dexterityMeta));
    } else if (isInserting) {
      context.missing(_dexterityMeta);
    }
    if (data.containsKey('dexterity_tmp')) {
      context.handle(
          _dexterityTmpMeta,
          dexterityTmp.isAcceptableOrUnknown(
              data['dexterity_tmp']!, _dexterityTmpMeta));
    } else if (isInserting) {
      context.missing(_dexterityTmpMeta);
    }
    if (data.containsKey('constitution')) {
      context.handle(
          _constitutionMeta,
          constitution.isAcceptableOrUnknown(
              data['constitution']!, _constitutionMeta));
    } else if (isInserting) {
      context.missing(_constitutionMeta);
    }
    if (data.containsKey('constitution_tmp')) {
      context.handle(
          _constitutionTmpMeta,
          constitutionTmp.isAcceptableOrUnknown(
              data['constitution_tmp']!, _constitutionTmpMeta));
    } else if (isInserting) {
      context.missing(_constitutionTmpMeta);
    }
    if (data.containsKey('intelligence')) {
      context.handle(
          _intelligenceMeta,
          intelligence.isAcceptableOrUnknown(
              data['intelligence']!, _intelligenceMeta));
    } else if (isInserting) {
      context.missing(_intelligenceMeta);
    }
    if (data.containsKey('intelligence_tmp')) {
      context.handle(
          _intelligenceTmpMeta,
          intelligenceTmp.isAcceptableOrUnknown(
              data['intelligence_tmp']!, _intelligenceTmpMeta));
    } else if (isInserting) {
      context.missing(_intelligenceTmpMeta);
    }
    if (data.containsKey('wisdom')) {
      context.handle(_wisdomMeta,
          wisdom.isAcceptableOrUnknown(data['wisdom']!, _wisdomMeta));
    } else if (isInserting) {
      context.missing(_wisdomMeta);
    }
    if (data.containsKey('wisdom_tmp')) {
      context.handle(_wisdomTmpMeta,
          wisdomTmp.isAcceptableOrUnknown(data['wisdom_tmp']!, _wisdomTmpMeta));
    } else if (isInserting) {
      context.missing(_wisdomTmpMeta);
    }
    if (data.containsKey('charisma')) {
      context.handle(_charismaMeta,
          charisma.isAcceptableOrUnknown(data['charisma']!, _charismaMeta));
    } else if (isInserting) {
      context.missing(_charismaMeta);
    }
    if (data.containsKey('charisma_tmp')) {
      context.handle(
          _charismaTmpMeta,
          charismaTmp.isAcceptableOrUnknown(
              data['charisma_tmp']!, _charismaTmpMeta));
    } else if (isInserting) {
      context.missing(_charismaTmpMeta);
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
    if (data.containsKey('fort_base')) {
      context.handle(_fortBaseMeta,
          fortBase.isAcceptableOrUnknown(data['fort_base']!, _fortBaseMeta));
    } else if (isInserting) {
      context.missing(_fortBaseMeta);
    }
    if (data.containsKey('fort_magic')) {
      context.handle(_fortMagicMeta,
          fortMagic.isAcceptableOrUnknown(data['fort_magic']!, _fortMagicMeta));
    } else if (isInserting) {
      context.missing(_fortMagicMeta);
    }
    if (data.containsKey('fort_misc')) {
      context.handle(_fortMiscMeta,
          fortMisc.isAcceptableOrUnknown(data['fort_misc']!, _fortMiscMeta));
    } else if (isInserting) {
      context.missing(_fortMiscMeta);
    }
    if (data.containsKey('fort_temp')) {
      context.handle(_fortTempMeta,
          fortTemp.isAcceptableOrUnknown(data['fort_temp']!, _fortTempMeta));
    } else if (isInserting) {
      context.missing(_fortTempMeta);
    }
    if (data.containsKey('ref_base')) {
      context.handle(_refBaseMeta,
          refBase.isAcceptableOrUnknown(data['ref_base']!, _refBaseMeta));
    } else if (isInserting) {
      context.missing(_refBaseMeta);
    }
    if (data.containsKey('ref_magic')) {
      context.handle(_refMagicMeta,
          refMagic.isAcceptableOrUnknown(data['ref_magic']!, _refMagicMeta));
    } else if (isInserting) {
      context.missing(_refMagicMeta);
    }
    if (data.containsKey('ref_misc')) {
      context.handle(_refMiscMeta,
          refMisc.isAcceptableOrUnknown(data['ref_misc']!, _refMiscMeta));
    } else if (isInserting) {
      context.missing(_refMiscMeta);
    }
    if (data.containsKey('ref_temp')) {
      context.handle(_refTempMeta,
          refTemp.isAcceptableOrUnknown(data['ref_temp']!, _refTempMeta));
    } else if (isInserting) {
      context.missing(_refTempMeta);
    }
    if (data.containsKey('will_base')) {
      context.handle(_willBaseMeta,
          willBase.isAcceptableOrUnknown(data['will_base']!, _willBaseMeta));
    } else if (isInserting) {
      context.missing(_willBaseMeta);
    }
    if (data.containsKey('will_magic')) {
      context.handle(_willMagicMeta,
          willMagic.isAcceptableOrUnknown(data['will_magic']!, _willMagicMeta));
    } else if (isInserting) {
      context.missing(_willMagicMeta);
    }
    if (data.containsKey('will_misc')) {
      context.handle(_willMiscMeta,
          willMisc.isAcceptableOrUnknown(data['will_misc']!, _willMiscMeta));
    } else if (isInserting) {
      context.missing(_willMiscMeta);
    }
    if (data.containsKey('will_temp')) {
      context.handle(_willTempMeta,
          willTemp.isAcceptableOrUnknown(data['will_temp']!, _willTempMeta));
    } else if (isInserting) {
      context.missing(_willTempMeta);
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
      strengthTmp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}strength_tmp'])!,
      dexterity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dexterity'])!,
      dexterityTmp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dexterity_tmp'])!,
      constitution: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}constitution'])!,
      constitutionTmp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}constitution_tmp'])!,
      intelligence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intelligence'])!,
      intelligenceTmp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}intelligence_tmp'])!,
      wisdom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wisdom'])!,
      wisdomTmp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wisdom_tmp'])!,
      charisma: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charisma'])!,
      charismaTmp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charisma_tmp'])!,
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
      fortBase: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fort_base'])!,
      fortMagic: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fort_magic'])!,
      fortMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fort_misc'])!,
      fortTemp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fort_temp'])!,
      refBase: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_base'])!,
      refMagic: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_magic'])!,
      refMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_misc'])!,
      refTemp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ref_temp'])!,
      willBase: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}will_base'])!,
      willMagic: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}will_magic'])!,
      willMisc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}will_misc'])!,
      willTemp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}will_temp'])!,
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
  final int strengthTmp;
  final int dexterity;
  final int dexterityTmp;
  final int constitution;
  final int constitutionTmp;
  final int intelligence;
  final int intelligenceTmp;
  final int wisdom;
  final int wisdomTmp;
  final int charisma;
  final int charismaTmp;
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
  final int fortBase;
  final int fortMagic;
  final int fortMisc;
  final int fortTemp;
  final int refBase;
  final int refMagic;
  final int refMisc;
  final int refTemp;
  final int willBase;
  final int willMagic;
  final int willMisc;
  final int willTemp;
  const TableCharacterData(
      {required this.id,
      required this.charName,
      required this.charClass,
      required this.lvl,
      required this.race,
      required this.alignment,
      required this.size,
      required this.strength,
      required this.strengthTmp,
      required this.dexterity,
      required this.dexterityTmp,
      required this.constitution,
      required this.constitutionTmp,
      required this.intelligence,
      required this.intelligenceTmp,
      required this.wisdom,
      required this.wisdomTmp,
      required this.charisma,
      required this.charismaTmp,
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
      required this.rabTemp,
      required this.fortBase,
      required this.fortMagic,
      required this.fortMisc,
      required this.fortTemp,
      required this.refBase,
      required this.refMagic,
      required this.refMisc,
      required this.refTemp,
      required this.willBase,
      required this.willMagic,
      required this.willMisc,
      required this.willTemp});
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
    map['strength_tmp'] = Variable<int>(strengthTmp);
    map['dexterity'] = Variable<int>(dexterity);
    map['dexterity_tmp'] = Variable<int>(dexterityTmp);
    map['constitution'] = Variable<int>(constitution);
    map['constitution_tmp'] = Variable<int>(constitutionTmp);
    map['intelligence'] = Variable<int>(intelligence);
    map['intelligence_tmp'] = Variable<int>(intelligenceTmp);
    map['wisdom'] = Variable<int>(wisdom);
    map['wisdom_tmp'] = Variable<int>(wisdomTmp);
    map['charisma'] = Variable<int>(charisma);
    map['charisma_tmp'] = Variable<int>(charismaTmp);
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
    map['fort_base'] = Variable<int>(fortBase);
    map['fort_magic'] = Variable<int>(fortMagic);
    map['fort_misc'] = Variable<int>(fortMisc);
    map['fort_temp'] = Variable<int>(fortTemp);
    map['ref_base'] = Variable<int>(refBase);
    map['ref_magic'] = Variable<int>(refMagic);
    map['ref_misc'] = Variable<int>(refMisc);
    map['ref_temp'] = Variable<int>(refTemp);
    map['will_base'] = Variable<int>(willBase);
    map['will_magic'] = Variable<int>(willMagic);
    map['will_misc'] = Variable<int>(willMisc);
    map['will_temp'] = Variable<int>(willTemp);
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
      strengthTmp: Value(strengthTmp),
      dexterity: Value(dexterity),
      dexterityTmp: Value(dexterityTmp),
      constitution: Value(constitution),
      constitutionTmp: Value(constitutionTmp),
      intelligence: Value(intelligence),
      intelligenceTmp: Value(intelligenceTmp),
      wisdom: Value(wisdom),
      wisdomTmp: Value(wisdomTmp),
      charisma: Value(charisma),
      charismaTmp: Value(charismaTmp),
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
      fortBase: Value(fortBase),
      fortMagic: Value(fortMagic),
      fortMisc: Value(fortMisc),
      fortTemp: Value(fortTemp),
      refBase: Value(refBase),
      refMagic: Value(refMagic),
      refMisc: Value(refMisc),
      refTemp: Value(refTemp),
      willBase: Value(willBase),
      willMagic: Value(willMagic),
      willMisc: Value(willMisc),
      willTemp: Value(willTemp),
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
      strengthTmp: serializer.fromJson<int>(json['strengthTmp']),
      dexterity: serializer.fromJson<int>(json['dexterity']),
      dexterityTmp: serializer.fromJson<int>(json['dexterityTmp']),
      constitution: serializer.fromJson<int>(json['constitution']),
      constitutionTmp: serializer.fromJson<int>(json['constitutionTmp']),
      intelligence: serializer.fromJson<int>(json['intelligence']),
      intelligenceTmp: serializer.fromJson<int>(json['intelligenceTmp']),
      wisdom: serializer.fromJson<int>(json['wisdom']),
      wisdomTmp: serializer.fromJson<int>(json['wisdomTmp']),
      charisma: serializer.fromJson<int>(json['charisma']),
      charismaTmp: serializer.fromJson<int>(json['charismaTmp']),
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
      fortBase: serializer.fromJson<int>(json['fortBase']),
      fortMagic: serializer.fromJson<int>(json['fortMagic']),
      fortMisc: serializer.fromJson<int>(json['fortMisc']),
      fortTemp: serializer.fromJson<int>(json['fortTemp']),
      refBase: serializer.fromJson<int>(json['refBase']),
      refMagic: serializer.fromJson<int>(json['refMagic']),
      refMisc: serializer.fromJson<int>(json['refMisc']),
      refTemp: serializer.fromJson<int>(json['refTemp']),
      willBase: serializer.fromJson<int>(json['willBase']),
      willMagic: serializer.fromJson<int>(json['willMagic']),
      willMisc: serializer.fromJson<int>(json['willMisc']),
      willTemp: serializer.fromJson<int>(json['willTemp']),
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
      'strengthTmp': serializer.toJson<int>(strengthTmp),
      'dexterity': serializer.toJson<int>(dexterity),
      'dexterityTmp': serializer.toJson<int>(dexterityTmp),
      'constitution': serializer.toJson<int>(constitution),
      'constitutionTmp': serializer.toJson<int>(constitutionTmp),
      'intelligence': serializer.toJson<int>(intelligence),
      'intelligenceTmp': serializer.toJson<int>(intelligenceTmp),
      'wisdom': serializer.toJson<int>(wisdom),
      'wisdomTmp': serializer.toJson<int>(wisdomTmp),
      'charisma': serializer.toJson<int>(charisma),
      'charismaTmp': serializer.toJson<int>(charismaTmp),
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
      'fortBase': serializer.toJson<int>(fortBase),
      'fortMagic': serializer.toJson<int>(fortMagic),
      'fortMisc': serializer.toJson<int>(fortMisc),
      'fortTemp': serializer.toJson<int>(fortTemp),
      'refBase': serializer.toJson<int>(refBase),
      'refMagic': serializer.toJson<int>(refMagic),
      'refMisc': serializer.toJson<int>(refMisc),
      'refTemp': serializer.toJson<int>(refTemp),
      'willBase': serializer.toJson<int>(willBase),
      'willMagic': serializer.toJson<int>(willMagic),
      'willMisc': serializer.toJson<int>(willMisc),
      'willTemp': serializer.toJson<int>(willTemp),
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
          int? strengthTmp,
          int? dexterity,
          int? dexterityTmp,
          int? constitution,
          int? constitutionTmp,
          int? intelligence,
          int? intelligenceTmp,
          int? wisdom,
          int? wisdomTmp,
          int? charisma,
          int? charismaTmp,
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
          int? rabTemp,
          int? fortBase,
          int? fortMagic,
          int? fortMisc,
          int? fortTemp,
          int? refBase,
          int? refMagic,
          int? refMisc,
          int? refTemp,
          int? willBase,
          int? willMagic,
          int? willMisc,
          int? willTemp}) =>
      TableCharacterData(
        id: id ?? this.id,
        charName: charName ?? this.charName,
        charClass: charClass ?? this.charClass,
        lvl: lvl ?? this.lvl,
        race: race ?? this.race,
        alignment: alignment ?? this.alignment,
        size: size ?? this.size,
        strength: strength ?? this.strength,
        strengthTmp: strengthTmp ?? this.strengthTmp,
        dexterity: dexterity ?? this.dexterity,
        dexterityTmp: dexterityTmp ?? this.dexterityTmp,
        constitution: constitution ?? this.constitution,
        constitutionTmp: constitutionTmp ?? this.constitutionTmp,
        intelligence: intelligence ?? this.intelligence,
        intelligenceTmp: intelligenceTmp ?? this.intelligenceTmp,
        wisdom: wisdom ?? this.wisdom,
        wisdomTmp: wisdomTmp ?? this.wisdomTmp,
        charisma: charisma ?? this.charisma,
        charismaTmp: charismaTmp ?? this.charismaTmp,
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
        fortBase: fortBase ?? this.fortBase,
        fortMagic: fortMagic ?? this.fortMagic,
        fortMisc: fortMisc ?? this.fortMisc,
        fortTemp: fortTemp ?? this.fortTemp,
        refBase: refBase ?? this.refBase,
        refMagic: refMagic ?? this.refMagic,
        refMisc: refMisc ?? this.refMisc,
        refTemp: refTemp ?? this.refTemp,
        willBase: willBase ?? this.willBase,
        willMagic: willMagic ?? this.willMagic,
        willMisc: willMisc ?? this.willMisc,
        willTemp: willTemp ?? this.willTemp,
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
      strengthTmp:
          data.strengthTmp.present ? data.strengthTmp.value : this.strengthTmp,
      dexterity: data.dexterity.present ? data.dexterity.value : this.dexterity,
      dexterityTmp: data.dexterityTmp.present
          ? data.dexterityTmp.value
          : this.dexterityTmp,
      constitution: data.constitution.present
          ? data.constitution.value
          : this.constitution,
      constitutionTmp: data.constitutionTmp.present
          ? data.constitutionTmp.value
          : this.constitutionTmp,
      intelligence: data.intelligence.present
          ? data.intelligence.value
          : this.intelligence,
      intelligenceTmp: data.intelligenceTmp.present
          ? data.intelligenceTmp.value
          : this.intelligenceTmp,
      wisdom: data.wisdom.present ? data.wisdom.value : this.wisdom,
      wisdomTmp: data.wisdomTmp.present ? data.wisdomTmp.value : this.wisdomTmp,
      charisma: data.charisma.present ? data.charisma.value : this.charisma,
      charismaTmp:
          data.charismaTmp.present ? data.charismaTmp.value : this.charismaTmp,
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
      fortBase: data.fortBase.present ? data.fortBase.value : this.fortBase,
      fortMagic: data.fortMagic.present ? data.fortMagic.value : this.fortMagic,
      fortMisc: data.fortMisc.present ? data.fortMisc.value : this.fortMisc,
      fortTemp: data.fortTemp.present ? data.fortTemp.value : this.fortTemp,
      refBase: data.refBase.present ? data.refBase.value : this.refBase,
      refMagic: data.refMagic.present ? data.refMagic.value : this.refMagic,
      refMisc: data.refMisc.present ? data.refMisc.value : this.refMisc,
      refTemp: data.refTemp.present ? data.refTemp.value : this.refTemp,
      willBase: data.willBase.present ? data.willBase.value : this.willBase,
      willMagic: data.willMagic.present ? data.willMagic.value : this.willMagic,
      willMisc: data.willMisc.present ? data.willMisc.value : this.willMisc,
      willTemp: data.willTemp.present ? data.willTemp.value : this.willTemp,
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
          ..write('strengthTmp: $strengthTmp, ')
          ..write('dexterity: $dexterity, ')
          ..write('dexterityTmp: $dexterityTmp, ')
          ..write('constitution: $constitution, ')
          ..write('constitutionTmp: $constitutionTmp, ')
          ..write('intelligence: $intelligence, ')
          ..write('intelligenceTmp: $intelligenceTmp, ')
          ..write('wisdom: $wisdom, ')
          ..write('wisdomTmp: $wisdomTmp, ')
          ..write('charisma: $charisma, ')
          ..write('charismaTmp: $charismaTmp, ')
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
          ..write('rabTemp: $rabTemp, ')
          ..write('fortBase: $fortBase, ')
          ..write('fortMagic: $fortMagic, ')
          ..write('fortMisc: $fortMisc, ')
          ..write('fortTemp: $fortTemp, ')
          ..write('refBase: $refBase, ')
          ..write('refMagic: $refMagic, ')
          ..write('refMisc: $refMisc, ')
          ..write('refTemp: $refTemp, ')
          ..write('willBase: $willBase, ')
          ..write('willMagic: $willMagic, ')
          ..write('willMisc: $willMisc, ')
          ..write('willTemp: $willTemp')
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
        strengthTmp,
        dexterity,
        dexterityTmp,
        constitution,
        constitutionTmp,
        intelligence,
        intelligenceTmp,
        wisdom,
        wisdomTmp,
        charisma,
        charismaTmp,
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
        rabTemp,
        fortBase,
        fortMagic,
        fortMisc,
        fortTemp,
        refBase,
        refMagic,
        refMisc,
        refTemp,
        willBase,
        willMagic,
        willMisc,
        willTemp
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
          other.strengthTmp == this.strengthTmp &&
          other.dexterity == this.dexterity &&
          other.dexterityTmp == this.dexterityTmp &&
          other.constitution == this.constitution &&
          other.constitutionTmp == this.constitutionTmp &&
          other.intelligence == this.intelligence &&
          other.intelligenceTmp == this.intelligenceTmp &&
          other.wisdom == this.wisdom &&
          other.wisdomTmp == this.wisdomTmp &&
          other.charisma == this.charisma &&
          other.charismaTmp == this.charismaTmp &&
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
          other.rabTemp == this.rabTemp &&
          other.fortBase == this.fortBase &&
          other.fortMagic == this.fortMagic &&
          other.fortMisc == this.fortMisc &&
          other.fortTemp == this.fortTemp &&
          other.refBase == this.refBase &&
          other.refMagic == this.refMagic &&
          other.refMisc == this.refMisc &&
          other.refTemp == this.refTemp &&
          other.willBase == this.willBase &&
          other.willMagic == this.willMagic &&
          other.willMisc == this.willMisc &&
          other.willTemp == this.willTemp);
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
  final Value<int> strengthTmp;
  final Value<int> dexterity;
  final Value<int> dexterityTmp;
  final Value<int> constitution;
  final Value<int> constitutionTmp;
  final Value<int> intelligence;
  final Value<int> intelligenceTmp;
  final Value<int> wisdom;
  final Value<int> wisdomTmp;
  final Value<int> charisma;
  final Value<int> charismaTmp;
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
  final Value<int> fortBase;
  final Value<int> fortMagic;
  final Value<int> fortMisc;
  final Value<int> fortTemp;
  final Value<int> refBase;
  final Value<int> refMagic;
  final Value<int> refMisc;
  final Value<int> refTemp;
  final Value<int> willBase;
  final Value<int> willMagic;
  final Value<int> willMisc;
  final Value<int> willTemp;
  const TableCharacterCompanion({
    this.id = const Value.absent(),
    this.charName = const Value.absent(),
    this.charClass = const Value.absent(),
    this.lvl = const Value.absent(),
    this.race = const Value.absent(),
    this.alignment = const Value.absent(),
    this.size = const Value.absent(),
    this.strength = const Value.absent(),
    this.strengthTmp = const Value.absent(),
    this.dexterity = const Value.absent(),
    this.dexterityTmp = const Value.absent(),
    this.constitution = const Value.absent(),
    this.constitutionTmp = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.intelligenceTmp = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.wisdomTmp = const Value.absent(),
    this.charisma = const Value.absent(),
    this.charismaTmp = const Value.absent(),
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
    this.fortBase = const Value.absent(),
    this.fortMagic = const Value.absent(),
    this.fortMisc = const Value.absent(),
    this.fortTemp = const Value.absent(),
    this.refBase = const Value.absent(),
    this.refMagic = const Value.absent(),
    this.refMisc = const Value.absent(),
    this.refTemp = const Value.absent(),
    this.willBase = const Value.absent(),
    this.willMagic = const Value.absent(),
    this.willMisc = const Value.absent(),
    this.willTemp = const Value.absent(),
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
    required int strengthTmp,
    required int dexterity,
    required int dexterityTmp,
    required int constitution,
    required int constitutionTmp,
    required int intelligence,
    required int intelligenceTmp,
    required int wisdom,
    required int wisdomTmp,
    required int charisma,
    required int charismaTmp,
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
    required int fortBase,
    required int fortMagic,
    required int fortMisc,
    required int fortTemp,
    required int refBase,
    required int refMagic,
    required int refMisc,
    required int refTemp,
    required int willBase,
    required int willMagic,
    required int willMisc,
    required int willTemp,
  })  : charName = Value(charName),
        charClass = Value(charClass),
        lvl = Value(lvl),
        race = Value(race),
        alignment = Value(alignment),
        size = Value(size),
        strength = Value(strength),
        strengthTmp = Value(strengthTmp),
        dexterity = Value(dexterity),
        dexterityTmp = Value(dexterityTmp),
        constitution = Value(constitution),
        constitutionTmp = Value(constitutionTmp),
        intelligence = Value(intelligence),
        intelligenceTmp = Value(intelligenceTmp),
        wisdom = Value(wisdom),
        wisdomTmp = Value(wisdomTmp),
        charisma = Value(charisma),
        charismaTmp = Value(charismaTmp),
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
        rabTemp = Value(rabTemp),
        fortBase = Value(fortBase),
        fortMagic = Value(fortMagic),
        fortMisc = Value(fortMisc),
        fortTemp = Value(fortTemp),
        refBase = Value(refBase),
        refMagic = Value(refMagic),
        refMisc = Value(refMisc),
        refTemp = Value(refTemp),
        willBase = Value(willBase),
        willMagic = Value(willMagic),
        willMisc = Value(willMisc),
        willTemp = Value(willTemp);
  static Insertable<TableCharacterData> custom({
    Expression<int>? id,
    Expression<String>? charName,
    Expression<String>? charClass,
    Expression<int>? lvl,
    Expression<String>? race,
    Expression<String>? alignment,
    Expression<String>? size,
    Expression<int>? strength,
    Expression<int>? strengthTmp,
    Expression<int>? dexterity,
    Expression<int>? dexterityTmp,
    Expression<int>? constitution,
    Expression<int>? constitutionTmp,
    Expression<int>? intelligence,
    Expression<int>? intelligenceTmp,
    Expression<int>? wisdom,
    Expression<int>? wisdomTmp,
    Expression<int>? charisma,
    Expression<int>? charismaTmp,
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
    Expression<int>? fortBase,
    Expression<int>? fortMagic,
    Expression<int>? fortMisc,
    Expression<int>? fortTemp,
    Expression<int>? refBase,
    Expression<int>? refMagic,
    Expression<int>? refMisc,
    Expression<int>? refTemp,
    Expression<int>? willBase,
    Expression<int>? willMagic,
    Expression<int>? willMisc,
    Expression<int>? willTemp,
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
      if (strengthTmp != null) 'strength_tmp': strengthTmp,
      if (dexterity != null) 'dexterity': dexterity,
      if (dexterityTmp != null) 'dexterity_tmp': dexterityTmp,
      if (constitution != null) 'constitution': constitution,
      if (constitutionTmp != null) 'constitution_tmp': constitutionTmp,
      if (intelligence != null) 'intelligence': intelligence,
      if (intelligenceTmp != null) 'intelligence_tmp': intelligenceTmp,
      if (wisdom != null) 'wisdom': wisdom,
      if (wisdomTmp != null) 'wisdom_tmp': wisdomTmp,
      if (charisma != null) 'charisma': charisma,
      if (charismaTmp != null) 'charisma_tmp': charismaTmp,
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
      if (fortBase != null) 'fort_base': fortBase,
      if (fortMagic != null) 'fort_magic': fortMagic,
      if (fortMisc != null) 'fort_misc': fortMisc,
      if (fortTemp != null) 'fort_temp': fortTemp,
      if (refBase != null) 'ref_base': refBase,
      if (refMagic != null) 'ref_magic': refMagic,
      if (refMisc != null) 'ref_misc': refMisc,
      if (refTemp != null) 'ref_temp': refTemp,
      if (willBase != null) 'will_base': willBase,
      if (willMagic != null) 'will_magic': willMagic,
      if (willMisc != null) 'will_misc': willMisc,
      if (willTemp != null) 'will_temp': willTemp,
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
      Value<int>? strengthTmp,
      Value<int>? dexterity,
      Value<int>? dexterityTmp,
      Value<int>? constitution,
      Value<int>? constitutionTmp,
      Value<int>? intelligence,
      Value<int>? intelligenceTmp,
      Value<int>? wisdom,
      Value<int>? wisdomTmp,
      Value<int>? charisma,
      Value<int>? charismaTmp,
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
      Value<int>? rabTemp,
      Value<int>? fortBase,
      Value<int>? fortMagic,
      Value<int>? fortMisc,
      Value<int>? fortTemp,
      Value<int>? refBase,
      Value<int>? refMagic,
      Value<int>? refMisc,
      Value<int>? refTemp,
      Value<int>? willBase,
      Value<int>? willMagic,
      Value<int>? willMisc,
      Value<int>? willTemp}) {
    return TableCharacterCompanion(
      id: id ?? this.id,
      charName: charName ?? this.charName,
      charClass: charClass ?? this.charClass,
      lvl: lvl ?? this.lvl,
      race: race ?? this.race,
      alignment: alignment ?? this.alignment,
      size: size ?? this.size,
      strength: strength ?? this.strength,
      strengthTmp: strengthTmp ?? this.strengthTmp,
      dexterity: dexterity ?? this.dexterity,
      dexterityTmp: dexterityTmp ?? this.dexterityTmp,
      constitution: constitution ?? this.constitution,
      constitutionTmp: constitutionTmp ?? this.constitutionTmp,
      intelligence: intelligence ?? this.intelligence,
      intelligenceTmp: intelligenceTmp ?? this.intelligenceTmp,
      wisdom: wisdom ?? this.wisdom,
      wisdomTmp: wisdomTmp ?? this.wisdomTmp,
      charisma: charisma ?? this.charisma,
      charismaTmp: charismaTmp ?? this.charismaTmp,
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
      fortBase: fortBase ?? this.fortBase,
      fortMagic: fortMagic ?? this.fortMagic,
      fortMisc: fortMisc ?? this.fortMisc,
      fortTemp: fortTemp ?? this.fortTemp,
      refBase: refBase ?? this.refBase,
      refMagic: refMagic ?? this.refMagic,
      refMisc: refMisc ?? this.refMisc,
      refTemp: refTemp ?? this.refTemp,
      willBase: willBase ?? this.willBase,
      willMagic: willMagic ?? this.willMagic,
      willMisc: willMisc ?? this.willMisc,
      willTemp: willTemp ?? this.willTemp,
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
    if (strengthTmp.present) {
      map['strength_tmp'] = Variable<int>(strengthTmp.value);
    }
    if (dexterity.present) {
      map['dexterity'] = Variable<int>(dexterity.value);
    }
    if (dexterityTmp.present) {
      map['dexterity_tmp'] = Variable<int>(dexterityTmp.value);
    }
    if (constitution.present) {
      map['constitution'] = Variable<int>(constitution.value);
    }
    if (constitutionTmp.present) {
      map['constitution_tmp'] = Variable<int>(constitutionTmp.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (intelligenceTmp.present) {
      map['intelligence_tmp'] = Variable<int>(intelligenceTmp.value);
    }
    if (wisdom.present) {
      map['wisdom'] = Variable<int>(wisdom.value);
    }
    if (wisdomTmp.present) {
      map['wisdom_tmp'] = Variable<int>(wisdomTmp.value);
    }
    if (charisma.present) {
      map['charisma'] = Variable<int>(charisma.value);
    }
    if (charismaTmp.present) {
      map['charisma_tmp'] = Variable<int>(charismaTmp.value);
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
    if (fortBase.present) {
      map['fort_base'] = Variable<int>(fortBase.value);
    }
    if (fortMagic.present) {
      map['fort_magic'] = Variable<int>(fortMagic.value);
    }
    if (fortMisc.present) {
      map['fort_misc'] = Variable<int>(fortMisc.value);
    }
    if (fortTemp.present) {
      map['fort_temp'] = Variable<int>(fortTemp.value);
    }
    if (refBase.present) {
      map['ref_base'] = Variable<int>(refBase.value);
    }
    if (refMagic.present) {
      map['ref_magic'] = Variable<int>(refMagic.value);
    }
    if (refMisc.present) {
      map['ref_misc'] = Variable<int>(refMisc.value);
    }
    if (refTemp.present) {
      map['ref_temp'] = Variable<int>(refTemp.value);
    }
    if (willBase.present) {
      map['will_base'] = Variable<int>(willBase.value);
    }
    if (willMagic.present) {
      map['will_magic'] = Variable<int>(willMagic.value);
    }
    if (willMisc.present) {
      map['will_misc'] = Variable<int>(willMisc.value);
    }
    if (willTemp.present) {
      map['will_temp'] = Variable<int>(willTemp.value);
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
          ..write('strengthTmp: $strengthTmp, ')
          ..write('dexterity: $dexterity, ')
          ..write('dexterityTmp: $dexterityTmp, ')
          ..write('constitution: $constitution, ')
          ..write('constitutionTmp: $constitutionTmp, ')
          ..write('intelligence: $intelligence, ')
          ..write('intelligenceTmp: $intelligenceTmp, ')
          ..write('wisdom: $wisdom, ')
          ..write('wisdomTmp: $wisdomTmp, ')
          ..write('charisma: $charisma, ')
          ..write('charismaTmp: $charismaTmp, ')
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
          ..write('rabTemp: $rabTemp, ')
          ..write('fortBase: $fortBase, ')
          ..write('fortMagic: $fortMagic, ')
          ..write('fortMisc: $fortMisc, ')
          ..write('fortTemp: $fortTemp, ')
          ..write('refBase: $refBase, ')
          ..write('refMagic: $refMagic, ')
          ..write('refMisc: $refMisc, ')
          ..write('refTemp: $refTemp, ')
          ..write('willBase: $willBase, ')
          ..write('willMagic: $willMagic, ')
          ..write('willMisc: $willMisc, ')
          ..write('willTemp: $willTemp')
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
  required int strengthTmp,
  required int dexterity,
  required int dexterityTmp,
  required int constitution,
  required int constitutionTmp,
  required int intelligence,
  required int intelligenceTmp,
  required int wisdom,
  required int wisdomTmp,
  required int charisma,
  required int charismaTmp,
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
  required int fortBase,
  required int fortMagic,
  required int fortMisc,
  required int fortTemp,
  required int refBase,
  required int refMagic,
  required int refMisc,
  required int refTemp,
  required int willBase,
  required int willMagic,
  required int willMisc,
  required int willTemp,
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
  Value<int> strengthTmp,
  Value<int> dexterity,
  Value<int> dexterityTmp,
  Value<int> constitution,
  Value<int> constitutionTmp,
  Value<int> intelligence,
  Value<int> intelligenceTmp,
  Value<int> wisdom,
  Value<int> wisdomTmp,
  Value<int> charisma,
  Value<int> charismaTmp,
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
  Value<int> fortBase,
  Value<int> fortMagic,
  Value<int> fortMisc,
  Value<int> fortTemp,
  Value<int> refBase,
  Value<int> refMagic,
  Value<int> refMisc,
  Value<int> refTemp,
  Value<int> willBase,
  Value<int> willMagic,
  Value<int> willMisc,
  Value<int> willTemp,
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

  ColumnFilters<int> get strengthTmp => $composableBuilder(
      column: $table.strengthTmp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dexterity => $composableBuilder(
      column: $table.dexterity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dexterityTmp => $composableBuilder(
      column: $table.dexterityTmp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get constitution => $composableBuilder(
      column: $table.constitution, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get constitutionTmp => $composableBuilder(
      column: $table.constitutionTmp,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get intelligence => $composableBuilder(
      column: $table.intelligence, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get intelligenceTmp => $composableBuilder(
      column: $table.intelligenceTmp,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wisdom => $composableBuilder(
      column: $table.wisdom, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wisdomTmp => $composableBuilder(
      column: $table.wisdomTmp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get charisma => $composableBuilder(
      column: $table.charisma, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get charismaTmp => $composableBuilder(
      column: $table.charismaTmp, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<int> get fortBase => $composableBuilder(
      column: $table.fortBase, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fortMagic => $composableBuilder(
      column: $table.fortMagic, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fortMisc => $composableBuilder(
      column: $table.fortMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fortTemp => $composableBuilder(
      column: $table.fortTemp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refBase => $composableBuilder(
      column: $table.refBase, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refMagic => $composableBuilder(
      column: $table.refMagic, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refMisc => $composableBuilder(
      column: $table.refMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refTemp => $composableBuilder(
      column: $table.refTemp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get willBase => $composableBuilder(
      column: $table.willBase, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get willMagic => $composableBuilder(
      column: $table.willMagic, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get willMisc => $composableBuilder(
      column: $table.willMisc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get willTemp => $composableBuilder(
      column: $table.willTemp, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<int> get strengthTmp => $composableBuilder(
      column: $table.strengthTmp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dexterity => $composableBuilder(
      column: $table.dexterity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dexterityTmp => $composableBuilder(
      column: $table.dexterityTmp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get constitution => $composableBuilder(
      column: $table.constitution,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get constitutionTmp => $composableBuilder(
      column: $table.constitutionTmp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get intelligence => $composableBuilder(
      column: $table.intelligence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get intelligenceTmp => $composableBuilder(
      column: $table.intelligenceTmp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wisdom => $composableBuilder(
      column: $table.wisdom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wisdomTmp => $composableBuilder(
      column: $table.wisdomTmp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get charisma => $composableBuilder(
      column: $table.charisma, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get charismaTmp => $composableBuilder(
      column: $table.charismaTmp, builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<int> get fortBase => $composableBuilder(
      column: $table.fortBase, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fortMagic => $composableBuilder(
      column: $table.fortMagic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fortMisc => $composableBuilder(
      column: $table.fortMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fortTemp => $composableBuilder(
      column: $table.fortTemp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refBase => $composableBuilder(
      column: $table.refBase, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refMagic => $composableBuilder(
      column: $table.refMagic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refMisc => $composableBuilder(
      column: $table.refMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refTemp => $composableBuilder(
      column: $table.refTemp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get willBase => $composableBuilder(
      column: $table.willBase, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get willMagic => $composableBuilder(
      column: $table.willMagic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get willMisc => $composableBuilder(
      column: $table.willMisc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get willTemp => $composableBuilder(
      column: $table.willTemp, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get strengthTmp => $composableBuilder(
      column: $table.strengthTmp, builder: (column) => column);

  GeneratedColumn<int> get dexterity =>
      $composableBuilder(column: $table.dexterity, builder: (column) => column);

  GeneratedColumn<int> get dexterityTmp => $composableBuilder(
      column: $table.dexterityTmp, builder: (column) => column);

  GeneratedColumn<int> get constitution => $composableBuilder(
      column: $table.constitution, builder: (column) => column);

  GeneratedColumn<int> get constitutionTmp => $composableBuilder(
      column: $table.constitutionTmp, builder: (column) => column);

  GeneratedColumn<int> get intelligence => $composableBuilder(
      column: $table.intelligence, builder: (column) => column);

  GeneratedColumn<int> get intelligenceTmp => $composableBuilder(
      column: $table.intelligenceTmp, builder: (column) => column);

  GeneratedColumn<int> get wisdom =>
      $composableBuilder(column: $table.wisdom, builder: (column) => column);

  GeneratedColumn<int> get wisdomTmp =>
      $composableBuilder(column: $table.wisdomTmp, builder: (column) => column);

  GeneratedColumn<int> get charisma =>
      $composableBuilder(column: $table.charisma, builder: (column) => column);

  GeneratedColumn<int> get charismaTmp => $composableBuilder(
      column: $table.charismaTmp, builder: (column) => column);

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

  GeneratedColumn<int> get fortBase =>
      $composableBuilder(column: $table.fortBase, builder: (column) => column);

  GeneratedColumn<int> get fortMagic =>
      $composableBuilder(column: $table.fortMagic, builder: (column) => column);

  GeneratedColumn<int> get fortMisc =>
      $composableBuilder(column: $table.fortMisc, builder: (column) => column);

  GeneratedColumn<int> get fortTemp =>
      $composableBuilder(column: $table.fortTemp, builder: (column) => column);

  GeneratedColumn<int> get refBase =>
      $composableBuilder(column: $table.refBase, builder: (column) => column);

  GeneratedColumn<int> get refMagic =>
      $composableBuilder(column: $table.refMagic, builder: (column) => column);

  GeneratedColumn<int> get refMisc =>
      $composableBuilder(column: $table.refMisc, builder: (column) => column);

  GeneratedColumn<int> get refTemp =>
      $composableBuilder(column: $table.refTemp, builder: (column) => column);

  GeneratedColumn<int> get willBase =>
      $composableBuilder(column: $table.willBase, builder: (column) => column);

  GeneratedColumn<int> get willMagic =>
      $composableBuilder(column: $table.willMagic, builder: (column) => column);

  GeneratedColumn<int> get willMisc =>
      $composableBuilder(column: $table.willMisc, builder: (column) => column);

  GeneratedColumn<int> get willTemp =>
      $composableBuilder(column: $table.willTemp, builder: (column) => column);
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
            Value<int> strengthTmp = const Value.absent(),
            Value<int> dexterity = const Value.absent(),
            Value<int> dexterityTmp = const Value.absent(),
            Value<int> constitution = const Value.absent(),
            Value<int> constitutionTmp = const Value.absent(),
            Value<int> intelligence = const Value.absent(),
            Value<int> intelligenceTmp = const Value.absent(),
            Value<int> wisdom = const Value.absent(),
            Value<int> wisdomTmp = const Value.absent(),
            Value<int> charisma = const Value.absent(),
            Value<int> charismaTmp = const Value.absent(),
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
            Value<int> fortBase = const Value.absent(),
            Value<int> fortMagic = const Value.absent(),
            Value<int> fortMisc = const Value.absent(),
            Value<int> fortTemp = const Value.absent(),
            Value<int> refBase = const Value.absent(),
            Value<int> refMagic = const Value.absent(),
            Value<int> refMisc = const Value.absent(),
            Value<int> refTemp = const Value.absent(),
            Value<int> willBase = const Value.absent(),
            Value<int> willMagic = const Value.absent(),
            Value<int> willMisc = const Value.absent(),
            Value<int> willTemp = const Value.absent(),
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
            strengthTmp: strengthTmp,
            dexterity: dexterity,
            dexterityTmp: dexterityTmp,
            constitution: constitution,
            constitutionTmp: constitutionTmp,
            intelligence: intelligence,
            intelligenceTmp: intelligenceTmp,
            wisdom: wisdom,
            wisdomTmp: wisdomTmp,
            charisma: charisma,
            charismaTmp: charismaTmp,
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
            fortBase: fortBase,
            fortMagic: fortMagic,
            fortMisc: fortMisc,
            fortTemp: fortTemp,
            refBase: refBase,
            refMagic: refMagic,
            refMisc: refMisc,
            refTemp: refTemp,
            willBase: willBase,
            willMagic: willMagic,
            willMisc: willMisc,
            willTemp: willTemp,
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
            required int strengthTmp,
            required int dexterity,
            required int dexterityTmp,
            required int constitution,
            required int constitutionTmp,
            required int intelligence,
            required int intelligenceTmp,
            required int wisdom,
            required int wisdomTmp,
            required int charisma,
            required int charismaTmp,
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
            required int fortBase,
            required int fortMagic,
            required int fortMisc,
            required int fortTemp,
            required int refBase,
            required int refMagic,
            required int refMisc,
            required int refTemp,
            required int willBase,
            required int willMagic,
            required int willMisc,
            required int willTemp,
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
            strengthTmp: strengthTmp,
            dexterity: dexterity,
            dexterityTmp: dexterityTmp,
            constitution: constitution,
            constitutionTmp: constitutionTmp,
            intelligence: intelligence,
            intelligenceTmp: intelligenceTmp,
            wisdom: wisdom,
            wisdomTmp: wisdomTmp,
            charisma: charisma,
            charismaTmp: charismaTmp,
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
            fortBase: fortBase,
            fortMagic: fortMagic,
            fortMisc: fortMisc,
            fortTemp: fortTemp,
            refBase: refBase,
            refMagic: refMagic,
            refMisc: refMisc,
            refTemp: refTemp,
            willBase: willBase,
            willMagic: willMagic,
            willMisc: willMisc,
            willTemp: willTemp,
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
