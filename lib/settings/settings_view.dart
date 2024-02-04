import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/settings/settings_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class SettingsView extends ElementaryWidget<SettingsWM> {
  const SettingsView({Key? key}) : super(createSettingsWM, key: key);

  @override
  Widget build(SettingsWM wm) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'SETTINGS',
            style: TextStyle(color: AppColors.textLightLight),
          ),
          backgroundColor: AppColors.accent1Light,
          leading: IconButton(
              onPressed: wm.goBack,
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.textLightLight,
              )),
        ),
        body: const Text('Settings'));
  }
}
