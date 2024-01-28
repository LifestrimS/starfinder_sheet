import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/settings/settings_model.dart';
import 'package:pathfinder_sheet/settings/settings_view.dart';

SettingsWM createSettingsWM(BuildContext _) => SettingsWM(
      SettingsModel(),
    );

class SettingsWM extends WidgetModel<SettingsView, SettingsModel> {
  SettingsWM(super.model);

  goBack() {
    context.goNamed('characterList');
  }
}
