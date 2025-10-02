import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_model.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ability_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/live_block.dart';

abstract interface class ICharacterSheetWM implements IWidgetModel {
  CharacterAbility getAbility();

  void onRefresh();

  Character get character;

  int get maxHp;

  int get maxStam;

  int get maxResolve;

  int get currentResolve;

  void getDamage();

  void clearDamageLog();

  void healHP(int value);

  void healStam(int value);

  void addResolve();

  void removeResolve();

  void setAlignment(String alignment);

  void setSize(String size);

  void saveCharacter();

  ValueNotifier<Character?> characterLoadNotifier();

  ValueNotifier<int> currentHpNotifier();

  ValueNotifier<int> currentStamNotifier();

  ValueNotifier<String> damageLogNotifier();

  ValueNotifier<int> totalDamageNotifier();

  ValueNotifier<int> currentResolveNotifier();

  TextEditingController get damageTextController;

  TextEditingController get nameTextController;

  TextEditingController get classTextController;

  TextEditingController get raceTextController;

  TextEditingController get lvlTextController;

  AbilityTextControllers get abilityTextControllers;

  LiveBlockTextControllers get liveBlockTextControllers;
}

CharacterSheetWM createCharacterSheetWM(
        BuildContext _, int charIndex, bool isNew) =>
    CharacterSheetWM(
      CharacterSheetModel(
          charIndex: charIndex, repository: GetIt.I.get(), isNew: isNew),
    );

class CharacterSheetWM
    extends WidgetModel<CharacterSheetView, CharacterSheetModel>
    implements ICharacterSheetWM {
  final ValueNotifier<Character?> _characterLoadNotifier = ValueNotifier(null);
  final ValueNotifier<int> _currentHpNotifier = ValueNotifier(0);
  final ValueNotifier<int> _currentStampNotifier = ValueNotifier(0);
  final ValueNotifier<String> _damageLogNotifier = ValueNotifier('');
  final ValueNotifier<int> _totalDamageNotifier = ValueNotifier(0);
  final ValueNotifier<int> _currentResolveNotifier = ValueNotifier(0);

  final TextEditingController _damageTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _classTextController = TextEditingController();
  final TextEditingController _raceTextController = TextEditingController();
  final TextEditingController _lvlTextController = TextEditingController();

  final AbilityTextControllers _abilityTextControllers = AbilityTextControllers(
      strController: TextEditingController(),
      dexController: TextEditingController(),
      conController: TextEditingController(),
      intController: TextEditingController(),
      wisController: TextEditingController(),
      chaController: TextEditingController());

  final LiveBlockTextControllers _liveBlockTextControllers =
      LiveBlockTextControllers(
          maxHpController: TextEditingController(),
          maxStamController: TextEditingController(),
          maxResolveController: TextEditingController());

  late final Character? _character;

  @override
  ValueNotifier<Character?> characterLoadNotifier() => _characterLoadNotifier;

  @override
  ValueNotifier<int> currentHpNotifier() => _currentHpNotifier;

  @override
  ValueNotifier<int> currentStamNotifier() => _currentStampNotifier;

  @override
  ValueNotifier<String> damageLogNotifier() => _damageLogNotifier;

  @override
  ValueNotifier<int> totalDamageNotifier() => _totalDamageNotifier;

  @override
  ValueNotifier<int> currentResolveNotifier() => _currentResolveNotifier;

  @override
  TextEditingController get damageTextController => _damageTextController;
  @override
  TextEditingController get nameTextController => _nameTextController;
  @override
  TextEditingController get classTextController => _classTextController;
  @override
  TextEditingController get raceTextController => _raceTextController;
  @override
  TextEditingController get lvlTextController => _lvlTextController;
  @override
  AbilityTextControllers get abilityTextControllers => _abilityTextControllers;
  @override
  LiveBlockTextControllers get liveBlockTextControllers =>
      _liveBlockTextControllers;

  @override
  Character get character => _character ?? Character.empty();

  @override
  int get maxHp => model.maxHp;

  @override
  int get maxStam => model.maxStam;

  @override
  int get maxResolve => model.maxResolve;

  @override
  int get currentResolve => model.currentResolve;

  CharacterSheetWM(super._model);

  @override
  void initWidgetModel() {
    loadData();

    super.initWidgetModel();
  }

  @override
  void dispose() {
    _currentHpNotifier.dispose();
    _currentStampNotifier.dispose();
    _damageLogNotifier.dispose();
    _totalDamageNotifier.dispose();
    _currentResolveNotifier.dispose();
    super.dispose();
  }

  @override
  CharacterAbility getAbility() {
    return model.getAbility();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    _character = await model.getCharacter();
    _currentHpNotifier.value = model.currentHp;
    _currentStampNotifier.value = model.currentStam;
    _damageLogNotifier.value = model.damageLog;
    _totalDamageNotifier.value = model.totalDamage;
    _currentResolveNotifier.value = model.currentResolve;
    _characterLoadNotifier.value = _character;

    _nameTextController.text = model.name;
    _classTextController.text = model.charClass;
    _raceTextController.text = model.race;
    _lvlTextController.text = model.lvl.toString();

    _abilityTextControllers.strController.text =
        model.getAbility().strength.toString();
    _abilityTextControllers.dexController.text =
        model.getAbility().dexterity.toString();
    _abilityTextControllers.conController.text =
        model.getAbility().constitution.toString();
    _abilityTextControllers.intController.text =
        model.getAbility().intelligence.toString();
    _abilityTextControllers.wisController.text =
        model.getAbility().wisdom.toString();
    _abilityTextControllers.chaController.text =
        model.getAbility().charisma.toString();

    _liveBlockTextControllers.maxHpController.text = model.maxHp.toString();
    _liveBlockTextControllers.maxStamController.text = model.maxStam.toString();
    _liveBlockTextControllers.maxResolveController.text =
        model.maxResolve.toString();
  }

  @override
  void onRefresh() async {
    await loadData();
  }

  @override
  void getDamage() {
    //always positive
    int damage = int.parse(damageTextController.text != ''
        ? damageTextController.text.startsWith('-')
            ? damageTextController.text.substring(1)
            : damageTextController.text
        : '0');

    if (damage < model.currentStam) {
      model.addStam(-damage);
    } else {
      final tmpDamage = damage - model.currentStam;
      model.setCurrentStam(0);
      if (tmpDamage < model.currentHp) {
        model.addHp(-tmpDamage);
      } else {
        model.setCurrentHp(0);
      }
    }

    model.addDamage('$damage');
    _currentStampNotifier.value = model.currentStam;
    _currentHpNotifier.value = model.currentHp;
    _totalDamageNotifier.value = model.totalDamage;
    _damageLogNotifier.value = model.damageLog;
    _damageTextController.clear();
  }

  @override
  void clearDamageLog() {
    model.clearDamageLog();
    _damageLogNotifier.value = model.damageLog;
    _totalDamageNotifier.value = model.totalDamage;
    _damageTextController.clear();
  }

  @override
  void healHP(int value) {
    if (model.maxHp <= (value + model.currentHp)) {
      model.setCurrentHp(model.maxHp);
    } else {
      model.addHp(value);
    }

    _currentHpNotifier.value = model.currentHp;
  }

  @override
  void healStam(int value) {
    if (model.maxStam <= (value + model.currentStam)) {
      model.setCurrentStam(model.maxStam);
    } else {
      model.addStam(value);
    }
    _currentStampNotifier.value = model.currentStam;
  }

  @override
  void addResolve() {
    model.addResolve();
    _currentResolveNotifier.value = model.currentResolve;
  }

  @override
  void removeResolve() {
    model.removeResolve();
    _currentResolveNotifier.value = model.currentResolve;
  }

  @override
  void setAlignment(String alignment) {
    model.setAlignment(alignment);
  }

  @override
  void setSize(String size) {
    model.setSize(size);
  }

  @override
  void saveCharacter() async {
    try {
      final Character newCharacter = Character(
        id: model.charIndex,
        charName: _nameTextController.text,
        charClass: _classTextController.text,
        lvl: int.parse(_lvlTextController.text),
        race: _raceTextController.text,
        alignment: CharAlignment.values
            .firstWhere((e) => e.alignName == model.alignment),
        size: CharSize.values.firstWhere((e) => e.sizeName == model.size),
        ability: CharacterAbility(
            strength: int.parse(_abilityTextControllers.strController.text),
            dexterity: int.parse(_abilityTextControllers.dexController.text),
            constitution: int.parse(_abilityTextControllers.conController.text),
            intelligence: int.parse(_abilityTextControllers.intController.text),
            wisdom: int.parse(_abilityTextControllers.wisController.text),
            charisma: int.parse(_abilityTextControllers.chaController.text)),
        liveBlock: CharacterLiveBlock(
            maxHp: int.parse(_liveBlockTextControllers.maxHpController.text),
            currentHp: model.currentHp,
            maxStam:
                int.parse(_liveBlockTextControllers.maxStamController.text),
            currentStam: model.currentStam,
            maxResolve:
                int.parse(_liveBlockTextControllers.maxResolveController.text),
            currentResolve: model.currentResolve,
            damageLog: model.damageLog),
      );

      model.saveCharacter(newCharacter: newCharacter);

      log('Save:\n $newCharacter');
    } catch (e) {
      log('Smth went wrong during save: $e');
    }
  }

  // void save() async {
  //   CharacterBio bio = CharacterBio(
  //       id: 0,
  //       alignment: CharAlignment.values.firstWhere(
  //           (e) => e.toString() == 'CharAlignment.${alignmentNotifier.value}'),
  //       deiterity: deiterityTextController.text,
  //       race: Race.values
  //           .firstWhere((e) => e.toString() == 'Race.${racetNotifier.value}'),
  //       age: int.parse(
  //           ageTextController.text == '' ? '0' : ageTextController.text),
  //       gender: Gender.values.firstWhere(
  //           (e) => e.toString() == 'Gender.${genderNotifier.value}'),
  //       size: Size.values
  //           .firstWhere((e) => e.toString() == 'Size.${sizeNotifier.value}'),
  //       weight: double.parse(weightTextController.text == ''
  //           ? '0.0'
  //           : weightTextController.text),
  //       height: double.parse(heightTextController.text == ''
  //           ? '0.0'
  //           : heightTextController.text),
  //       hairColor: hairColor.value,
  //       eyeColor: eyeColor.value);

  //   log('ImageColor: ${backgroundColor.value}');

  //   Character character = Character(
  //       id: 0,
  //       name: nameTextController.text,
  //       chClass: ChClass.values.firstWhere(
  //           (e) => e.toString() == 'ChClass.${classNotifier.value}'),
  //       lvl: int.parse(
  //           lvlTextController.text == '' ? '0' : lvlTextController.text),
  //       textColor: textImageColor.value,
  //       imageColor: backgroundColor.value,
  //       imagePath: imagePathNotifier.value?.path,
  //       bio: bio);

  //   //log('Save\nCharacter: ${character.toString()}');

  //   try {
  //     await _repository.addCharacter(character);
  //     Fluttertoast.showToast(
  //       msg: 'Saved',
  //       toastLength: Toast.LENGTH_SHORT,
  //     );

  //     await Future.delayed(const Duration(milliseconds: 500));
  //     goBack();
  //   } catch (e) {
  //     log('Smth get wrond on add character to db: $e');
  //   }
  // }
}
