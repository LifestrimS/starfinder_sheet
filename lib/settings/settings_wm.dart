import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/settings/settings_model.dart';
import 'package:pathfinder_sheet/settings/settings_view.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/theme.dart';
import 'package:provider/provider.dart';

SettingsWM createSettingsWM(BuildContext _) => SettingsWM(
    SettingsModel(),
    //GetIt.I.get(),
    GetIt.I.get());

class SettingsWM extends WidgetModel<SettingsView, SettingsModel> {
  SettingsWM(
      super.model,
      //this._repository,
      this._theme);

  //final Repository _repository;
  final AppTheme _theme;

  ValueNotifier<AppThemeEnum> selectedTheme =
      ValueNotifier<AppThemeEnum>(AppThemeEnum.darkTheme);

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
    }
  }

  @override
  void dispose() {
    selectedTheme.dispose();
    super.dispose();
  }

//Временные примеры функций для БД
  // void addCharacter() async {
  //   for (int i = 0; i < 4; i++) {
  //     final id =
  //         await _repository.addCharacter(Character.empty().copyWith(lvl: i));
  //     log('Insert id: $id');
  //   }
  // }

  // void getCharacterById() async {
  //   Character character = await _repository.getCharacterById(0);
  //   log('getCharacterById ${character.toString()}');
  // }

  // void getAllCharacters() async {
  //   List<Character> characters = await _repository.getAllCharacter();
  //   log('Length: ${characters.length}\nAll characters: ${characters.toString()}');
  // }

  // void updateCharacter() async {
  //   final char = Character.empty().copyWith(id: 1, lvl: 5);
  //   _repository.updateCharacter(char);
  // }

  // void deleteCharacter() async {
  //   _repository.deleteCharacterbyId(0);
  // }

  // void deleteAllCharacter() async {
  //   _repository.deleteAllCharacters();
  // }
}
