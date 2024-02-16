import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_model.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_view.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/utils/theme.dart';
import 'package:provider/provider.dart';

CharacterCreationWM createCharacterCreationWM(BuildContext _) =>
    CharacterCreationWM(
      CharacterCreationModel(),
      GetIt.I.get(),
    );

class CharacterCreationWM
    extends WidgetModel<CharacterCreationView, CharacterCreationModel> {
  CharacterCreationWM(
    super.model,
    this._repository,
  );

  final Repository _repository;

  get theme => context.watch<AppTheme>();

  ValueNotifier<Color> backgroundColor = ValueNotifier<Color>(Colors.grey);
  ValueNotifier<Color> textImageColor = ValueNotifier<Color>(Colors.white);
  ValueNotifier<Color> hairColor = ValueNotifier<Color>(Colors.grey);
  ValueNotifier<Color> eyeColor = ValueNotifier<Color>(Colors.grey);

  ValueNotifier<File?> imagePathNotifier = ValueNotifier<File?>(null);

  TextEditingController nameTextController = TextEditingController();
  TextEditingController deiterityTextController = TextEditingController();
  TextEditingController ageTextController = TextEditingController();
  TextEditingController weightTextController = TextEditingController();
  TextEditingController heightTextController = TextEditingController();
  TextEditingController lvlTextController = TextEditingController();

  ValueNotifier<String> alignmentNotifier =
      ValueNotifier<String>(CharAlignment.lg.alignName);
  ValueNotifier<String> racetNotifier =
      ValueNotifier<String>(Race.race0.raceName);
  ValueNotifier<String> genderNotifier =
      ValueNotifier<String>(Gender.female.genderName);
  ValueNotifier<String> sizeNotifier = ValueNotifier<String>(Size.m.sizeName);
  ValueNotifier<String> classNotifier =
      ValueNotifier<String>(ChClass.class0.chClassName);

  goBack() {
    context.goNamed('characterList');
  }

  void pickImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image?.path != null) {
        imagePathNotifier.value = File(image?.path ?? '');
      }
    } catch (e) {
      log('Smth going wrong with picking image: $e');
    }
  }

  double getColumnWidth() {
    ui.FlutterView view =
        WidgetsBinding.instance.platformDispatcher.views.first;
// Dimensions in logical pixels (dp)
    ui.Size size = view.physicalSize / view.devicePixelRatio;
    double width = size.width;
    final quartScreen = (width - 40) / 4;

    return (width - 40 - quartScreen) / 2;
  }

  void deleteImage() {
    imagePathNotifier.value = null;
  }

  void save() async {
    CharacterBio bio = CharacterBio(
        id: 0,
        alignment: CharAlignment.values.firstWhere(
            (e) => e.toString() == 'CharAlignment.${alignmentNotifier.value}'),
        deiterity: deiterityTextController.text,
        race: Race.values
            .firstWhere((e) => e.toString() == 'Race.${racetNotifier.value}'),
        age: int.parse(
            ageTextController.text == '' ? '0' : ageTextController.text),
        gender: Gender.values.firstWhere(
            (e) => e.toString() == 'Gender.${genderNotifier.value}'),
        size: Size.values
            .firstWhere((e) => e.toString() == 'Size.${sizeNotifier.value}'),
        weight: double.parse(weightTextController.text == ''
            ? '0.0'
            : weightTextController.text),
        height: double.parse(heightTextController.text == ''
            ? '0.0'
            : heightTextController.text),
        hairColor: hairColor.value,
        eyeColor: eyeColor.value);

    Character character = Character(
        id: 0,
        name: nameTextController.text,
        chClass: ChClass.values.firstWhere(
            (e) => e.toString() == 'ChClass.${classNotifier.value}'),
        lvl: int.parse(
            lvlTextController.text == '' ? '0' : lvlTextController.text),
        textColor: textImageColor.value,
        bio: bio);

    log('Save\nCharacter: ${character.toString()}');

    try {
      await _repository.addCharacter(character);
    } catch (e) {
      log('Smth get wrond on add character to db: $e');
    }
  }
}
