import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/character_Info/character_info_model.dart';
import 'package:pathfinder_sheet/character_Info/character_info_view.dart';

CharacterInfoWM createCharacterInfoWM(BuildContext _) => CharacterInfoWM(
      CharacterInfoModel(),
    );

class CharacterInfoWM
    extends WidgetModel<CharacterInfoView, CharacterInfoModel> {
  CharacterInfoWM(super.model);

  void goSettings() {
    context.goNamed('settings');
  }
}
