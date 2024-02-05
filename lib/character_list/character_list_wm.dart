import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/character_list/character_list_model.dart';
import 'package:pathfinder_sheet/character_list/character_list_view.dart';

CharacterListWM createCharacterListWM(BuildContext _) => CharacterListWM(
      CharacterListModel(),
    );

class CharacterListWM
    extends WidgetModel<CharacterListView, CharacterListModel> {
  CharacterListWM(super.model);

  final List<Character> characterList = [];
  int j = 0;

  ValueNotifier<int> characterLenghtNotifire = ValueNotifier<int>(0);

  @override
  void initWidgetModel() {
    //generateCharacterList();
    super.initWidgetModel();
  }

  void generateCharacterList() {
    for (int i = 0; i < 3; i++) {
      Character character =
          Character(id: 0, name: 'name_$i', chClass: 'chClass_$i');
      characterList.add(character);
      characterLenghtNotifire.value = characterList.length;
    }
  }

  void addCharacter() {
    log('add_character');
    Character character =
        Character(id: 0, name: 'add_name_$j', chClass: 'add_chClass_$j');
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
