import 'dart:ui' as ui;

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/screens/character_list/character_list_model.dart';
import 'package:pathfinder_sheet/screens/character_list/character_list_view.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';

abstract interface class ICharacterListWM implements IWidgetModel {
  void onRefresh();

  double screenHeight();

  ValueNotifier<int> characterLenghtNotifire();

  int get characterLength;
}

CharacterListWM createCharacterListWM(BuildContext _) => CharacterListWM(
      CharacterListModel(),
      GetIt.I.get(),
    );

class CharacterListWM extends WidgetModel<CharacterListView, CharacterListModel>
    implements ICharacterListWM {
  //-1 -> loading state
  final ValueNotifier<int> _characterLenghtNotifire = ValueNotifier<int>(-1);

  final Repository _repository;

  final List<Character> characterList = [];
  int j = 0;

  //-1 -> loading state
  @override
  ValueNotifier<int> characterLenghtNotifire() => _characterLenghtNotifire;

  CharacterListWM(
    super.model,
    this._repository,
  );

  @override
  void initWidgetModel() {
    loadData();
    super.initWidgetModel();
  }

  @override
  int get characterLength => 7; //characterList.length;

  void addCharacter() {
    Character character = Character.empty();
    j++;
    characterList.add(character);
    _characterLenghtNotifire.value = characterList.length;
  }

  // void goCharacterCreation() async {
  //   bool result = await context.pushNamed(Routes.characterCreation) as bool;
  //   if (result) {
  //     characterLenghtNotifire.value = -1;
  //     await loadData();
  //   }
  // }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Character> characters = await _repository.getAllCharacter();
    characterList.clear();
    characterList.addAll(characters);
    _characterLenghtNotifire.value = characterList.length;
  }

  @override
  void onRefresh() async {
    loadData();
  }

  @override
  void dispose() {
    _characterLenghtNotifire.dispose();
    super.dispose();
  }

  @override
  double screenHeight() {
    ui.FlutterView view =
        WidgetsBinding.instance.platformDispatcher.views.first;
    // Dimensions in logical pixels (dp)
    ui.Size size = view.physicalSize / view.devicePixelRatio;
    double height = size.height;

    //hald of screen - appbar size
    return height / 2 - 70;
  }
}
