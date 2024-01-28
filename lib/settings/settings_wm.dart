import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/settings/settings_model.dart';
import 'package:pathfinder_sheet/settings/settings_view.dart';

class SettingsWM extends WidgetModel<SettingsView, SettingsModel> {
  SettingsWM(super.model);
}

SettingsWM createSettingsWM(BuildContext _) => SettingsWM(
      SettingsModel(),
    );
