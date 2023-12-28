import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/character_Info/character_info_model.dart';
import 'package:pathfinder_sheet/character_Info/character_info_view.dart';

class CharacterInfoWM
    extends WidgetModel<CharacterInfoView, CharacterInfoModel> {
  CharacterInfoWM(super.model);
}

CharacterInfoWM createCharacterInfoWM(BuildContext _) => CharacterInfoWM(
      CharacterInfoModel(),
    );
