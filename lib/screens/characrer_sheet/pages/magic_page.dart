import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class MagicPage extends StatefulWidget {
  final ICharacterSheetWM wm;
  const MagicPage({required this.wm, super.key});

  @override
  State<MagicPage> createState() => _MagicPageState();
}

class _MagicPageState extends State<MagicPage> {
  String ability = '';
  String initialValue = '';

  @override
  void initState() {
    ability = 'WIS';
    initialValue = 'WIS';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      wm: widget.wm,
      content: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ValueListenableBuilder<int>(
            valueListenable: getNotifier(innerAbilityName(ability)),
            builder: (context, abilityMod, child) {
              return Row(
                children: [
                  PopupMenuButton(
                    padding: EdgeInsets.zero,
                    menuPadding: EdgeInsets.zero,
                    position: PopupMenuPosition.under,
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    color: AppColors.darkBlue,
                    icon: Text(
                      ability == '' ? initialValue : ability,
                      textAlign: TextAlign.end,
                      style: AppStyles.commonPixel().copyWith(
                        color: AppColors.darkPink,
                      ),
                    ),
                    initialValue: ability,
                    itemBuilder: (BuildContext context) => AbilityEnum.values
                        .map<PopupMenuItem<String>>(
                          (AbilityEnum ability) => PopupMenuItem<String>(
                            value: ability.stringName(),
                            child: Text(
                              ability.stringName(),
                              textAlign: TextAlign.end,
                              style: AppStyles.commonPixel(),
                            ),
                          ),
                        )
                        .toList(),
                    onSelected: (value) => setState(() {
                      ability = value;
                    }),
                  ),
                  Text(
                    'mod: $abilityMod',
                    style: AppStyles.commonPixel().copyWith(
                      color: AppColors.darkPink,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Base DC: ${10 + abilityMod}',
                    style: AppStyles.commonPixel().copyWith(
                      color: AppColors.darkPink,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  getNotifier(AbilityEnum abilityEnum) {
    switch (abilityEnum) {
      case AbilityEnum.str:
        return widget.wm.strModificatorNotifier();
      case AbilityEnum.dex:
        return widget.wm.dexModificatorNotifier();
      case AbilityEnum.con:
        return widget.wm.conModificatorNotifier();
      case AbilityEnum.charint:
        return widget.wm.intModificatorNotifier();
      case AbilityEnum.wis:
        return widget.wm.wisModificatorNotifier();
      case AbilityEnum.cha:
        return widget.wm.chaModificatorNotifier();
    }
  }

  AbilityEnum innerAbilityName(String ability) {
    if (ability == 'STR') return AbilityEnum.str;
    if (ability == 'DEX') return AbilityEnum.dex;
    if (ability == 'CON') return AbilityEnum.con;
    if (ability == 'INT') return AbilityEnum.charint;
    if (ability == 'WIS') return AbilityEnum.wis;
    if (ability == 'CHA') return AbilityEnum.cha;
    return AbilityEnum.str;
  }
}
