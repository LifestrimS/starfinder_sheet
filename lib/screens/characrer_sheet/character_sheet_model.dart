import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ability_block.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';

class CharacterSheetModel extends ElementaryModel {
  // ignore: unused_field
  final Repository repository;
  final int charIndex;

  int _totalHp = 100;
  int _totalStam = 110;
  int _totalResolve = 11;

  int _currentHp = 50;
  int _currentStam = 60;
  int _currentResolve = 9;

  String _damageLog = '';
  int _totalDamage = 0;

  CharacterSheetModel({required this.charIndex, required this.repository});

  Ability getAbility() {
    return const Ability(
        str: 12, dex: 22, con: 16, intel: 12, wis: 14, cha: 17);
  }

  Future<Character?> getCharacter() async {
    try {
      Character character = await repository.getCharacterById(charIndex);
      return character;
    } catch (e) {
      log('Smth went wrong on getCharacter: $e');
      return null;
    }
  }

  int get totalHp => _totalHp;

  int get totalStam => _totalStam;

  int get currentHp => _currentHp;

  int get currentStam => _currentStam;

  int get totalResolve => _totalResolve;

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
    if (_totalResolve - _currentResolve > 1) {
      _currentResolve += 1;
    } else {
      _currentResolve = _totalResolve;
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
