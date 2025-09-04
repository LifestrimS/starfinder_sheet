import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  AppThemeEnum themeEnum = AppThemeEnum.lightTheme;
  final String key = "theme";
  SharedPreferences? _prefs;

  Future initTheme() async {
    await _loadprefs();
  }

  void setTheme(AppThemeEnum theme) {
    themeEnum = theme;
    _saveprefs();
  }

  Color getBackgroundColor() {
    switch (themeEnum) {
      case AppThemeEnum.lightTheme:
        return AppColors.backgroundLight;
      case AppThemeEnum.darkTheme:
        return AppColors.backgroundDark;
    }
  }

  Color getAccent1Color() {
    switch (themeEnum) {
      case AppThemeEnum.lightTheme:
        return AppColors.accent1Light;
      case AppThemeEnum.darkTheme:
        return AppColors.accent1Dark;
    }
  }

  Color getAccent2Color() {
    switch (themeEnum) {
      case AppThemeEnum.lightTheme:
        return AppColors.accent2Light;
      case AppThemeEnum.darkTheme:
        return AppColors.accent2Dark;
    }
  }

  Color getTextColor() {
    switch (themeEnum) {
      case AppThemeEnum.lightTheme:
        return AppColors.textLight;
      case AppThemeEnum.darkTheme:
        return AppColors.textDark;
    }
  }

  Color getTextContrastColor() {
    switch (themeEnum) {
      case AppThemeEnum.lightTheme:
        return AppColors.textContrastLight;
      case AppThemeEnum.darkTheme:
        return AppColors.textContrastDark;
    }
  }

  Color getSecondaryColor() {
    switch (themeEnum) {
      case AppThemeEnum.lightTheme:
        return AppColors.secondaryLight;
      case AppThemeEnum.darkTheme:
        return AppColors.secondaryDark;
    }
  }

  _initiateprefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadprefs() async {
    await _initiateprefs();
    themeEnum = getThemeByInt(_prefs?.getInt(key) ?? 0);
    notifyListeners();
  }

  _saveprefs() async {
    await _initiateprefs();
    _prefs?.setInt(key, themeEnum.index);
    notifyListeners();
  }

  AppThemeEnum getThemeByInt(int index) {
    switch (index) {
      case 0:
        return AppThemeEnum.lightTheme;
      case 1:
        return AppThemeEnum.darkTheme;
      default:
        return AppThemeEnum.lightTheme;
    }
  }
}

enum AppThemeEnum { lightTheme, darkTheme }
