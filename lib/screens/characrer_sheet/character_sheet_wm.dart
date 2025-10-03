import 'dart:developer';
import 'dart:ui' as ui;

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_model.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ability_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ac_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/live_block.dart';
import 'package:pathfinder_sheet/utils/debug_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ICharacterSheetWM implements IWidgetModel {
  CharacterAbility getAbility();

  void onRefresh();

  Character get character;

  int get maxHp;

  int get maxStam;

  int get maxResolve;

  int get currentResolve;

  int get dexModificator;

  void goDebug();

  void getDamage();

  void clearDamageLog();

  void healHP(int value);

  void healStam(int value);

  void addResolve();

  void removeResolve();

  void setAlignment(String alignment);

  void setSize(String size);

  void saveCharacter();

  void goToCharacter(int charId);

  double screenHeight();

  EntityStateNotifier<Character?> characterLoadNotifier();

  EntityStateNotifier<List<Character?>> listCharactersNotifier();

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

  AcControllers get eacControllers;

  AcControllers get kacControllers;
}

CharacterSheetWM createCharacterSheetWM(
  BuildContext _,
) =>
    CharacterSheetWM(
      CharacterSheetModel(
        repository: GetIt.I.get(),
      ),
    );

class CharacterSheetWM
    extends WidgetModel<CharacterSheetView, CharacterSheetModel>
    implements ICharacterSheetWM {
  final EntityStateNotifier<Character?> _characterLoadNotifier =
      EntityStateNotifier(EntityState.loading());
  final EntityStateNotifier<List<Character?>> _listCharactersNotifier =
      EntityStateNotifier(EntityState.loading());

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

  final AcControllers _eacControllers = AcControllers(
      armorController: TextEditingController(),
      dexController: TextEditingController(),
      dodgeController: TextEditingController(),
      naturalController: TextEditingController(),
      deflectController: TextEditingController(),
      miscController: TextEditingController());

  final AcControllers _kacControllers = AcControllers(
      armorController: TextEditingController(),
      dexController: TextEditingController(),
      dodgeController: TextEditingController(),
      naturalController: TextEditingController(),
      deflectController: TextEditingController(),
      miscController: TextEditingController());

  Character? _character;
  List<Character?> characterList = [];

  @override
  EntityStateNotifier<Character?> characterLoadNotifier() =>
      _characterLoadNotifier;

  @override
  EntityStateNotifier<List<Character?>> listCharactersNotifier() =>
      _listCharactersNotifier;

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
  AcControllers get eacControllers => _eacControllers;
  @override
  AcControllers get kacControllers => _kacControllers;

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

  @override
  int get dexModificator =>
      CharacterAbility.getModifier(model.getAbility().dexterity);

  CharacterSheetWM(super._model);

  @override
  void initWidgetModel() {
    loadData();
    log('CharacterSheetWM init');

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

  Future<int?> getSavedId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? charId = prefs.getInt('lastCharacterId');
    return charId;
  }

  Future<void> saveId(int charId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastCharacterId', charId);
  }

  Future<void> loadData({int? charId, bool isGoToCharacter = false}) async {
    try {
      _listCharactersNotifier.loading();
      _characterLoadNotifier.loading();

      characterList = await model.getCharacterList();

      final int? savedCharId = await getSavedId();

      if (characterList.isNotEmpty) {
        _listCharactersNotifier.content(characterList);
      } else {
        _listCharactersNotifier.error();
      }

      await Future.delayed(const Duration(milliseconds: 300));

      if (isGoToCharacter) {
        _character =
            await model.getCharacter(charId ?? characterList.first!.id);
        await saveId(charId ?? characterList.first!.id);
      } else if (savedCharId != null) {
        _character = await model.getCharacter(savedCharId);
      } else {
        _character = await model.getCharacter(characterList.first!.id);
      }

      _currentHpNotifier.value = model.currentHp;
      _currentStampNotifier.value = model.currentStam;
      _damageLogNotifier.value = model.damageLog;
      _totalDamageNotifier.value = model.totalDamage;
      _currentResolveNotifier.value = model.currentResolve;

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
      _liveBlockTextControllers.maxStamController.text =
          model.maxStam.toString();
      _liveBlockTextControllers.maxResolveController.text =
          model.maxResolve.toString();

      _eacControllers.armorController.text = '0';
      _eacControllers.dexController.text =
          CharacterAbility.getModifier(model.getAbility().dexterity).toString();
      _eacControllers.dodgeController.text = '0';
      _eacControllers.naturalController.text = '0';
      _eacControllers.deflectController.text = '0';
      _eacControllers.miscController.text = '0';

      _kacControllers.armorController.text = '0';
      _kacControllers.dexController.text =
          CharacterAbility.getModifier(model.getAbility().dexterity).toString();
      _kacControllers.dodgeController.text = '0';
      _kacControllers.naturalController.text = '0';
      _kacControllers.deflectController.text = '0';
      _kacControllers.miscController.text = '0';

      _characterLoadNotifier.content(_character);
    } catch (e) {
      log('Smth went wrong in init CharacterSheet: $e');
    }
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
  void goToCharacter(int charId) {
    loadData(charId: charId, isGoToCharacter: true);
  }

  @override
  void saveCharacter() async {
    try {
      final Character newCharacter = Character(
        id: character.id,
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

      model.saveCharacter(newCharacter);

      log('Save:\n $newCharacter');
    } catch (e) {
      log('Smth went wrong during save: $e');
    }
  }

  @override
  void goDebug() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DebugScreen()));
  }

  @override
  double screenHeight() {
    ui.FlutterView view =
        WidgetsBinding.instance.platformDispatcher.views.first;
    // Dimensions in logical pixels (dp)
    ui.Size size = view.physicalSize / view.devicePixelRatio;
    double height = size.height;

    //hald of screen - appbar size
    return height / 2 - 70;
  }
}
