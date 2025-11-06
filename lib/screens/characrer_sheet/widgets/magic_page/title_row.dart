import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class TitleRow extends StatefulWidget {
  final ValueNotifier strModNotifier;
  final ValueNotifier dexModNotifier;
  final ValueNotifier conModNotifier;
  final ValueNotifier intModNotifier;
  final ValueNotifier wisModNotifier;
  final ValueNotifier chaModNotifier;
  const TitleRow({
    required this.strModNotifier,
    required this.dexModNotifier,
    required this.conModNotifier,
    required this.intModNotifier,
    required this.wisModNotifier,
    required this.chaModNotifier,
    super.key,
  });

  @override
  State<TitleRow> createState() => _TitleRowState();
}

class _TitleRowState extends State<TitleRow> {
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
    return Padding(
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
                  style: AppStyles.commonPixel(),
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
              Text('mod: $abilityMod', style: AppStyles.commonPixel()),
              const Spacer(),
              Text(
                'Base DC: ${10 + abilityMod}',
                style: AppStyles.commonPixel(),
              ),
            ],
          );
        },
      ),
    );
  }

  getNotifier(AbilityEnum abilityEnum) {
    switch (abilityEnum) {
      case AbilityEnum.str:
        return widget.strModNotifier;
      case AbilityEnum.dex:
        return widget.dexModNotifier;
      case AbilityEnum.con:
        return widget.conModNotifier;
      case AbilityEnum.charint:
        return widget.intModNotifier;
      case AbilityEnum.wis:
        return widget.wisModNotifier;
      case AbilityEnum.cha:
        return widget.chaModNotifier;
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
