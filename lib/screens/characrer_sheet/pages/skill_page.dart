import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';
import 'package:pathfinder_sheet/util_widgets/dialog.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class SkillsPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  final ValueNotifier<int> strModificatorNotifier;
  final ValueNotifier<int> dexModificatorNotifier;
  final ValueNotifier<int> intModificatorNotifier;
  final ValueNotifier<int> wisModificatorNotifier;
  final ValueNotifier<int> chaModificatorNotifier;
  final List<SkillControllers> skillsControllers;
  final ValueNotifier<int> chkPenaltyNotifier;

  const SkillsPage({
    required this.wm,
    required this.strModificatorNotifier,
    required this.dexModificatorNotifier,
    required this.intModificatorNotifier,
    required this.wisModificatorNotifier,
    required this.chaModificatorNotifier,
    required this.skillsControllers,
    required this.chkPenaltyNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Skill> skills = wm.skillList.skills;

    return PageTemplate(
      wm: wm,
      content: [
        const Devider(title: 'Skills', topPadding: 12.0),

        ListView.builder(
          shrinkWrap: true,
          itemCount: skills.length,
          physics: const NeverScrollableScrollPhysics(),

          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SkillBlock(
                  isFirst: index == 0 ? true : false,
                  skill: skills[index],
                  abilityNotifier: getNotifier(skills[index].ability),
                  controllers: getControllers(skills[index].name),
                  chkPenaltyNotifier: chkPenaltyNotifier,
                ),
                Container(
                  height: 1.0,
                  color: Colors.blueGrey,
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  SkillControllers getControllers(String skillName) {
    return skillsControllers.firstWhere((element) => element.name == skillName);
  }

  getNotifier(String ability) {
    AbilityEnum abilityEnum = AbilityEnum.values.firstWhere(
      (element) => element.name == ability,
    );
    switch (abilityEnum) {
      case AbilityEnum.str:
        return strModificatorNotifier;
      case AbilityEnum.dex:
        return dexModificatorNotifier;

      case AbilityEnum.charint:
        return intModificatorNotifier;
      case AbilityEnum.wis:
        return wisModificatorNotifier;
      case AbilityEnum.cha:
        return chaModificatorNotifier;
      default:
        return dexModificatorNotifier;
    }
  }
}

class SkillBlock extends StatefulWidget {
  final bool isFirst;
  final Skill skill;
  final ValueNotifier<int> abilityNotifier;
  final SkillControllers controllers;
  final ValueNotifier<int> chkPenaltyNotifier;

  const SkillBlock({
    required this.isFirst,
    required this.skill,
    required this.abilityNotifier,
    required this.controllers,
    required this.chkPenaltyNotifier,
    super.key,
  });

  @override
  State<SkillBlock> createState() => _SkillBlockState();
}

class _SkillBlockState extends State<SkillBlock> {
  final ValueNotifier<int> rankNotifier = ValueNotifier(0);

  @override
  void initState() {
    if (widget.controllers.rankController.text.isEmpty) {
      widget.controllers.rankController.text = '0';
    }

    rankNotifier.value = parseIntFromString(
      widget.controllers.rankController.text,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              if (widget.isFirst) const SizedBox(height: 19.0),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    getAbilityName(widget.skill.ability),
                    style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8.0),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.isFirst)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Name',
                      style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
                    ),
                  ),
                SizedBox(
                  height: 30.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.skill.name,

                      style: AppStyles.commonPixel().copyWith(
                        fontSize: 9.0,
                        color: math.Random().nextInt(100) > 50
                            ? AppColors.white
                            : AppColors.darkPink,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isFirst)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Skill',
                    style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
                  ),
                ),
              ValueListenableBuilder(
                valueListenable: widget.chkPenaltyNotifier,
                builder: (context, chkPenalty, child) {
                  return ValueListenableBuilder(
                    valueListenable: rankNotifier,
                    builder: (context, rankValue, child) {
                      return ValueListenableBuilder(
                        valueListenable: widget.abilityNotifier,
                        builder: (context, abilityModValue, child) {
                          return SizedBox(
                            height: 30.0,
                            width: 42.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                                vertical: 8.0,
                              ),
                              child: Text(
                                countValue(
                                          abilityModValue: abilityModValue,
                                          rankValue: rankValue,
                                          chkPenalty: chkPenalty,
                                        ) >=
                                        0
                                    ? '+${countValue(abilityModValue: abilityModValue, rankValue: rankValue, chkPenalty: chkPenalty)}'
                                    : countValue(
                                        abilityModValue: abilityModValue,
                                        rankValue: rankValue,
                                        chkPenalty: chkPenalty,
                                      ).toString(),
                                style: AppStyles.commonPixel().copyWith(
                                  fontSize: 9.0,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(width: 4.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isFirst)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Rank',
                    style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
                  ),
                ),
              CustomTextField(
                controller: widget.controllers.rankController,
                height: 30.0,
                width: 35.0,
                borderColorAlpha: 255,
                fontSize: 9.0,
                borderWidth: 1.0,
                formatters: [LengthLimitingTextInputFormatter(2)],
                contentPadding: const EdgeInsets.only(top: 8.0, left: 6.0),
                onChange: (value) {
                  rankNotifier.value = parseIntFromString(value);
                },
              ),
            ],
          ),
          const SizedBox(width: 4.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isFirst)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Misc',
                    style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
                  ),
                ),
              GestureDetector(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) =>
                        CustomDialog(content: dialogContent(context)),
                  );
                  // countValue(abilityModValue: abilityModValue,
                  //       rankValue: rankValue,);
                },
                child: SizedBox(
                  height: 30.0,
                  width: 42.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      misckSum().toString(),
                      style: AppStyles.commonPixel().copyWith(fontSize: 9.0),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 1.0),
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

  int countValue({
    required int abilityModValue,
    required int rankValue,
    required int chkPenalty,
  }) {
    int penalty = 0;

    if (widget.skill.ability == 'str' || widget.skill.ability == 'dex') {
      penalty = chkPenalty;
    }
    int isClassBonus = widget.skill.isClass ? 3 : 0;
    int sum =
        rankValue + isClassBonus + abilityModValue + misckSum() - penalty.abs();

    return sum;
  }

  int misckSum() {
    return 0;
  }

  Widget dialogContent(BuildContext context) {
    return SizedBox(
      height: 500.0,
      width: 100.0,
      child: Center(child: Text('MiscDialog', style: AppStyles.commonPixel())),
    );
  }
}

class SkillControllers {
  final String name;
  final TextEditingController rankController;
  final List<TextEditingController> listMiscControllers;

  const SkillControllers({
    required this.name,
    required this.rankController,
    required this.listMiscControllers,
  });
}
