import 'package:elementary/elementary.dart';
import 'package:pathfinder_sheet/characrer/widgets/ability_block.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';

class CharacterModel extends ElementaryModel {
  // ignore: unused_field
  final Repository _repository;
  int totalHp = 100;
  int totalStam = 110;

  int currentHp = 50;
  int currentStam = 60;

  String _damageLog = '';
  int _totalDamage = 0;

  CharacterModel(this._repository);

  Ability getAbility() {
    return const Ability(
        str: 12, dex: 22, con: 16, intel: 12, wis: 14, cha: 17);
  }

  int getTotalHp() {
    return totalHp;
  }

  int getTotalStam() {
    return totalStam;
  }

  int getCurrentHp() {
    return currentHp;
  }

  int getCurrentStam() {
    return currentStam;
  }

  void addHp(int value) {
    currentHp += value;
  }

  void addStam(int value) {
    currentStam += value;
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
