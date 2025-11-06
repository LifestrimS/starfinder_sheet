import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_model.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/skill_page.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/equipment_page/armor_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/equipment_page/weapons_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/first_page/ability_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/ac_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/bab_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/dr_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/vitals_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/first_page/move.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/saving_throws_block.dart';
import 'package:pathfinder_sheet/utils/debug_screen.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

abstract interface class ICharacterSheetWM implements IWidgetModel {
  Character get character;
  int get maxHp;
  int get maxStam;
  int get maxResolve;
  int get currentResolve;
  int get dexModificator;
  int get currentPage;
  bool get isMagic;
  WeaponList get weapons;
  ArmorList get armors;
  SkillList get skillList;

  CharacterAbility getAbility();
  void onRefresh({int? pageIndex});
  void goDebug();
  void getDamage();
  void clearDamageLog();
  void healHP(int value);
  void healStam(int value);
  void addResolve();
  void removeResolve();
  void setMaxResolve(int value);
  void setAlignment(String alignment);
  void setSize(String size);
  void saveCharacter();
  void goToCharacter(int charId);
  void createNewCharacter();
  void setCurrentPage(int pageIndex);
  void setIsMagic(bool isMagic);
  void addWeapon();
  void deleteWeapon(int index);
  void addArmor();
  void deleteArmor(int index);
  void addSkillMisc(String skillName);
  void deleteSkillMisc(int index, String skillName);
  void setSkillClassed(String skillName, bool isClass);
  void deleteSkill(String skillName);
  void addSkill(String skillName, String ability);
  void changeSkillName(String oldName, String newName);
  void deleteCharacterById(int id);

  EntityStateNotifier<Character?> characterLoadNotifier();
  EntityStateNotifier<List<Character?>> listCharactersNotifier();

  ValueNotifier<int> currentHpNotifier();
  ValueNotifier<int> currentStamNotifier();
  ValueNotifier<String> damageLogNotifier();
  ValueNotifier<int> totalDamageNotifier();
  ValueNotifier<int> currentResolveNotifier();
  ValueNotifier<int> strModificatorNotifier();
  ValueNotifier<int> dexModificatorNotifier();
  ValueNotifier<int> conModificatorNotifier();
  ValueNotifier<int> intModificatorNotifier();
  ValueNotifier<int> wisModificatorNotifier();
  ValueNotifier<int> chaModificatorNotifier();
  ValueNotifier<bool> isMagicNotifier();
  ValueNotifier<int> weaponControllersNotifier();
  ValueNotifier<int> armorControllersNotifier();
  ValueNotifier<int> checkedArmorIndexNotifier();
  ValueNotifier<int> armorDexBonusNotifier();
  ValueNotifier<int> armorCheckPenaltiesNotifier();
  ValueNotifier<int> skillsCountNotifier();

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
  STHRTexEditingControllers get sTHRTexEditingControllers;
  DrSrControllers get drSrControllers;
  List<WeaponControllers> get weaponsControllers;
  List<ArmorControllers> get armorControllers;
  List<SkillControllers> get skillsControllers;

  CarouselSliderController get carouselController;
}

CharacterSheetWM createCharacterSheetWM(BuildContext _) =>
    CharacterSheetWM(CharacterSheetModel(repository: GetIt.I.get()));

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
  final ValueNotifier<int> _strModificatorNotifier = ValueNotifier(0);
  final ValueNotifier<int> _dexModificatorNotifier = ValueNotifier(0);
  final ValueNotifier<int> _conModificatorNotifier = ValueNotifier(0);
  final ValueNotifier<int> _intModificatorNotifier = ValueNotifier(0);
  final ValueNotifier<int> _wisModificatorNotifier = ValueNotifier(0);
  final ValueNotifier<int> _chaModificatorNotifier = ValueNotifier(0);
  final ValueNotifier<bool> _isMagicNotifier = ValueNotifier(true);
  final ValueNotifier<int> _weaponControllersNotifier = ValueNotifier(0);
  final ValueNotifier<int> _armorControllersNotifier = ValueNotifier(0);
  final ValueNotifier<int> _checkedArmorIndexNotifier = ValueNotifier(-1);
  final ValueNotifier<int> _armorDexBonusNotifier = ValueNotifier(0);
  final ValueNotifier<int> _armorCheckPenaltiesNotifier = ValueNotifier(0);
  final ValueNotifier<int> _skillsCountNotifier = ValueNotifier(0);

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
    chaController: TextEditingController(),
    strTmpController: TextEditingController(),
    dexTmpController: TextEditingController(),
    conTmpController: TextEditingController(),
    intTmpController: TextEditingController(),
    wisTmpController: TextEditingController(),
    chaTmpController: TextEditingController(),
  );
  final LiveBlockTextControllers _liveBlockTextControllers =
      LiveBlockTextControllers(
        maxHpController: TextEditingController(),
        maxStamController: TextEditingController(),
        maxResolveController: TextEditingController(),
      );
  final AcControllers _eacControllers = AcControllers(
    armorNotifier: ValueNotifier(0),
    dexController: TextEditingController(),
    dodgeController: TextEditingController(),
    naturalController: TextEditingController(),
    deflectController: TextEditingController(),
    miscController: TextEditingController(),
  );
  final AcControllers _kacControllers = AcControllers(
    armorNotifier: ValueNotifier(0),
    dexController: TextEditingController(),
    dodgeController: TextEditingController(),
    naturalController: TextEditingController(),
    deflectController: TextEditingController(),
    miscController: TextEditingController(),
  );
  final MoveControllers _moveControllers = MoveControllers(
    moveController: TextEditingController(),
    flyController: TextEditingController(),
    swimController: TextEditingController(),
  );
  final TextEditingController _initMiscController = TextEditingController();
  final BabControllers _babControllers = BabControllers(
    babController: TextEditingController(),
    mabMiscController: TextEditingController(),
    mabTempController: TextEditingController(),
    tabMiscController: TextEditingController(),
    tabTempController: TextEditingController(),
    rabMiscController: TextEditingController(),
    rabTempController: TextEditingController(),
  );
  final STHRTexEditingControllers _sTHRTexEditingControllers =
      STHRTexEditingControllers(
        fortBaseController: TextEditingController(),
        fortMagicController: TextEditingController(),
        fortMiscController: TextEditingController(),
        fortTempController: TextEditingController(),
        refBaseController: TextEditingController(),
        refMagicController: TextEditingController(),
        refMiscController: TextEditingController(),
        refTempController: TextEditingController(),
        willBaseController: TextEditingController(),
        willMagicController: TextEditingController(),
        willMiscController: TextEditingController(),
        willTempController: TextEditingController(),
      );
  final DrSrControllers _drSrControllers = DrSrControllers(
    drController: TextEditingController(),
    srController: TextEditingController(),
  );
  final List<SkillControllers> _skillsControllers = [];

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  Character? _character;
  List<Character?> characterList = [];
  int? _currentPage;
  final List<WeaponControllers> _weaponControllers = [];
  final List<ArmorControllers> _armorControllers = [];

  @override
  int get currentPage => _currentPage ?? 0;

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
  ValueNotifier<int> strModificatorNotifier() => _strModificatorNotifier;
  @override
  ValueNotifier<int> dexModificatorNotifier() => _dexModificatorNotifier;
  @override
  ValueNotifier<int> conModificatorNotifier() => _conModificatorNotifier;
  @override
  ValueNotifier<int> intModificatorNotifier() => _intModificatorNotifier;
  @override
  ValueNotifier<int> wisModificatorNotifier() => _wisModificatorNotifier;
  @override
  ValueNotifier<int> chaModificatorNotifier() => _chaModificatorNotifier;
  @override
  ValueNotifier<bool> isMagicNotifier() => _isMagicNotifier;
  @override
  ValueNotifier<int> weaponControllersNotifier() => _weaponControllersNotifier;
  @override
  ValueNotifier<int> armorControllersNotifier() => _armorControllersNotifier;
  @override
  ValueNotifier<int> checkedArmorIndexNotifier() => _checkedArmorIndexNotifier;
  @override
  ValueNotifier<int> armorDexBonusNotifier() => _armorDexBonusNotifier;
  @override
  ValueNotifier<int> armorCheckPenaltiesNotifier() =>
      _armorCheckPenaltiesNotifier;
  @override
  ValueNotifier<int> skillsCountNotifier() => _skillsCountNotifier;

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
  STHRTexEditingControllers get sTHRTexEditingControllers =>
      _sTHRTexEditingControllers;
  @override
  DrSrControllers get drSrControllers => _drSrControllers;
  @override
  List<SkillControllers> get skillsControllers => _skillsControllers;

  @override
  CarouselSliderController get carouselController => _carouselController;

  @override
  List<WeaponControllers> get weaponsControllers => _weaponControllers;
  @override
  List<ArmorControllers> get armorControllers => _armorControllers;

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
  @override
  bool get isMagic => model.isMagic;
  @override
  WeaponList get weapons => model.weapon;
  @override
  ArmorList get armors => model.armor;
  @override
  SkillList get skillList => model.skillList;

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
    _abilityTextControllers.strController.removeListener(strListener);
    _abilityTextControllers.dexController.removeListener(dexListener);
    _abilityTextControllers.dexController.removeListener(countArmorDexBonus);
    _abilityTextControllers.conController.removeListener(conListener);
    _abilityTextControllers.intController.removeListener(intListener);
    _abilityTextControllers.wisController.removeListener(wisListener);
    _abilityTextControllers.chaController.removeListener(chaListener);

    _abilityTextControllers.strTmpController.removeListener(strListener);
    _abilityTextControllers.dexTmpController.removeListener(dexListener);
    _abilityTextControllers.dexTmpController.removeListener(countArmorDexBonus);
    _abilityTextControllers.conTmpController.removeListener(conListener);
    _abilityTextControllers.intTmpController.removeListener(intListener);
    _abilityTextControllers.wisTmpController.removeListener(wisListener);
    _abilityTextControllers.chaTmpController.removeListener(chaListener);

    _checkedArmorIndexNotifier.removeListener(armorListener);

    _armorDexBonusNotifier.dispose();

    _strModificatorNotifier.dispose();
    _dexModificatorNotifier.dispose();
    _conModificatorNotifier.dispose();
    _intModificatorNotifier.dispose();
    _wisModificatorNotifier.dispose();
    _chaModificatorNotifier.dispose();
    _isMagicNotifier.dispose();
    _weaponControllersNotifier.dispose();
    _armorControllersNotifier.dispose();
    _checkedArmorIndexNotifier.dispose();
    _skillsCountNotifier.dispose();
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
        _character = await model.getCharacter(
          charId ?? characterList.first!.id,
        );
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
  void onRefresh({int? pageIndex}) async {
    await loadData();
    await Future.delayed(const Duration(milliseconds: 100));
    _carouselController.jumpToPage(pageIndex ?? 0);
  }

  @override
  void setCurrentPage(int pageIndex) {
    _currentPage = pageIndex;
  }

  void strListener() {
    if (_abilityTextControllers.strTmpController.text.isNotEmpty &&
        _abilityTextControllers.strTmpController.text != '0') {
      _strModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.strTmpController.text),
      );
    } else {
      _strModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.strController.text),
      );
    }
  }

  void dexListener() {
    if (_abilityTextControllers.dexTmpController.text.isNotEmpty &&
        _abilityTextControllers.dexTmpController.text != '0') {
      _dexModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.dexTmpController.text),
      );
    } else {
      _dexModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.dexController.text),
      );
    }
  }

  void conListener() {
    if (_abilityTextControllers.conTmpController.text.isNotEmpty &&
        _abilityTextControllers.conTmpController.text != '0') {
      _conModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.conTmpController.text),
      );
    } else {
      _conModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.conController.text),
      );
    }
  }

  void intListener() {
    if (_abilityTextControllers.intController.text.isNotEmpty &&
        _abilityTextControllers.intTmpController.text != '0') {
      _intModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.intTmpController.text),
      );
    } else {
      _intModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.intController.text),
      );
    }
  }

  void wisListener() {
    if (_abilityTextControllers.wisTmpController.text.isNotEmpty &&
        _abilityTextControllers.wisTmpController.text != '0') {
      _wisModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.wisTmpController.text),
      );
    } else {
      _wisModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.wisController.text),
      );
    }
  }

  void chaListener() {
    if (_abilityTextControllers.chaTmpController.text.isNotEmpty &&
        _abilityTextControllers.chaTmpController.text != '0') {
      _chaModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.chaTmpController.text),
      );
    } else {
      _chaModificatorNotifier.value = CharacterAbility.getModifier(
        parseIntFromString(_abilityTextControllers.chaController.text),
      );
    }
  }

  void armorListener() {
    for (int i = 0; i < _armorControllers.length; i++) {
      if (_checkedArmorIndexNotifier.value == i) {
        _armorControllers[i].eacController.addListener(armorBonusEacListener);
        armorBonusEacListener();

        _armorControllers[i].kacController.addListener(armorBonusKacListener);
        armorBonusKacListener();

        armorControllers[i].maxDexController.addListener(countArmorDexBonus);
        countArmorDexBonus();

        armorControllers[i].chkPenaltyController.addListener(
          armorCheckPenaltiesListener,
        );
        armorCheckPenaltiesListener();
      } else {
        _armorControllers[i].eacController.removeListener(
          armorBonusEacListener,
        );
        _armorControllers[i].kacController.removeListener(
          armorBonusKacListener,
        );
        armorControllers[i].maxDexController.removeListener(countArmorDexBonus);
        armorControllers[i].chkPenaltyController.removeListener(
          armorCheckPenaltiesListener,
        );
      }
    }
  }

  void armorBonusEacListener() {
    if (_checkedArmorIndexNotifier.value == -1) {
      _eacControllers.armorNotifier.value = 0;
      return;
    }
    _eacControllers.armorNotifier.value = parseIntFromString(
      _armorControllers[_checkedArmorIndexNotifier.value].eacController.text,
    );
  }

  void armorBonusKacListener() {
    if (_checkedArmorIndexNotifier.value == -1) {
      _kacControllers.armorNotifier.value = 0;
      return;
    }
    _kacControllers.armorNotifier.value = parseIntFromString(
      _armorControllers[_checkedArmorIndexNotifier.value].kacController.text,
    );
  }

  void armorCheckPenaltiesListener() {
    if (_checkedArmorIndexNotifier.value == -1) {
      _armorCheckPenaltiesNotifier.value = 0;
      return;
    }
    _armorCheckPenaltiesNotifier.value = parseIntFromString(
      _armorControllers[_checkedArmorIndexNotifier.value]
          .chkPenaltyController
          .text,
    );
  }

  @override
  void getDamage() {
    //always positive
    int damage = parseIntFromString(
      damageTextController.text != ''
          ? damageTextController.text.startsWith('-')
                ? damageTextController.text.substring(1)
                : damageTextController.text
          : '0',
    );

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
  void setMaxResolve(int value) {
    model.setMaxResolve(value);
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
  void setIsMagic(bool value) {
    model.setIsMagic(value);
    _isMagicNotifier.value = value;
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

  void initWeaponControllers() {
    _weaponControllers.clear();
    List<Weapon> weapons = model.weapon.weapons;
    for (int i = 0; i < weapons.length; i++) {
      WeaponControllers controller = WeaponControllers(
        nameController: TextEditingController(),
        attackBonusController: TextEditingController(),
        damageController: TextEditingController(),
        critController: TextEditingController(),
        specialController: TextEditingController(),
        rangeController: TextEditingController(),
        typeController: TextEditingController(),
        sizeController: TextEditingController(),
        capacityController: TextEditingController(),
        usagesController: TextEditingController(),
        notesController: TextEditingController(),
      );
      _weaponControllers.add(controller);
    }

    for (int i = 0; i < weapons.length; i++) {
      _weaponControllers[i].nameController.text = weapons[i].name;
      _weaponControllers[i].attackBonusController.text = weapons[i].attackBonus;
      _weaponControllers[i].damageController.text = weapons[i].damage;
      _weaponControllers[i].critController.text = weapons[i].crit;
      _weaponControllers[i].specialController.text = weapons[i].special;
      _weaponControllers[i].rangeController.text = weapons[i].range;
      _weaponControllers[i].typeController.text = weapons[i].type;
      _weaponControllers[i].sizeController.text = weapons[i].size;
      _weaponControllers[i].capacityController.text = weapons[i].capacity;
      _weaponControllers[i].usagesController.text = weapons[i].usages;
    }
    _weaponControllersNotifier.value = _weaponControllers.length;
  }

  @override
  void addWeapon() {
    WeaponControllers controller = WeaponControllers(
      nameController: TextEditingController(),
      attackBonusController: TextEditingController(),
      damageController: TextEditingController(),
      critController: TextEditingController(),
      specialController: TextEditingController(),
      rangeController: TextEditingController(),
      typeController: TextEditingController(),
      sizeController: TextEditingController(),
      capacityController: TextEditingController(),
      usagesController: TextEditingController(),
      notesController: TextEditingController(),
    );
    _weaponControllers.add(controller);
    _weaponControllersNotifier.value = _weaponControllers.length;
  }

  @override
  void deleteWeapon(int index) {
    _weaponControllers.removeAt(index);
    _weaponControllersNotifier.value = _weaponControllers.length;
  }

  void initArmorControllers() {
    _armorControllers.clear();
    List<Armor> armors = model.armor.armors;
    for (int i = 0; i < armors.length; i++) {
      ArmorControllers controller = ArmorControllers(
        nameController: TextEditingController(),
        typeController: TextEditingController(),
        kacController: TextEditingController(),
        eacController: TextEditingController(),
        chkPenaltyController: TextEditingController(),
        maxDexController: TextEditingController(),
        speedController: TextEditingController(),
        upgradesController: TextEditingController(),
        notesController: TextEditingController(),
      );
      _armorControllers.add(controller);
    }

    for (int i = 0; i < armors.length; i++) {
      _armorControllers[i].nameController.text = armors[i].name;
      _armorControllers[i].typeController.text = armors[i].type;
      _armorControllers[i].kacController.text = armors[i].armorKac.toString();
      _armorControllers[i].eacController.text = armors[i].armorEac.toString();
      _armorControllers[i].chkPenaltyController.text = armors[i].chkPenalty
          .toString();
      _armorControllers[i].maxDexController.text = armors[i].maxDex.toString();
      _armorControllers[i].speedController.text = armors[i].spd;
      _armorControllers[i].upgradesController.text = armors[i].upgrades
          .toString();
      _armorControllers[i].notesController.text = armors[i].notes;
    }
    _armorControllersNotifier.value = _armorControllers.length;
  }

  void initCheckedArmorNotifier() {
    List<Armor> armors = model.armor.armors;
    for (int i = 0; i < armors.length; i++) {
      if (armors[i].isChecked) {
        _checkedArmorIndexNotifier.value = i;
        _checkedArmorIndexNotifier.addListener(armorListener);

        countArmorDexBonus();

        _eacControllers.armorNotifier.value = parseIntFromString(
          _armorControllers[_checkedArmorIndexNotifier.value]
              .eacController
              .text,
        );
        _kacControllers.armorNotifier.value = parseIntFromString(
          _armorControllers[_checkedArmorIndexNotifier.value]
              .kacController
              .text,
        );
        armorBonusEacListener();
        armorBonusKacListener();
        countArmorDexBonus();
        armorCheckPenaltiesListener();
        _armorControllers[i].eacController.addListener(armorBonusEacListener);
        _armorControllers[i].kacController.addListener(armorBonusKacListener);
        _armorControllers[i].maxDexController.addListener(countArmorDexBonus);
        _armorControllers[i].chkPenaltyController.addListener(
          armorCheckPenaltiesListener,
        );

        return;
      }
    }
  }

  void countArmorDexBonus() {
    if (_checkedArmorIndexNotifier.value == -1) return;
    int maxDexBonus = parseIntFromString(
      _armorControllers[_checkedArmorIndexNotifier.value].maxDexController.text,
    );

    int dexAbilityBonus = _dexModificatorNotifier.value;

    if (dexAbilityBonus > maxDexBonus) {
      _armorDexBonusNotifier.value = maxDexBonus;
    } else {
      _armorDexBonusNotifier.value = dexAbilityBonus;
    }
  }

  @override
  void addArmor() {
    ArmorControllers controller = ArmorControllers(
      nameController: TextEditingController(),
      typeController: TextEditingController(),
      kacController: TextEditingController(),
      eacController: TextEditingController(),
      chkPenaltyController: TextEditingController(),
      maxDexController: TextEditingController(),
      speedController: TextEditingController(),
      upgradesController: TextEditingController(),
      notesController: TextEditingController(),
    );
    _armorControllers.add(controller);
    _armorControllersNotifier.value = _armorControllers.length;
  }

  @override
  void deleteArmor(int index) {
    _armorControllers.removeAt(index);
    _armorControllersNotifier.value = _armorControllers.length;
    _eacControllers.armorNotifier.value = 0;
    _kacControllers.armorNotifier.value = 0;
  }

  void initSkillsControllers() {
    _skillsControllers.clear();
    for (Skill skill in model.skillList.skills) {
      TextEditingController rankController = TextEditingController();
      rankController.text = skill.ranks.toString();

      List<MiscContollers> miscControllers = [];

      for (SkillMisc misc in skill.miscs) {
        TextEditingController miscValueController = TextEditingController();
        TextEditingController miscNoteController = TextEditingController();

        miscValueController.text = misc.miscValue.toString();
        miscNoteController.text = misc.miscNote;

        MiscContollers miscController = MiscContollers(
          valueController: miscValueController,
          noteController: miscNoteController,
        );
        miscControllers.add(miscController);
      }

      SkillControllers controllers = SkillControllers(
        name: skill.name,
        rankController: rankController,
        listMiscControllers: miscControllers,
      );
      _skillsControllers.add(controllers);
    }
  }

  @override
  void addSkillMisc(String skillName) {
    SkillControllers skillControllers = _skillsControllers.firstWhere(
      (e) => e.name == skillName,
    );
    skillControllers.listMiscControllers.add(
      MiscContollers(
        valueController: TextEditingController(),
        noteController: TextEditingController(),
      ),
    );
  }

  @override
  void deleteSkillMisc(int index, String skillName) {
    SkillControllers skillControllers = _skillsControllers.firstWhere(
      (e) => e.name == skillName,
    );

    skillControllers.listMiscControllers.removeAt(index);
  }

  @override
  void setSkillClassed(String skillName, bool isClass) {
    model.setClassSkill(skillName, isClass);
    _skillsCountNotifier.value = model.skillList.skills.length;
  }

  @override
  void deleteSkill(String skillName) {
    model.deleteSkill(skillName);
    _skillsCountNotifier.value = model.skillList.skills.length;
  }

  @override
  void addSkill(String skillName, String ability) {
    model.addSkill(skillName, ability);

    SkillControllers controllers = SkillControllers(
      name: skillName,
      rankController: TextEditingController(),
      listMiscControllers: [],
    );
    _skillsControllers.add(controllers);

    _skillsCountNotifier.value = model.skillList.skills.length;
  }

  @override
  void changeSkillName(String oldName, String newName) {
    model.changeSkillName(oldName, newName);

    SkillControllers skillControllers = _skillsControllers.firstWhere(
      (e) => e.name == oldName,
    );

    int index = _skillsControllers.indexOf(skillControllers);

    SkillControllers newControllers = skillControllers.copyWith(name: newName);

    _skillsControllers[index] = newControllers;

    _skillsCountNotifier.value = 0;
    _skillsCountNotifier.value = model.skillList.skills.length;
  }

  @override
  void saveCharacter() async {
    try {
      final Character newCharacter = Character(
        id: character.id,
        charName: _nameTextController.text,
        charClass: _classTextController.text,
        lvl: parseIntFromString(_lvlTextController.text),
        race: _raceTextController.text,
        alignment: CharAlignment.values.firstWhere(
          (e) => e.alignName == model.alignment,
        ),
        size: CharSize.values.firstWhere((e) => e.sizeName == model.size),
        ability: CharacterAbility(
          strength: parseIntFromString(
            _abilityTextControllers.strController.text,
          ),
          dexterity: parseIntFromString(
            _abilityTextControllers.dexController.text,
          ),
          constitution: parseIntFromString(
            _abilityTextControllers.conController.text,
          ),
          intelligence: parseIntFromString(
            _abilityTextControllers.intController.text,
          ),
          wisdom: parseIntFromString(
            _abilityTextControllers.wisController.text,
          ),
          charisma: parseIntFromString(
            _abilityTextControllers.chaController.text,
          ),
          strengthTmp: parseIntFromString(
            _abilityTextControllers.strTmpController.text,
          ),
          dexterityTmp: parseIntFromString(
            _abilityTextControllers.dexTmpController.text,
          ),
          constitutionTmp: parseIntFromString(
            _abilityTextControllers.conTmpController.text,
          ),
          intelligenceTmp: parseIntFromString(
            _abilityTextControllers.intTmpController.text,
          ),
          wisdomTmp: parseIntFromString(
            _abilityTextControllers.wisTmpController.text,
          ),
          charismaTmp: parseIntFromString(
            _abilityTextControllers.chaTmpController.text,
          ),
        ),
        liveBlock: CharacterLiveBlock(
          maxHp: parseIntFromString(
            _liveBlockTextControllers.maxHpController.text,
          ),
          currentHp: model.currentHp,
          maxStam: parseIntFromString(
            _liveBlockTextControllers.maxStamController.text,
          ),
          currentStam: model.currentStam,
          maxResolve: parseIntFromString(
            _liveBlockTextControllers.maxResolveController.text,
          ),
          currentResolve:
              model.currentResolve <
                  parseIntFromString(
                    _liveBlockTextControllers.maxResolveController.text,
                  )
              ? model.currentResolve
              : parseIntFromString(
                  _liveBlockTextControllers.maxResolveController.text,
                ),
          damageLog: model.damageLog,
        ),
        eacBlock: ACBLock(
          amror: getArmorBonus(
            isEac: true,
          ), //parseIntFromString(_eacControllers.armorController.text),
          dodge: parseIntFromString(_eacControllers.dodgeController.text),
          natural: parseIntFromString(_eacControllers.naturalController.text),
          deflect: parseIntFromString(_eacControllers.deflectController.text),
          misc: parseIntFromString(_eacControllers.miscController.text),
        ),
        kacBlock: ACBLock(
          amror: getArmorBonus(
            isEac: false,
          ), //parseIntFromString(_kacControllers.armorController.text),
          dodge: parseIntFromString(_kacControllers.dodgeController.text),
          natural: parseIntFromString(_kacControllers.naturalController.text),
          deflect: parseIntFromString(_kacControllers.deflectController.text),
          misc: parseIntFromString(_kacControllers.miscController.text),
        ),
        moveSpeed: parseIntFromString(_moveControllers.moveController.text),
        flySpeed: parseIntFromString(_moveControllers.flyController.text),
        swimSpeed: parseIntFromString(_moveControllers.swimController.text),
        initMisc: parseIntFromString(_initMiscController.text),
        babBlock: CharacterBab(
          bab: parseIntFromString(_babControllers.babController.text),
          mabMisc: parseIntFromString(_babControllers.mabMiscController.text),
          mabTemp: parseIntFromString(_babControllers.mabTempController.text),
          tabMisc: parseIntFromString(_babControllers.tabMiscController.text),
          tabTemp: parseIntFromString(_babControllers.tabTempController.text),
          rabMisc: parseIntFromString(_babControllers.rabMiscController.text),
          rabTemp: parseIntFromString(_babControllers.rabTempController.text),
        ),
        savingThrows: CharacterSavingThrows(
          fortBase: parseIntFromString(
            _sTHRTexEditingControllers.fortBaseController.text,
          ),
          fortMagic: parseIntFromString(
            _sTHRTexEditingControllers.fortMagicController.text,
          ),
          fortMisc: parseIntFromString(
            _sTHRTexEditingControllers.fortMiscController.text,
          ),
          fortTemp: parseIntFromString(
            _sTHRTexEditingControllers.fortTempController.text,
          ),
          refBase: parseIntFromString(
            _sTHRTexEditingControllers.refBaseController.text,
          ),
          refMagic: parseIntFromString(
            _sTHRTexEditingControllers.refMagicController.text,
          ),
          refMisc: parseIntFromString(
            _sTHRTexEditingControllers.refMiscController.text,
          ),
          refTemp: parseIntFromString(
            _sTHRTexEditingControllers.refTempController.text,
          ),
          willBase: parseIntFromString(
            _sTHRTexEditingControllers.willBaseController.text,
          ),
          willMagic: parseIntFromString(
            _sTHRTexEditingControllers.willMagicController.text,
          ),
          willMisc: parseIntFromString(
            _sTHRTexEditingControllers.willMiscController.text,
          ),
          willTemp: parseIntFromString(
            _sTHRTexEditingControllers.willTempController.text,
          ),
        ),
        dr: _drSrControllers.drController.text,
        sr: _drSrControllers.srController.text,
        isMagic: model.isMagic,
        weaponList: saveWeapons(),
        armorList: saveArmors(),
        skillList: saveSkills(),
      );

      model.saveCharacter(newCharacter);

      log('Save:\n $newCharacter');
      onRefresh(pageIndex: _currentPage);
    } catch (e) {
      log('Smth went wrong during save: $e');
    }
  }

  @override
  void deleteCharacterById(int id) async {
    await model.deleteCharacterById(id);
    List<Character?> listCharacters = await model.getCharacterList();
    if (listCharacters.isNotEmpty) {
      loadData(charId: listCharacters.first!.id, isGoToCharacter: true);
    } else {
      loadData();
    }
  }

  int getArmorBonus({required bool isEac}) {
    List<Armor> armors = model.armor.armors;
    for (int i = 0; i < armors.length; i++) {
      if (armors[i].isChecked) {
        return isEac ? armors[i].armorEac : armors[i].armorKac;
      }
    }
    return 0;
  }

  WeaponList saveWeapons() {
    List<Weapon> weaponList = [];
    for (int i = 0; i < _weaponControllers.length; i++) {
      weaponList.add(
        Weapon(
          name: _weaponControllers[i].nameController.text,
          attackBonus: _weaponControllers[i].attackBonusController.text,
          crit: _weaponControllers[i].critController.text,
          special: _weaponControllers[i].specialController.text,
          range: _weaponControllers[i].rangeController.text,
          damage: _weaponControllers[i].damageController.text,
          size: _weaponControllers[i].sizeController.text,
          type: _weaponControllers[i].typeController.text,
          capacity: _weaponControllers[i].capacityController.text,
          usages: _weaponControllers[i].usagesController.text,
          notes: _weaponControllers[i].notesController.text,
        ),
      );
    }

    return WeaponList(weapons: weaponList);
  }

  ArmorList saveArmors() {
    List<Armor> armorList = [];
    for (int i = 0; i < _armorControllers.length; i++) {
      armorList.add(
        Armor(
          name: _armorControllers[i].nameController.text,
          type: _armorControllers[i].typeController.text,
          armorKac: parseIntFromString(_armorControllers[i].kacController.text),
          armorEac: parseIntFromString(_armorControllers[i].eacController.text),
          chkPenalty: parseIntFromString(
            _armorControllers[i].chkPenaltyController.text,
          ),
          maxDex: parseIntFromString(
            _armorControllers[i].maxDexController.text,
          ),
          spd: _armorControllers[i].speedController.text,
          upgrades: parseIntFromString(
            _armorControllers[i].upgradesController.text,
          ),
          notes: _armorControllers[i].notesController.text,
          isChecked: _checkedArmorIndexNotifier.value == i,
        ),
      );
    }

    return ArmorList(armors: armorList);
  }

  SkillList saveSkills() {
    List<Skill> skills = [];

    for (var i = 0; i < _skillsControllers.length; i++) {
      Skill tmpSkill = model.getSkillByName(_skillsControllers[i].name);

      List<SkillMisc> listMiscs = [];

      for (
        int j = 0;
        j < _skillsControllers[i].listMiscControllers.length;
        j++
      ) {
        final SkillMisc skillMisc = SkillMisc(
          miscValue: parseIntFromString(
            _skillsControllers[i].listMiscControllers[j].valueController.text,
          ),
          miscNote:
              _skillsControllers[i].listMiscControllers[j].noteController.text,
        );
        listMiscs.add(skillMisc);
      }

      final Skill skill = Skill(
        name: _skillsControllers[i].name,
        isClass: tmpSkill.isClass,
        ability: tmpSkill.ability,
        ranks: parseIntFromString(_skillsControllers[i].rankController.text),
        miscs: listMiscs,
      );
      skills.add(skill);
    }
    return SkillList(skills: skills);
  }

  void initNotifiersAndControllers() {
    _currentHpNotifier.value = model.currentHp;
    _currentStampNotifier.value = model.currentStam;
    _damageLogNotifier.value = model.damageLog;
    _totalDamageNotifier.value = model.totalDamage;
    _currentResolveNotifier.value = model.currentResolve;
    _isMagicNotifier.value = model.isMagic;

    _nameTextController.text = model.name;
    _classTextController.text = model.charClass;
    _raceTextController.text = model.race;
    _lvlTextController.text = model.lvl.toString();

    _abilityTextControllers.strController.addListener(strListener);
    _abilityTextControllers.dexController.addListener(dexListener);
    _abilityTextControllers.dexController.addListener(countArmorDexBonus);
    _abilityTextControllers.conController.addListener(conListener);
    _abilityTextControllers.intController.addListener(intListener);
    _abilityTextControllers.wisController.addListener(wisListener);
    _abilityTextControllers.chaController.addListener(chaListener);

    _abilityTextControllers.strTmpController.addListener(strListener);
    _abilityTextControllers.dexTmpController.addListener(dexListener);
    _abilityTextControllers.dexTmpController.addListener(countArmorDexBonus);
    _abilityTextControllers.conTmpController.addListener(conListener);
    _abilityTextControllers.intTmpController.addListener(intListener);
    _abilityTextControllers.wisTmpController.addListener(wisListener);
    _abilityTextControllers.chaTmpController.addListener(chaListener);

    _abilityTextControllers.strController.text = model
        .getAbility()
        .strength
        .toString();
    _abilityTextControllers.dexController.text = model
        .getAbility()
        .dexterity
        .toString();
    _abilityTextControllers.conController.text = model
        .getAbility()
        .constitution
        .toString();
    _abilityTextControllers.intController.text = model
        .getAbility()
        .intelligence
        .toString();
    _abilityTextControllers.wisController.text = model
        .getAbility()
        .wisdom
        .toString();
    _abilityTextControllers.chaController.text = model
        .getAbility()
        .charisma
        .toString();
    _abilityTextControllers.strTmpController.text = model
        .getAbility()
        .strengthTmp
        .toString();
    _abilityTextControllers.dexTmpController.text = model
        .getAbility()
        .dexterityTmp
        .toString();
    _abilityTextControllers.conTmpController.text = model
        .getAbility()
        .constitutionTmp
        .toString();
    _abilityTextControllers.intTmpController.text = model
        .getAbility()
        .intelligenceTmp
        .toString();
    _abilityTextControllers.wisTmpController.text = model
        .getAbility()
        .wisdomTmp
        .toString();
    _abilityTextControllers.chaTmpController.text = model
        .getAbility()
        .charismaTmp
        .toString();

    _liveBlockTextControllers.maxHpController.text = model.maxHp.toString();
    _liveBlockTextControllers.maxStamController.text = model.maxStam.toString();
    _liveBlockTextControllers.maxResolveController.text = model.maxResolve
        .toString();

    //_eacControllers.armorController.text = model.getEacBlock().amror.toString();
    _eacControllers.dexController.text = CharacterAbility.getModifier(
      model.getAbility().dexterity,
    ).toString();
    _eacControllers.dodgeController.text = model.getEacBlock().dodge.toString();
    _eacControllers.naturalController.text = model
        .getEacBlock()
        .natural
        .toString();
    _eacControllers.deflectController.text = model
        .getEacBlock()
        .deflect
        .toString();
    _eacControllers.miscController.text = model.getEacBlock().misc.toString();

    //_kacControllers.armorController.text = model.getKacBlock().amror.toString();
    _kacControllers.dexController.text = CharacterAbility.getModifier(
      model.getAbility().dexterity,
    ).toString();
    _kacControllers.dodgeController.text = model.getKacBlock().dodge.toString();
    _kacControllers.naturalController.text = model
        .getKacBlock()
        .natural
        .toString();
    _kacControllers.deflectController.text = model
        .getKacBlock()
        .deflect
        .toString();
    _kacControllers.miscController.text = model.getKacBlock().misc.toString();

    _moveControllers.moveController.text = model.moveSpeed.toString();
    _moveControllers.flyController.text = model.flySpeed.toString();
    _moveControllers.swimController.text = model.swimSpeed.toString();

    _initMiscController.text = model.iniMisc.toString();

    _babControllers.babController.text = model.getBabBlock().bab.toString();
    _babControllers.mabMiscController.text = model
        .getBabBlock()
        .mabMisc
        .toString();
    _babControllers.mabTempController.text = model
        .getBabBlock()
        .mabTemp
        .toString();
    _babControllers.tabMiscController.text = model
        .getBabBlock()
        .tabMisc
        .toString();
    _babControllers.tabTempController.text = model
        .getBabBlock()
        .tabTemp
        .toString();
    _babControllers.rabMiscController.text = model
        .getBabBlock()
        .rabMisc
        .toString();
    _babControllers.rabTempController.text = model
        .getBabBlock()
        .rabTemp
        .toString();

    _sTHRTexEditingControllers.fortBaseController.text = model
        .getSTHRBlock()
        .fortBase
        .toString();
    _sTHRTexEditingControllers.fortMagicController.text = model
        .getSTHRBlock()
        .fortMagic
        .toString();
    _sTHRTexEditingControllers.fortMiscController.text = model
        .getSTHRBlock()
        .fortMisc
        .toString();
    _sTHRTexEditingControllers.fortTempController.text = model
        .getSTHRBlock()
        .fortTemp
        .toString();
    _sTHRTexEditingControllers.refBaseController.text = model
        .getSTHRBlock()
        .refBase
        .toString();
    _sTHRTexEditingControllers.refMagicController.text = model
        .getSTHRBlock()
        .refMagic
        .toString();
    _sTHRTexEditingControllers.refMiscController.text = model
        .getSTHRBlock()
        .refMisc
        .toString();
    _sTHRTexEditingControllers.refTempController.text = model
        .getSTHRBlock()
        .refTemp
        .toString();
    _sTHRTexEditingControllers.willBaseController.text = model
        .getSTHRBlock()
        .willBase
        .toString();
    _sTHRTexEditingControllers.willMagicController.text = model
        .getSTHRBlock()
        .willMagic
        .toString();
    _sTHRTexEditingControllers.willMiscController.text = model
        .getSTHRBlock()
        .willMisc
        .toString();
    _sTHRTexEditingControllers.willTempController.text = model
        .getSTHRBlock()
        .willTemp
        .toString();

    _drSrControllers.drController.text = model.dr;
    _drSrControllers.srController.text = model.sr;

    initWeaponControllers();
    initArmorControllers();
    initCheckedArmorNotifier();
    initSkillsControllers();

    _skillsCountNotifier.value = model.skillList.skills.length;
  }

  @override
  void goDebug() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DebugScreen()),
    );
  }
}
