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

  Character(
      {required this.id,
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
      required this.babBlock});

  Character.empty(
      {this.id = 0,
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
      this.babBlock = const CharacterBab.empty()});

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
    );
  }

  @override
  String toString() {
    return 'id: $id\nName: $charName\nClass: $charClass\nLvl: $lvl'
        '\nRace: $race\nAlignment: ${alignment.alignName}\nSize: ${size.sizeName}';
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

  const CharacterAbility.empty(
      {this.strength = 10,
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
      this.charismaTmp = 0});

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

  const CharacterLiveBlock(
      {required this.maxHp,
      required this.currentHp,
      required this.maxStam,
      required this.currentStam,
      required this.maxResolve,
      required this.currentResolve,
      required this.damageLog});

  const CharacterLiveBlock.empty(
      {this.maxHp = 0,
      this.currentHp = -1,
      this.maxStam = 0,
      this.currentStam = -1,
      this.maxResolve = 0,
      this.currentResolve = -1,
      this.damageLog = ''});
}

class ACBLock {
  final int amror;
  final int dodge;
  final int natural;
  final int deflect;
  final int misc;

  const ACBLock(
      {required this.amror,
      required this.dodge,
      required this.natural,
      required this.deflect,
      required this.misc});

  const ACBLock.empty(
      {this.amror = 0,
      this.dodge = 0,
      this.natural = 0,
      this.deflect = 0,
      this.misc = 0});
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
