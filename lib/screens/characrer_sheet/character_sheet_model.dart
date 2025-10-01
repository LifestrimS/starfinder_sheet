import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';

class CharacterSheetModel extends ElementaryModel {
  final Repository repository;
  final int charIndex;
  final bool isNew;

  Character character = Character.empty();

  int _maxHp = 100;
  int _maxStam = 110;
  int _maxResolve = 11;

  int _currentHp = 50;
  int _currentStam = 60;
  int _currentResolve = 9;

  String _damageLog = '';
  int _totalDamage = 0;

  CharacterSheetModel(
      {required this.charIndex, required this.repository, required this.isNew});

  CharacterAbility getAbility() {
    return character.ability;
  }

  Future<Character?> getCharacter() async {
    try {
      character = await repository.getCharacterById(charIndex);

      _maxHp = character.liveBlock.maxHp;
      _currentHp = character.liveBlock.currentHp;
      _maxStam = character.liveBlock.maxStam;
      _currentStam = character.liveBlock.currentStam;
      _maxResolve = character.liveBlock.maxResolve;
      _currentResolve = character.liveBlock.currentResolve;
      _damageLog = character.liveBlock.damageLog;

      if (_damageLog.isEmpty) {
        _totalDamage = 0;
      } else {
        final List<String> damageList = _damageLog.trim().split('+');
        for (String damage in damageList) {
          _totalDamage += int.parse(damage);
        }
      }

      return character;
    } catch (e) {
      log('Smth went wrong on getCharacter: $e');
      return null;
    }
  }

  int get maxHp => _maxHp;

  int get maxStam => _maxStam;

  int get currentHp => _currentHp;

  int get currentStam => _currentStam;

  int get maxResolve => _maxResolve;

  int get currentResolve => _currentResolve;

  void setCurrentHp(int value) {
    _currentHp = value;
  }

  void setCurrentStam(int value) {
    _currentStam = value;
  }

  void addHp(int value) {
    _currentHp += value;
  }

  void addStam(int value) {
    _currentStam += value;
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

  String get damageLog => _damageLog;

  void addDamage(String damage) {
    final tmpDamage = damage.startsWith('-') ? damage.substring(1) : damage;
    _totalDamage += int.parse(tmpDamage);

    _damageLog = '$_damageLog - $damage';
  }

  void clearDamageLog() {
    _damageLog = '';
    _totalDamage = 0;
  }

  int get totalDamage => _totalDamage;
}
