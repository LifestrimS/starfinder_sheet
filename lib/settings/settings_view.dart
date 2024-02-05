import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/settings/settings_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/theme.dart';

class SettingsView extends ElementaryWidget<SettingsWM> {
  const SettingsView({Key? key}) : super(createSettingsWM, key: key);

  @override
  Widget build(SettingsWM wm) {
    AppTheme theme = wm.theme;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'SETTINGS',
            style: TextStyle(
                color: theme.getTextColor(),
                fontSize: 32.0,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: theme.getAccent1Color(),
          leading: IconButton(
              onPressed: wm.goBack,
              icon: Icon(
                Icons.arrow_back,
                color: theme.getTextColor(),
              )),
        ),
        backgroundColor: theme.getBackgroundColor(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 21.0, horizontal: 20.0),
          child: Column(
            children: [
              ValueListenableBuilder<AppThemeEnum>(
                  valueListenable: wm.selectedTheme,
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        Text(
                          'Color theme:',
                          style: TextStyle(
                              color: theme.getTextContrastColor(),
                              fontSize: 24.0),
                        ),
                        const Spacer(),
                        ColorRound(
                          wm: wm,
                          theme: AppThemeEnum.lightTheme,
                          isSelected: value == AppThemeEnum.lightTheme,
                        ),
                        const SizedBox(
                          width: 14.0,
                        ),
                        ColorRound(
                          wm: wm,
                          theme: AppThemeEnum.darkTheme,
                          isSelected: value == AppThemeEnum.darkTheme,
                        )
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}

class ColorRound extends StatelessWidget {
  final SettingsWM wm;
  final AppThemeEnum theme;
  final bool isSelected;
  const ColorRound(
      {required this.wm,
      required this.theme,
      required this.isSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = isSelected ? const Size(40.0, 40.0) : const Size(32.0, 32.0);

    return GestureDetector(
      onTap: () {
        wm.onThemeTapped(theme);
      },
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: isSelected
                    ? AppColors.accent2Light
                    : AppColors.textContrastLight),
            color: wm.getThemeColor(theme)),
      ),
    );
  }
}
