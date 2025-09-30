import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_model.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ability_block.dart';

abstract interface class ICharacterSheetWM implements IWidgetModel {
  Ability getAbility();

  int get totalHp;

  int get totalStam;

  int get totalResolve;

  int get currentResolve;

  void goBack();

  void getDamage();

  void clearDamageLog();

  void healHP(int value);

  void healStam(int value);

  void addResolve();

  void removeResolve();

  ValueNotifier<int> currentHpNotifier();

  ValueNotifier<int> currentStamNotifier();

  ValueNotifier<String> damageLogNotifier();

  ValueNotifier<int> totalDamageNotifier();

  ValueNotifier<int> currentResolveNotifier();

  TextEditingController get damageTextController;
}

CharacterSheetWM createCharacterSheetWM(BuildContext _) => CharacterSheetWM(
      CharacterSheetModel(GetIt.I.get()),
    );

class CharacterSheetWM
    extends WidgetModel<CharacterSheetView, CharacterSheetModel>
    implements ICharacterSheetWM {
  final ValueNotifier<int> _currentHpNotifier = ValueNotifier(0);
  final ValueNotifier<int> _currentStampNotifier = ValueNotifier(0);
  final ValueNotifier<String> _damageLogNotifier = ValueNotifier('');
  final ValueNotifier<int> _totalDamageNotifier = ValueNotifier(0);
  final ValueNotifier<int> _currentResolveNotifier = ValueNotifier(0);

  final TextEditingController _damageTextController = TextEditingController();

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

  CharacterSheetWM(CharacterSheetModel model) : super(model);

  @override
  void initWidgetModel() {
    _currentHpNotifier.value = model.currentHp;
    _currentStampNotifier.value = model.currentStam;
    _damageLogNotifier.value = model.damageLog;
    _totalDamageNotifier.value = model.totalDamage;
    _currentResolveNotifier.value = model.currentResolve;
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
  goBack() {
    //context.pop(true);
  }

  @override
  Ability getAbility() {
    return model.getAbility();
  }

  @override
  int get totalHp => model.totalHp;

  @override
  int get totalStam => model.totalStam;

  @override
  int get totalResolve => model.totalResolve;

  @override
  int get currentResolve => model.currentResolve;

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
    if (model.totalHp <= (value + model.currentHp)) {
      model.setCurrentHp(model.totalHp);
    } else {
      model.addHp(value);
    }

    _currentHpNotifier.value = model.currentHp;
  }

  @override
  void healStam(int value) {
    if (model.totalStam <= (value + model.currentStam)) {
      model.setCurrentStam(model.totalStam);
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

  // void pickImage() async {
  //   try {
  //     XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image?.path != null) {
  //       imagePathNotifier.value = File(image?.path ?? '');
  //     }
  //   } catch (e) {
  //     log('Smth going wrong with picking image: $e');
  //   }
  // }

  // void deleteImage() {
  //   imagePathNotifier.value = null;
  // }

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
