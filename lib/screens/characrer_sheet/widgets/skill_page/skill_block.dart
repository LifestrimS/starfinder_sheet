import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/skill_page.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/skill_page/dialogs.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/util_widgets/dialog.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class SkillBlock extends StatefulWidget {
  final ICharacterSheetWM wm;
  final bool isFirst;
  final Skill skill;
  final ValueNotifier<int> abilityNotifier;
  final SkillControllers controllers;
  final ValueNotifier<int> chkPenaltyNotifier;
  final VoidCallback sortFunByRank;
  final VoidCallback sortFunByName;
  final VoidCallback sortFunByTotalValue;

  const SkillBlock({
    required this.wm,
    required this.isFirst,
    required this.skill,
    required this.abilityNotifier,
    required this.controllers,
    required this.chkPenaltyNotifier,
    required this.sortFunByRank,
    required this.sortFunByName,
    required this.sortFunByTotalValue,
    super.key,
  });

  @override
  State<SkillBlock> createState() => _SkillBlockState();
}

class _SkillBlockState extends State<SkillBlock> {
  final ValueNotifier<int> rankNotifier = ValueNotifier(0);

  String totalValue = '';

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
  void didUpdateWidget(covariant SkillBlock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controllers.rankController.text.isEmpty) {
      widget.controllers.rankController.text = '0';
    }

    rankNotifier.value = parseIntFromString(
      widget.controllers.rankController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: ValueListenableBuilder(
        valueListenable: widget.chkPenaltyNotifier,
        builder: (context, chkPenalty, child) {
          return ValueListenableBuilder(
            valueListenable: rankNotifier,
            builder: (context, rankValue, child) {
              return ValueListenableBuilder(
                valueListenable: widget.abilityNotifier,
                builder: (context, abilityModValue, child) {
                  totalValue =
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
                        ).toString();
                  return Row(
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
                                style: AppStyles.commonPixel().copyWith(
                                  fontSize: 6.0,
                                ),
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
                              GestureDetector(
                                onTap: () => widget.sortFunByName(),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Name',
                                    style: AppStyles.commonPixel().copyWith(
                                      fontSize: 6.0,
                                    ),
                                  ),
                                ),
                              ),
                            GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => CustomDialog(
                                    content: changeNameDialog(
                                      context: context,
                                      wm: widget.wm,
                                      skillName: widget.skill.name,
                                    ),
                                  ),
                                );
                                setState(() {});
                              },
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    widget.skill.name,
                                    style: AppStyles.commonPixel().copyWith(
                                      fontSize: 9.0,
                                      color: widget.skill.isClass
                                          ? AppColors.darkPink
                                          : AppColors.white,
                                    ),
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
                            GestureDetector(
                              onTap: () => widget.sortFunByTotalValue(),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Skill',
                                  style: AppStyles.commonPixel().copyWith(
                                    fontSize: 6.0,
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 30.0,
                            width: 42.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                                vertical: 8.0,
                              ),
                              child: Text(
                                totalValue,
                                style: AppStyles.commonPixel().copyWith(
                                  fontSize: 9.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 4.0),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.isFirst)
                            GestureDetector(
                              onTap: () => widget.sortFunByRank(),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Rank',
                                  style: AppStyles.commonPixel().copyWith(
                                    fontSize: 6.0,
                                  ),
                                ),
                              ),
                            ),
                          CustomTextField(
                            controller: widget.controllers.rankController,
                            height: 30.0,
                            width: 35.0,
                            borderColorAlpha: 255,
                            fontSize: 9.0,
                            borderWidth: 1.0,
                            formatters: [
                              LengthLimitingTextInputFormatter(2),
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^-?[0-9]*'),
                              ),
                            ],
                            contentPadding: const EdgeInsets.only(
                              top: 8.0,
                              left: 6.0,
                            ),
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
                                style: AppStyles.commonPixel().copyWith(
                                  fontSize: 6.0,
                                ),
                              ),
                            ),
                          GestureDetector(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                  content: MiscDialogContent(
                                    context: context,
                                    wm: widget.wm,
                                    skill: widget.skill,
                                    listMiscControllers:
                                        widget.controllers.listMiscControllers,
                                    abilityMod: abilityModValue,
                                    chkPenalty: chkPenalty,
                                  ),
                                ),
                              );
                              countValue(
                                abilityModValue: abilityModValue,
                                rankValue: rankValue,
                                chkPenalty: chkPenalty,
                              );
                              setState(() {});
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
                                  miscSum().toString(),
                                  style: AppStyles.commonPixel().copyWith(
                                    fontSize: 9.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 1.0),
                    ],
                  );
                },
              );
            },
          );
        },
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
        rankValue + isClassBonus + abilityModValue + miscSum() - penalty.abs();

    return sum;
  }

  int miscSum() {
    int miscSum = 0;

    for (int i = 0; i < widget.controllers.listMiscControllers.length; i++) {
      miscSum += parseIntFromString(
        widget.controllers.listMiscControllers[i].valueController.text,
      );
    }

    return miscSum;
  }
}
