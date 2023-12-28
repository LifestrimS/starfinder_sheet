import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/character_Info/character_info_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class CharacterInfoView extends ElementaryWidget<CharacterInfoWM> {
  const CharacterInfoView({Key? key}) : super(createCharacterInfoWM, key: key);

  @override
  Widget build(CharacterInfoWM wm) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Title')),
          backgroundColor: AppColors.accentGreen,
        ),
        body: Center(
          child: Image.asset('assets/images/present.jpg'),
        ));
  }
}
