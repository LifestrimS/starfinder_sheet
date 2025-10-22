import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/skill_page/dialogs.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/skill_page/skill_block.dart';
import 'package:pathfinder_sheet/util_widgets/border.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';
import 'package:pathfinder_sheet/util_widgets/dialog.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class SkillsPage extends StatefulWidget {
  final ICharacterSheetWM wm;
  final ValueNotifier<int> strModificatorNotifier;
  final ValueNotifier<int> dexModificatorNotifier;
  final ValueNotifier<int> intModificatorNotifier;
  final ValueNotifier<int> wisModificatorNotifier;
  final ValueNotifier<int> chaModificatorNotifier;
  final List<SkillControllers> skillsControllers;
  final ValueNotifier<int> chkPenaltyNotifier;
  final ValueNotifier<int> skillsCountNotifier;

  const SkillsPage({
    required this.wm,
    required this.strModificatorNotifier,
    required this.dexModificatorNotifier,
    required this.intModificatorNotifier,
    required this.wisModificatorNotifier,
    required this.chaModificatorNotifier,
    required this.skillsControllers,
    required this.chkPenaltyNotifier,
    required this.skillsCountNotifier,
    super.key,
  });

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<Skill> skills = [];
  bool isNameReversed = false;
  bool isTotalValueReversed = false;
  bool isRankReversed = false;

  ValueNotifier<int> totalRanksNotifier = ValueNotifier(0);

  @override
  void initState() {
    skills = widget.wm.skillList.skills;
    totalRanksNotifier.value = countAllRanks();
    for (SkillControllers controllers in widget.skillsControllers) {
      controllers.rankController.addListener(updateTotalRanks);
    }
    super.initState();
  }

  @override
  void dispose() {
    totalRanksNotifier.dispose();
    for (SkillControllers controllers in widget.skillsControllers) {
      controllers.rankController.removeListener(updateTotalRanks);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.skillsCountNotifier,
      builder: (context, skillsLength, child) {
        return PageTemplate(
          wm: widget.wm,
          content: [
            const Devider(title: 'Skills', topPadding: 12.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: skillsLength,
              physics: const NeverScrollableScrollPhysics(),

              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            content: deleteDialog(
                              skills[index].name,
                              context,
                              (skillName) => widget.wm.deleteSkill(skillName),
                            ),
                          ),
                        );
                      },
                      child: SkillBlock(
                        wm: widget.wm,
                        isFirst: index == 0 ? true : false,
                        skill: skills[index],
                        abilityNotifier: getNotifier(skills[index].ability),
                        controllers: getControllers(skills[index].name),
                        chkPenaltyNotifier: widget.chkPenaltyNotifier,
                        sortFunByRank: () => sortByRank(),
                        sortFunByName: () => sortByName(),
                        sortFunByTotalValue: () => sortByTotalValue(),
                      ),
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
            const SizedBox(height: 8.0),
            ValueListenableBuilder(
              valueListenable: totalRanksNotifier,
              builder: (context, totalRanks, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Total ranks: $totalRanks',
                      //'Total ranks: ${countAllRanks()}',
                      style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          CustomDialog(content: AddSkillDialog(wm: widget.wm)),
                    );
                  },
                  child: CustomPaint(
                    painter: const FullBorderPainter(),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Add skill',
                          style: AppStyles.commonPixel().copyWith(
                            fontSize: 8.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void updateTotalRanks() {
    totalRanksNotifier.value = countAllRanks();
  }

  void sortByRank() {
    skills.sort(compareByRank);
    isRankReversed = !isRankReversed;
    if (isRankReversed) {
      skills = skills.reversed.toList();
    }

    setState(() {});
  }

  int compareByRank(Skill a, Skill b) {
    SkillControllers aSkillControllers = widget.skillsControllers.firstWhere(
      (e) => e.name == a.name,
    );

    SkillControllers bSkillControllers = widget.skillsControllers.firstWhere(
      (e) => e.name == b.name,
    );

    final aRank = parseIntFromString(aSkillControllers.rankController.text);
    final bRank = parseIntFromString(bSkillControllers.rankController.text);
    if (aRank < bRank) {
      return -1;
    } else if (aRank > bRank) {
      return 1;
    } else {
      return 0;
    }
  }

  void sortByName() {
    skills.sort((a, b) => b.name.compareTo(a.name));
    isNameReversed = !isNameReversed;
    if (isNameReversed) {
      skills = skills.reversed.toList();
    }

    setState(() {});
  }

  void sortByTotalValue() {
    skills.sort(compareByTotalValue);

    isNameReversed = !isNameReversed;
    if (isNameReversed) {
      skills = skills.reversed.toList();
    }

    setState(() {});
  }

  int compareByTotalValue(Skill a, Skill b) {
    final aTotal = skillTotal(a);
    final bTotal = skillTotal(b);
    if (aTotal < bTotal) {
      return -1;
    } else if (aTotal > bTotal) {
      return 1;
    } else {
      return 0;
    }
  }

  int skillTotal(Skill skill) {
    int isClass = skill.isClass ? 3 : 0;
    int miskTotal = 0;

    SkillControllers skillControllers = widget.skillsControllers.firstWhere(
      (e) => e.name == skill.name,
    );
    for (MiscContollers miscController
        in skillControllers.listMiscControllers) {
      miskTotal += parseIntFromString(miscController.valueController.text);
    }

    int acp = skill.ability == '' || skill.ability == ''
        ? widget.chkPenaltyNotifier.value
        : 0;

    return isClass +
        miskTotal +
        acp +
        parseIntFromString(skillControllers.rankController.text);
  }

  int countAllRanks() {
    int sum = 0;
    for (SkillControllers controllers in widget.skillsControllers) {
      sum += parseIntFromString(controllers.rankController.text);
    }
    return sum;
  }

  SkillControllers getControllers(String skillName) {
    SkillControllers controllers = widget.skillsControllers.firstWhere(
      (element) => element.name == skillName,
    );
    return controllers;
  }

  getNotifier(String ability) {
    AbilityEnum abilityEnum = AbilityEnum.values.firstWhere(
      (element) => element.name == ability,
    );
    switch (abilityEnum) {
      case AbilityEnum.str:
        return widget.strModificatorNotifier;
      case AbilityEnum.dex:
        return widget.dexModificatorNotifier;
      case AbilityEnum.charint:
        return widget.intModificatorNotifier;
      case AbilityEnum.wis:
        return widget.wisModificatorNotifier;
      case AbilityEnum.cha:
        return widget.chaModificatorNotifier;
      default:
        return widget.dexModificatorNotifier;
    }
  }
}

class SkillControllers {
  final String name;
  final TextEditingController rankController;
  final List<MiscContollers> listMiscControllers;

  const SkillControllers({
    required this.name,
    required this.rankController,
    required this.listMiscControllers,
  });

  SkillControllers copyWith({
    String? name,
    TextEditingController? rankController,
    List<MiscContollers>? listMiscControllers,
  }) {
    return SkillControllers(
      name: name ?? this.name,
      rankController: rankController ?? this.rankController,
      listMiscControllers: listMiscControllers ?? this.listMiscControllers,
    );
  }
}

class MiscContollers {
  final TextEditingController valueController;
  final TextEditingController noteController;

  const MiscContollers({
    required this.valueController,
    required this.noteController,
  });
}
