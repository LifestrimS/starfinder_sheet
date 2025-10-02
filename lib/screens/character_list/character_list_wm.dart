import 'dart:ui' as ui;

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_model.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/screens/character_list/character_list_view.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';

abstract interface class IMainScreenWM implements IWidgetModel {
  void onRefresh();

  Widget goToCharacter({int? charId, bool isNew});

  double screenHeight();

  ValueNotifier<int> characterLenghtNotifire();

  int get characterLength;

  List<Character> get characterList;
}

MainScreenWM createMainScreenWM(BuildContext _) => MainScreenWM(
      CharacterSheetModel(
          charIndex: -1, repository: GetIt.I.get(), isNew: false),
      GetIt.I.get(),
    );

class MainScreenWM extends WidgetModel<MainScreenView, CharacterSheetModel>
    implements IMainScreenWM {
  //-1 -> loading state
  final ValueNotifier<int> _characterLenghtNotifire = ValueNotifier<int>(-1);

  final Repository _repository;

  final List<Character> _characterList = [];
  int j = 0;

  //-1 -> loading state
  @override
  ValueNotifier<int> characterLenghtNotifire() => _characterLenghtNotifire;

  @override
  List<Character> get characterList => _characterList;

  MainScreenWM(
    super.model,
    this._repository,
  );

  @override
  void initWidgetModel() {
    loadData();
    super.initWidgetModel();
  }

  @override
  int get characterLength => characterList.length;

  void addCharacter() {
    Character character = Character.empty();
    j++;
    _characterList.add(character);
    _characterLenghtNotifire.value = _characterList.length;
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Character> characters = await _repository.getAllCharacter();
    _characterList.clear();
    _characterList.addAll(characters);
    _characterLenghtNotifire.value = _characterList.length;
  }

  @override
  Widget goToCharacter({int? charId, bool isNew = false}) {
    if (isNew) {}
    if (charId == null) {
      return CharacterSheetView(charIndex: _characterList.first.id);
    } else {
      return CharacterSheetView(charIndex: charId);
    }
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
