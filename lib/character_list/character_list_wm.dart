import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/character_list/character_list_model.dart';
import 'package:pathfinder_sheet/character_list/character_list_view.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/utils/theme.dart';
import 'package:provider/provider.dart';

CharacterListWM createCharacterListWM(BuildContext _) => CharacterListWM(
      CharacterListModel(),
    );

class CharacterListWM
    extends WidgetModel<CharacterListView, CharacterListModel> {
  CharacterListWM(super.model);

  final List<Character> characterList = [];
  int j = 0;

  ValueNotifier<int> characterLenghtNotifire = ValueNotifier<int>(0);

  get theme => context.watch<AppTheme>();

  @override
  void initWidgetModel() {
    //generateCharacterList();
    super.initWidgetModel();
  }

  void generateCharacterList() {
    for (int i = 0; i < 3; i++) {
      Character character = Character.empty();
      characterList.add(character);
      characterLenghtNotifire.value = characterList.length;
    }
  }

  void addCharacter() {
    log('add_character');
    Character character = Character.empty();
    j++;
    characterList.add(character);
    characterLenghtNotifire.value = characterList.length;
  }

  void goSettings() {
    context.goNamed('settings');
  }

  void goCharacterCreation() {
    context.goNamed('characterCreation');
  }
}
