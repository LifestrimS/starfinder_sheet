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
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.mainBackground,
        ),
        body: const Text('Settings'));
  }
}
