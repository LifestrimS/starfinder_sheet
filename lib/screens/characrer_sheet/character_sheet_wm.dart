import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_model.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ability_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ac_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/bab_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/live_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/move.dart';
import 'package:pathfinder_sheet/utils/debug_screen.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

abstract interface class ICharacterSheetWM implements IWidgetModel {
  Character get character;
  int get maxHp;
  int get maxStam;
  int get maxResolve;
  int get currentResolve;
  int get dexModificator;

  CharacterAbility getAbility();
  void onRefresh();
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
  void createNewCharacter();

  EntityStateNotifier<Character?> characterLoadNotifier();
  EntityStateNotifier<List<Character?>> listCharactersNotifier();

  ValueNotifier<int> currentHpNotifier();
  ValueNotifier<int> currentStamNotifier();
  ValueNotifier<String> damageLogNotifier();
  ValueNotifier<int> totalDamageNotifier();
  ValueNotifier<int> currentResolveNotifier();
  ValueNotifier<int> dexModificatorNotifier();
  ValueNotifier<int> strModificatorNotifier();

  TextEditingController get damageTextController;
  TextEditingController get nameTextController;
  TextEditingController get classTextController;
  TextEditingController get raceTextController;
  TextEditingController get lvlTextController;
  AbilityTextControllers get abilityTextControllers;
  LiveBlockTextControllers get liveBlockTextControllers;
  AcControllers get eacControllers;
  AcControllers get kacControllers;
  MoveControllers get moveControllers;
  TextEditingController get initMiscController;
  BabControllers get babControllers;
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
  final ValueNotifier<int> _dexModificatorNotifier = ValueNotifier(0);
  final ValueNotifier<int> _strModificatorNotifier = ValueNotifier(0);

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
  final MoveControllers _moveControllers = MoveControllers(
      moveController: TextEditingController(),
      flyController: TextEditingController(),
      swimController: TextEditingController());
  final TextEditingController _initMiscController = TextEditingController();
  final BabControllers _babControllers = BabControllers(
      babController: TextEditingController(),
      mabMiscController: TextEditingController(),
      mabTempController: TextEditingController(),
      tabMiscController: TextEditingController(),
      tabTempController: TextEditingController(),
      rabMiscController: TextEditingController(),
      rabTempController: TextEditingController());

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
  ValueNotifier<int> dexModificatorNotifier() => _dexModificatorNotifier;
  @override
  ValueNotifier<int> strModificatorNotifier() => _strModificatorNotifier;

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
  MoveControllers get moveControllers => _moveControllers;
  @override
  TextEditingController get initMiscController => _initMiscController;
  @override
  BabControllers get babControllers => _babControllers;

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
    _abilityTextControllers.dexController.removeListener(dexListener);
    _abilityTextControllers.strController.removeListener(strListener);
    _dexModificatorNotifier.dispose();
    _strModificatorNotifier.dispose();
    super.dispose();
  }

  @override
  CharacterAbility getAbility() {
    return model.getAbility();
  }

  Future<void> loadData({int? charId, bool isGoToCharacter = false}) async {
    try {
      _listCharactersNotifier.loading();
      _characterLoadNotifier.loading();

      characterList = await model.getCharacterList();

      final int? savedCharId = await getSavedCharacterId();

      if (characterList.isNotEmpty) {
        _listCharactersNotifier.content(characterList);
      } else {
        _listCharactersNotifier.content([]);
        return;
      }

      //for see animation of loading
      await Future.delayed(const Duration(milliseconds: 300));

      if (isGoToCharacter) {
        _character =
            await model.getCharacter(charId ?? characterList.first!.id);
        await saveCharacterId(charId ?? characterList.first!.id);
      } else if (savedCharId != null) {
        _character = await model.getCharacter(savedCharId);
      } else {
        _character = await model.getCharacter(characterList.first!.id);
      }

      initNotifiersAndControllers();

      _characterLoadNotifier.content(_character);
    } catch (e) {
      log('Smth went wrong in init CharacterSheet: $e');
      _listCharactersNotifier.error();
    }
  }

  @override
  void onRefresh() async {
    await loadData();
  }

  void dexListener() {
    _dexModificatorNotifier.value = CharacterAbility.getModifier(
        int.parse(_abilityTextControllers.dexController.text));
  }

  void strListener() {
    _strModificatorNotifier.value = CharacterAbility.getModifier(
        int.parse(_abilityTextControllers.strController.text));
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
  void createNewCharacter() async {
    int id = await model.createNewCharacter();
    goToCharacter(id);
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
        eacBlock: ACBLock(
            amror: int.parse(_eacControllers.armorController.text),
            dodge: int.parse(_eacControllers.dodgeController.text),
            natural: int.parse(_eacControllers.naturalController.text),
            deflect: int.parse(_eacControllers.deflectController.text),
            misc: int.parse(_eacControllers.miscController.text)),
        kacBlock: ACBLock(
            amror: int.parse(_kacControllers.armorController.text),
            dodge: int.parse(_kacControllers.dodgeController.text),
            natural: int.parse(_kacControllers.naturalController.text),
            deflect: int.parse(_kacControllers.deflectController.text),
            misc: int.parse(_kacControllers.miscController.text)),
        moveSpeed: int.parse(_moveControllers.moveController.text),
        flySpeed: int.parse(_moveControllers.flyController.text),
        swimSpeed: int.parse(_moveControllers.swimController.text),
        initMisc: int.parse(_initMiscController.text),
        babBlock: CharacterBab(
            bab: int.parse(_babControllers.babController.text),
            mabMisc: int.parse(_babControllers.mabMiscController.text),
            mabTemp: int.parse(_babControllers.mabTempController.text),
            tabMisc: int.parse(_babControllers.tabMiscController.text),
            tabTemp: int.parse(_babControllers.tabTempController.text),
            rabMisc: int.parse(_babControllers.rabMiscController.text),
            rabTemp: int.parse(_babControllers.rabTempController.text)),
      );

      model.saveCharacter(newCharacter);

      log('Save:\n $newCharacter');
      onRefresh();
    } catch (e) {
      log('Smth went wrong during save: $e');
    }
  }

  void initNotifiersAndControllers() {
    _currentHpNotifier.value = model.currentHp;
    _currentStampNotifier.value = model.currentStam;
    _damageLogNotifier.value = model.damageLog;
    _totalDamageNotifier.value = model.totalDamage;
    _currentResolveNotifier.value = model.currentResolve;

    _nameTextController.text = model.name;
    _classTextController.text = model.charClass;
    _raceTextController.text = model.race;
    _lvlTextController.text = model.lvl.toString();

    _abilityTextControllers.dexController.addListener(dexListener);
    _abilityTextControllers.strController.addListener(strListener);

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

    _eacControllers.armorController.text = model.getEacBlock().amror.toString();
    _eacControllers.dexController.text =
        CharacterAbility.getModifier(model.getAbility().dexterity).toString();
    _eacControllers.dodgeController.text = model.getEacBlock().dodge.toString();
    _eacControllers.naturalController.text =
        model.getEacBlock().natural.toString();
    _eacControllers.deflectController.text =
        model.getEacBlock().deflect.toString();
    _eacControllers.miscController.text = model.getEacBlock().misc.toString();

    _kacControllers.armorController.text = model.getKacBlock().amror.toString();
    _kacControllers.dexController.text =
        CharacterAbility.getModifier(model.getAbility().dexterity).toString();
    _kacControllers.dodgeController.text = model.getKacBlock().dodge.toString();
    _kacControllers.naturalController.text =
        model.getKacBlock().natural.toString();
    _kacControllers.deflectController.text =
        model.getKacBlock().deflect.toString();
    _kacControllers.miscController.text = model.getKacBlock().misc.toString();

    _moveControllers.moveController.text = model.moveSpeed.toString();
    _moveControllers.flyController.text = model.flySpeed.toString();
    _moveControllers.swimController.text = model.swimSpeed.toString();

    _initMiscController.text = model.iniMisc.toString();

    _babControllers.babController.text = model.getBabBlock().bab.toString();
    _babControllers.mabMiscController.text =
        model.getBabBlock().mabMisc.toString();
    _babControllers.mabTempController.text =
        model.getBabBlock().mabTemp.toString();
    _babControllers.tabMiscController.text =
        model.getBabBlock().tabMisc.toString();
    _babControllers.tabTempController.text =
        model.getBabBlock().tabTemp.toString();
    _babControllers.rabMiscController.text =
        model.getBabBlock().rabMisc.toString();
    _babControllers.rabTempController.text =
        model.getBabBlock().rabTemp.toString();
  }

  @override
  void goDebug() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DebugScreen()));
  }
}
