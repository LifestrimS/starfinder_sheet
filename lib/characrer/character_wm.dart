import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/characrer/character_model.dart';
import 'package:pathfinder_sheet/characrer/character_view.dart';
import 'package:pathfinder_sheet/characrer/widgets/ability_block.dart';

abstract interface class ICharacterWM implements IWidgetModel {
  Ability getAbility();

  void goBack();
}

CharacterWM createCharacterWM(BuildContext _) => CharacterWM(
      CharacterModel(GetIt.I.get()),
    );

class CharacterWM extends WidgetModel<CharacterView, CharacterModel>
    implements ICharacterWM {
  CharacterWM(CharacterModel model) : super(model);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  goBack() {
    context.pop(true);
  }

  @override
  Ability getAbility() {
    return model.getAbility();
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
