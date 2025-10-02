import 'dart:ui' as ui;

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_model.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/screens/character_list/main_screen_view.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/utils/debug_screen.dart';

abstract interface class IMainScreenWM implements IWidgetModel {
  void onRefresh();

  void goDebug();

  Widget goToCharacter({int? charId, bool isNew});

  double screenHeight();

  EntityStateNotifier<int> characterLenghtNotifire();

  int get characterLength;

  List<Character> get characterList;
}

MainScreenWM createMainScreenWM(BuildContext _) => MainScreenWM(
      CharacterSheetModel(
        repository: GetIt.I.get(),
      ),
      GetIt.I.get(),
    );

class MainScreenWM extends WidgetModel<MainScreenView, CharacterSheetModel>
    implements IMainScreenWM {
  final EntityStateNotifier<int> _characterLenghtNotifire =
      EntityStateNotifier(EntityState.loading());

  final Repository _repository;

  final List<Character> _characterList = [];

  @override
  EntityStateNotifier<int> characterLenghtNotifire() =>
      _characterLenghtNotifire;

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

  @override
  void goDebug() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DebugScreen()));
  }

  Future<void> loadData() async {
    _characterLenghtNotifire.loading();
    await Future.delayed(const Duration(seconds: 1));
    List<Character> characters = await _repository.getAllCharacter();
    _characterList.clear();
    _characterList.addAll(characters);
    _characterLenghtNotifire.content(_characterList.length);
  }

  @override
  Widget goToCharacter({int? charId, bool isNew = false}) {
    return Center(
      child: Text('goToCharacter'),
    );
    // if (isNew) {}
    // if (charId == null) {
    //   return CharacterSheetView(
    //     charIndex: _characterList.first.id,
    //     model: CharacterSheetModel(
    //         charIndex: _characterList.first.id,
    //         repository: GetIt.I.get(),
    //         isNew: isNew),
    //   );
    // } else {
    //   return CharacterSheetView(
    //     charIndex: charId,
    //     model: CharacterSheetModel(
    //         charIndex: charId, repository: GetIt.I.get(), isNew: isNew),
    //   );
    // }
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
