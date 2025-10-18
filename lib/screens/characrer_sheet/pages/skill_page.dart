import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/util_widgets/border.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class SkillsPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const SkillsPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    List<Skill> skills = Skill.createCommonSkills();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const Devider(title: 'Skills', topPadding: 12.0),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: skills.length,
              itemBuilder: (BuildContext context, int index) {
                return SkillBlock(skill: skills[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SkillBlock extends StatelessWidget {
  final Skill skill;
  const SkillBlock({required this.skill, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.0, top: 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //getVerticalText(getAbilityName(skill.ability)),
          //const SizedBox(width: 8.0),
          RotatedBox(
            quarterTurns: 1,
            child: Text(
              getAbilityName(skill.ability),
              style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(child: Text(skill.name, style: AppStyles.commonPixel())),
          const SizedBox(width: 8.0),

          CustomPaint(
            painter: const FullBorderPainter(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                getValue().toString(),
                style: AppStyles.commonPixel(),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          CustomPaint(
            painter: const FullBorderPainter(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                skill.ranks.toString(),
                style: AppStyles.commonPixel(),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          CustomPaint(
            painter: const FullBorderPainter(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                skill.misc.toString(),
                style: AppStyles.commonPixel(),
              ),
            ),
          ),
          const SizedBox(width: 1.0),
        ],
      ),
    );
  }

  String getAbilityName(String ability) {
    AbilityEnum abilityEnum = AbilityEnum.values.firstWhere(
      (element) => element.name == ability,
    );

    switch (abilityEnum) {
      case AbilityEnum.str:
        return 'STR';
      case AbilityEnum.dex:
        return 'DEX';
      case AbilityEnum.con:
        return 'CON';
      case AbilityEnum.charint:
        return 'INT';
      case AbilityEnum.wis:
        return 'WIS';
      case AbilityEnum.cha:
        return 'CHA';
    }
  }

  Widget getVerticalText(String text) {
    List<Widget> listWidget = [];

    for (int i = 0; i < text.length; i++) {
      listWidget.add(
        Text(text[i], style: AppStyles.commonPixel().copyWith(fontSize: 6.0)),
      );
    }

    return Column(children: [...listWidget]);
  }

  int getValue() {
    return 12;
  }
}
