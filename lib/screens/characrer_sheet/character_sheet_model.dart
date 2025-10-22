import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class CharacterSheetModel extends ElementaryModel {
  final Repository repository;

  Character character = Character.empty();

  String _name = '';
  String _class = '';
  String _race = '';
  int _lvl = 0;
  String _alignment = 'nn';
  String _size = 'm';

  int _maxHp = 100;
  int _maxStam = 110;
  int _maxResolve = 11;

  int _currentHp = 50;
  int _currentStam = 60;
  int _currentResolve = 9;

  String _damageLog = '';
  int _totalDamage = 0;

  bool _isMagic = true;

  CharacterSheetModel({required this.repository});

  int get lvl => _lvl;

  String get name => _name;

  String get charClass => _class;

  String get race => _race;

  String get alignment => _alignment;

  String get size => _size;

  int get maxHp => _maxHp;

  int get maxStam => _maxStam;

  int get currentHp => _currentHp;

  int get currentStam => _currentStam;

  int get maxResolve => _maxResolve;

  int get currentResolve => _currentResolve;

  String get damageLog => _damageLog;

  int get totalDamage => _totalDamage;

  int get moveSpeed => character.moveSpeed;

  int get flySpeed => character.flySpeed;

  int get swimSpeed => character.swimSpeed;

  int get iniMisc => character.initMisc;

  String get dr => character.dr;

  String get sr => character.sr;

  bool get isMagic => _isMagic;

  WeaponList get weapon => character.weaponList;

  ArmorList get armor => character.armorList;

  SkillList get skillList => character.skillList;

  CharacterAbility getAbility() {
    return character.ability;
  }

  ACBLock getEacBlock() => character.eacBlock;
  ACBLock getKacBlock() => character.kacBlock;

  CharacterBab getBabBlock() => character.babBlock;

  CharacterSavingThrows getSTHRBlock() => character.savingThrows;

  void setCurrentHp(int value) => _currentHp = value;

  void setCurrentStam(int value) => _currentStam = value;

  void addHp(int value) => _currentHp += value;

  void addStam(int value) => _currentStam += value;

  void setAlignment(String value) => _alignment = value;

  void setSize(String value) => _size = value;

  void setLvl(int value) => _lvl = value;

  void setName(String value) => _name = value;

  void setClass(String value) => _class = value;

  void setRace(String value) => _race = value;

  void setIsMagic(bool value) => _isMagic = value;

  void setMaxResolve(int value) => _maxResolve = value;

  Future<List<Character?>> getCharacterList() async {
    try {
      List<Character> characterList = await repository.getAllCharacter();
      return characterList;
    } catch (e) {
      log('Smth went wrond during getAllCharacter: $e');
      return [];
    }
  }

  Future<Character?> getCharacter(int charId) async {
    try {
      character = await repository.getCharacterById(charId);

      _maxHp = character.liveBlock.maxHp;
      _currentHp = character.liveBlock.currentHp == -1
          ? character.liveBlock.maxHp
          : character.liveBlock.currentHp;
      _maxStam = character.liveBlock.maxStam;
      _currentStam = character.liveBlock.currentStam == -1
          ? character.liveBlock.maxStam
          : character.liveBlock.currentStam;
      _maxResolve = character.liveBlock.maxResolve;
      _currentResolve = character.liveBlock.currentResolve == -1
          ? character.liveBlock.maxResolve
          : character.liveBlock.currentResolve;
      _damageLog = character.liveBlock.damageLog;
      _lvl = character.lvl;
      _isMagic = character.isMagic;

      _totalDamage = 0;

      if (_damageLog.isNotEmpty) {
        final List<String> damageList = _damageLog.trim().split('-');
        for (int i = 1; i <= damageList.length - 1; i++) {
          _totalDamage += parseIntFromString(damageList[i]);
        }
      }

      return character;
    } catch (e) {
      log('Smth went wrong on getCharacter: $e');
      return null;
    }
  }

  Future<int> createNewCharacter() async {
    Character newCharacter = Character.empty(
      skillList: SkillList.createCommonSkills(),
    );
    return await repository.addCharacter(newCharacter);
  }

  Future<void> saveCharacter(Character newCharacter) async {
    try {
      await repository.updateCharacter(newCharacter);
    } catch (e) {
      log('Smthing went wrong during save character: $e');
    }
  }

  void addResolve() {
    if (_maxResolve - _currentResolve > 1) {
      _currentResolve += 1;
    } else {
      _currentResolve = _maxResolve;
    }
  }

  void removeResolve() {
    if (_currentResolve != 0) {
      _currentResolve -= 1;
    }
  }

  void addDamage(String damage) {
    final tmpDamage = damage.startsWith('-') ? damage.substring(1) : damage;
    _totalDamage += parseIntFromString(tmpDamage);

    _damageLog = '$_damageLog - $damage';
  }

  void clearDamageLog() {
    _damageLog = '';
    _totalDamage = 0;
  }

  void setClassSkill(String skillName, bool isClass) {
    Skill skill = character.skillList.skills.firstWhere(
      (e) => e.name == skillName,
    );

    int index = character.skillList.skills.indexOf(skill);

    character.skillList.skills[index].isClass = isClass;
  }

  void deleteSkill(String skillName) {
    character.skillList.skills.removeWhere((e) => e.name == skillName);
  }

  void addSkill(String name, String abilityName) {
    Skill skill = Skill(
      name: name,
      isClass: false,
      ability: abilityName,
      ranks: 0,
      miscs: [],
    );
    character.skillList.skills.add(skill);
  }

  void changeSkillName(String oldName, String newName) {
    Skill skill = character.skillList.skills.firstWhere(
      (e) => e.name == oldName,
    );
    int index = character.skillList.skills.indexOf(skill);

    Skill newSkill = skill.copyWith(name: newName);

    character.skillList.skills[index] = newSkill;
  }
}
