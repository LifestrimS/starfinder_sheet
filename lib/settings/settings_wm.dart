import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/character_list/character_list_model.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/settings/settings_model.dart';
import 'package:pathfinder_sheet/settings/settings_view.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/theme.dart';
import 'package:provider/provider.dart';

SettingsWM createSettingsWM(BuildContext _) =>
    SettingsWM(SettingsModel(), GetIt.I.get(), GetIt.I.get());

class SettingsWM extends WidgetModel<SettingsView, SettingsModel> {
  SettingsWM(super.model, this._repository, this._theme);

  final Repository _repository;
  final AppTheme _theme;

  ValueNotifier<AppThemeEnum> selectedTheme =
      ValueNotifier<AppThemeEnum>(AppThemeEnum.lightTheme);

  get selectedThemeValue => selectedTheme.value;

  get theme => context.watch<AppTheme>();

  @override
  initWidgetModel() {
    selectedTheme.value = _theme.themeEnum;
    super.initWidgetModel();
  }

  goBack() {
    context.goNamed('characterList');
  }

  void onThemeTapped(AppThemeEnum theme) {
    selectedTheme.value = theme;
    _theme.setTheme(theme);
  }

  Color getThemeColor(AppThemeEnum theme) {
    switch (theme) {
      case AppThemeEnum.lightTheme:
        return AppColors.backgroundLight;
      case AppThemeEnum.darkTheme:
        return AppColors.backgroundDark;
      default:
        return Colors.red;
    }
  }

  @override
  void dispose() {
    selectedTheme.dispose();
    super.dispose();
  }

//Временные примеры функций для БД
  void addCharacter() async {
    for (int i = 0; i < 4; i++) {
      final id = await _repository
          .addCharacter(Character(id: 0, name: 'name_$i', chClass: 'chClass'));
      log('Insert id: $id');
    }
  }

  void getCharacterById() async {
    Character character = await _repository.getCharacterById(0);
    log('getCharacterById ${character.toString()}');
  }

  void getAllCharacters() async {
    List<Character> characters = await _repository.getAllCharacter();
    log('All characters: ${characters.toString()}');
  }

  void updateCharacter() async {
    _repository.updateCharacter(
        Character(id: 5, name: 'name_555', chClass: 'chClass'));
  }

  void deleteCharacter() async {
    _repository.deleteCharacterbyId(0);
  }

  void deleteAllCharacter() async {
    _repository.deleteAllCharacters();
  }
}
