import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

class Character {
  final int id;
  final String charName;
  final String charClass;
  final int lvl;
  final String race;
  final CharAlignment alignment;
  final CharSize size;
  final CharacterAbility ability;
  final CharacterLiveBlock liveBlock;
  final ACBLock eacBlock;
  final ACBLock kacBlock;
  final int moveSpeed;
  final int flySpeed;
  final int swimSpeed;
  final int initMisc;
  final CharacterBab babBlock;
  final CharacterSavingThrows savingThrows;
  final String dr;
  final String sr;
  final bool isMagic;
  final WeaponList weaponList;

  Character({
    required this.id,
    required this.charName,
    required this.charClass,
    required this.lvl,
    required this.race,
    required this.alignment,
    required this.size,
    required this.ability,
    required this.liveBlock,
    required this.eacBlock,
    required this.kacBlock,
    required this.moveSpeed,
    required this.flySpeed,
    required this.swimSpeed,
    required this.initMisc,
    required this.babBlock,
    required this.savingThrows,
    required this.dr,
    required this.sr,
    required this.isMagic,
    required this.weaponList,
  });

  Character.empty({
    this.id = 0,
    this.charName = 'Name',
    this.charClass = 'Class',
    this.lvl = 0,
    this.race = 'Race',
    this.alignment = CharAlignment.nn,
    this.size = CharSize.m,
    this.ability = const CharacterAbility.empty(),
    this.liveBlock = const CharacterLiveBlock.empty(),
    this.eacBlock = const ACBLock.empty(),
    this.kacBlock = const ACBLock.empty(),
    this.moveSpeed = 0,
    this.flySpeed = 0,
    this.swimSpeed = 0,
    this.initMisc = 0,
    this.babBlock = const CharacterBab.empty(),
    this.savingThrows = const CharacterSavingThrows.empty(),
    this.dr = '',
    this.sr = '',
    this.isMagic = true,
    this.weaponList = const WeaponList.empty(),
  });

  Character copyWith({
    int? id,
    String? charName,
    String? charClass,
    int? lvl,
    String? race,
    CharAlignment? alignment,
    CharSize? size,
    CharacterAbility? ability,
    CharacterLiveBlock? liveBlock,
    ACBLock? eacBlock,
    ACBLock? kacBlock,
    int? moveSpeed,
    int? flySpeed,
    int? swimSpeed,
    int? initMisc,
    CharacterBab? babBlock,
    CharacterSavingThrows? savingThrows,
    String? dr,
    String? sr,
    bool? isMagic,
    WeaponList? weaponList,
  }) {
    return Character(
      id: id ?? this.id,
      charName: charName ?? this.charName,
      charClass: charClass ?? this.charClass,
      lvl: lvl ?? this.lvl,
      race: race ?? this.race,
      alignment: alignment ?? this.alignment,
      size: size ?? this.size,
      ability: ability ?? this.ability,
      liveBlock: liveBlock ?? this.liveBlock,
      eacBlock: eacBlock ?? this.eacBlock,
      kacBlock: kacBlock ?? this.kacBlock,
      moveSpeed: moveSpeed ?? this.moveSpeed,
      flySpeed: flySpeed ?? this.flySpeed,
      swimSpeed: swimSpeed ?? this.swimSpeed,
      initMisc: initMisc ?? this.initMisc,
      babBlock: babBlock ?? this.babBlock,
      savingThrows: savingThrows ?? this.savingThrows,
      dr: dr ?? this.dr,
      sr: sr ?? this.sr,
      isMagic: isMagic ?? this.isMagic,
      weaponList: weaponList ?? this.weaponList,
    );
  }

  @override
  String toString() {
    return 'id: $id\nName: $charName\nClass: $charClass\nLvl: $lvl'
        '\nRace: $race\nAlignment: ${alignment.alignName}\nSize: ${size.sizeName}\nweapons ${weaponList.weapons}';
  }

  String shortString() {
    return 'id: $id Name: $charName Class: $charClass Lvl: $lvl';
  }
}

enum CharAlignment {
  lg,
  ng,
  cg,
  ln,
  nn,
  cn,
  le,
  ne,
  ce;

  String get alignName => name;
}

enum CharSize {
  d,
  t,
  s,
  m,
  l,
  h,
  g,
  c;

  String get sizeName => name;
}

class CharacterAbility {
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final int strengthTmp;
  final int dexterityTmp;
  final int constitutionTmp;
  final int intelligenceTmp;
  final int wisdomTmp;
  final int charismaTmp;

  const CharacterAbility({
    required this.strength,
    required this.dexterity,
    required this.constitution,
    required this.intelligence,
    required this.wisdom,
    required this.charisma,
    required this.strengthTmp,
    required this.dexterityTmp,
    required this.constitutionTmp,
    required this.intelligenceTmp,
    required this.wisdomTmp,
    required this.charismaTmp,
  });

  const CharacterAbility.empty({
    this.strength = 10,
    this.dexterity = 10,
    this.constitution = 10,
    this.intelligence = 10,
    this.wisdom = 10,
    this.charisma = 10,
    this.strengthTmp = 0,
    this.dexterityTmp = 0,
    this.constitutionTmp = 0,
    this.intelligenceTmp = 0,
    this.wisdomTmp = 0,
    this.charismaTmp = 0,
  });

  static int getModifier(int value) {
    int modifier = 0;
    if (value > 0) {
      modifier = -5 + (value ~/ 2);
      return modifier > 0 ? modifier : modifier;
    } else {
      return 0;
    }
  }
}

class CharacterLiveBlock {
  final int maxHp;
  final int currentHp;
  final int maxStam;
  final int currentStam;
  final int maxResolve;
  final int currentResolve;
  final String damageLog;

  const CharacterLiveBlock({
    required this.maxHp,
    required this.currentHp,
    required this.maxStam,
    required this.currentStam,
    required this.maxResolve,
    required this.currentResolve,
    required this.damageLog,
  });

  const CharacterLiveBlock.empty({
    this.maxHp = 0,
    this.currentHp = -1,
    this.maxStam = 0,
    this.currentStam = -1,
    this.maxResolve = 0,
    this.currentResolve = -1,
    this.damageLog = '',
  });
}

class ACBLock {
  final int amror;
  final int dodge;
  final int natural;
  final int deflect;
  final int misc;

  const ACBLock({
    required this.amror,
    required this.dodge,
    required this.natural,
    required this.deflect,
    required this.misc,
  });

  const ACBLock.empty({
    this.amror = 0,
    this.dodge = 0,
    this.natural = 0,
    this.deflect = 0,
    this.misc = 0,
  });
}

class CharacterBab {
  final int bab;
  final int mabMisc;
  final int mabTemp;
  final int tabMisc;
  final int tabTemp;
  final int rabMisc;
  final int rabTemp;

  const CharacterBab({
    required this.bab,
    required this.mabMisc,
    required this.mabTemp,
    required this.tabMisc,
    required this.tabTemp,
    required this.rabMisc,
    required this.rabTemp,
  });

  const CharacterBab.empty({
    this.bab = 0,
    this.mabMisc = 0,
    this.mabTemp = 0,
    this.tabMisc = 0,
    this.tabTemp = 0,
    this.rabMisc = 0,
    this.rabTemp = 0,
  });
}

class CharacterSavingThrows {
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

  const CharacterSavingThrows({
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
    required this.willTemp,
  });

  const CharacterSavingThrows.empty({
    this.fortBase = 0,
    this.fortMagic = 0,
    this.fortMisc = 0,
    this.fortTemp = 0,
    this.refBase = 0,
    this.refMagic = 0,
    this.refMisc = 0,
    this.refTemp = 0,
    this.willBase = 0,
    this.willMagic = 0,
    this.willMisc = 0,
    this.willTemp = 0,
  });
}

class Weapon {
  final String name;
  final String attackBonus;
  final String crit;
  final String special;
  final String range;
  final String damage;
  final String size;
  final String type;
  final String capacity;
  final String usages;
  final bool isCollapsed;

  const Weapon({
    required this.name,
    required this.attackBonus,
    required this.crit,
    required this.special,
    required this.range,
    required this.damage,
    required this.size,
    required this.type,
    required this.capacity,
    required this.usages,
    required this.isCollapsed,
  });

  const Weapon.empty({
    this.name = '',
    this.attackBonus = '',
    this.crit = '',
    this.special = '',
    this.range = '',
    this.damage = '',
    this.size = '',
    this.type = '',
    this.capacity = '',
    this.usages = '',
    this.isCollapsed = true,
  });

  @override
  String toString() {
    return '\nName: $name';
  }

  Weapon.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String,
      attackBonus = json['attackBonus'] as String,
      crit = json['crit'] as String,
      special = json['special'] as String,
      range = json['range'] as String,
      damage = json['damage'] as String,
      size = json['size'] as String,
      type = json['type'] as String,
      capacity = json['capacity'] as String,
      usages = json['usages'] as String,
      isCollapsed = json['isCollapsed'] as bool;

  Map<String, dynamic> toJson() => {
    'name': name,
    'attackBonus': attackBonus,
    'crit': crit,
    'special': special,
    'range': range,
    'damage': damage,
    'size': size,
    'type': type,
    'capacity': capacity,
    'usages': usages,
    'isCollapsed': isCollapsed,
  };
}

@JsonSerializable()
class WeaponList {
  final List<Weapon> weapons;

  const WeaponList({required this.weapons});

  const WeaponList.empty({this.weapons = const []});

  factory WeaponList.fromJson(Map<String, dynamic> json) =>
      _$WeaponListFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponListToJson(this);

  static JsonTypeConverter2<WeaponList, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => WeaponList.fromJson(json as Map<String, Object?>),
        toJson: (weaponList) => weaponList.toJson(),
      );
}
