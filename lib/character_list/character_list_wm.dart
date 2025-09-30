import 'dart:ui' as ui;

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/character_list/character_list_model.dart';
import 'package:pathfinder_sheet/character_list/character_list_view.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/utils/routes.dart';
import 'package:pathfinder_sheet/utils/theme.dart';
import 'package:provider/provider.dart';

CharacterListWM createCharacterListWM(BuildContext _) => CharacterListWM(
      CharacterListModel(),
      GetIt.I.get(),
    );

class CharacterListWM
    extends WidgetModel<CharacterListView, CharacterListModel> {
  CharacterListWM(
    super.model,
    this._repository,
  );

  final Repository _repository;

  final List<Character> characterList = [];
  int j = 0;

  //-1 -> loading state
  ValueNotifier<int> characterLenghtNotifire = ValueNotifier<int>(-1);

  get theme => context.watch<AppTheme>();

  @override
  void initWidgetModel() {
    loadData();
    super.initWidgetModel();
  }

  void addCharacter() {
    Character character = Character.empty();
    j++;
    characterList.add(character);
    characterLenghtNotifire.value = characterList.length;
  }

  void goCharacterCreation() async {
    bool result = await context.pushNamed(Routes.characterCreation) as bool;
    if (result) {
      characterLenghtNotifire.value = -1;
      await loadData();
    }
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Character> characters = await _repository.getAllCharacter();
    characterList.clear();
    characterList.addAll(characters);
    characterLenghtNotifire.value = characterList.length;
  }

  void goDebug() async {
    bool result = await context.pushNamed(Routes.debug) as bool;
    if (result) {
      characterLenghtNotifire.value = -1;
      await loadData();
    }
  }

  void onRefresh() async {
    loadData();
  }

  @override
  void dispose() {
    characterLenghtNotifire.dispose();
    super.dispose();
  }

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
