import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class CharacterCreationView extends ElementaryWidget<CharacterCreationWM> {
  const CharacterCreationView({Key? key})
      : super(createCharacterCreationWM, key: key);

  @override
  Widget build(CharacterCreationWM wm) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'CHARACTER CREATION',
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.appBarColor,
          leading: IconButton(
              onPressed: wm.goBack,
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              )),
        ),
        body: const Text('Character Creation'));
  }
}
