import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_model.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_view.dart';

CharacterCreationWM createCharacterCreationWM(BuildContext _) =>
    CharacterCreationWM(
      CharacterCreationModel(),
    );

class CharacterCreationWM
    extends WidgetModel<CharacterCreationView, CharacterCreationModel> {
  CharacterCreationWM(super.model);

  goBack() {
    context.goNamed('characterList');
  }
}
