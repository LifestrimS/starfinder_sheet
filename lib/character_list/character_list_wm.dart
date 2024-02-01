import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
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

  ValueNotifier<List<Character>> characterListNotifire = ValueNotifier([]);

  @override
  void initWidgetModel() {
    //generateCharacterList();
    super.initWidgetModel();
  }

  void generateCharacterList() {
    for (int i = 0; i < 3; i++) {
      Character character = Character(name: 'name_$i', chClass: 'chClass_$i');
      characterList.add(character);
      characterListNotifire.value = characterList;
    }
  }

  void addCharacter() {
    log('add_character');
    Character character =
        Character(name: 'add_name_$j', chClass: 'add_chClass_$j');
    j++;
    characterList.add(character);
    characterListNotifire.value = characterList;
    characterListNotifire.notifyListeners();
    log('character list ${characterList.length}, notifire ${characterListNotifire.value.length}');
  }
}
