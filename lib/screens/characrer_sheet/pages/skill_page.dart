import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/util_widgets/border.dart';
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
  Widget build(BuildContext context) {
    List<Skill> skills = wm.skillList.skills;

    return PageTemplate(
      wm: wm,
      content: [
        const Devider(title: 'Skills', topPadding: 12.0),

        ValueListenableBuilder(
          valueListenable: skillsCountNotifier,
          builder: (context, skillsLength, child) {
            return ListView.builder(
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
                            content: deleteDialog(skills[index].name, context),
                          ),
                        );
                      },
                      child: SkillBlock(
                        wm: wm,
                        isFirst: index == 0 ? true : false,
                        skill: skills[index],
                        abilityNotifier: getNotifier(skills[index].ability),
                        controllers: getControllers(skills[index].name),
                        chkPenaltyNotifier: chkPenaltyNotifier,
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
            );
          },
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Total ranks: ${countAllRanks()}',
              style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
            ),
          ],
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
                      CustomDialog(content: AddSkillDialog(wm: wm)),
                );
              },
              child: CustomPaint(
                painter: const FullBorderPainter(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add skill',
                      style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  int countAllRanks() {
    int sum = 0;
    for (Skill skill in wm.skillList.skills) {
      sum += skill.ranks;
    }
    return sum;
  }

  Widget deleteDialog(String skillName, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete $skillName?',
            style: AppStyles.commonPixel().copyWith(color: AppColors.darkPink),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  wm.deleteSkill(skillName);
                  Navigator.of(context).pop();
                },
                child: Text('Yes', style: AppStyles.commonPixel()),
              ),

              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text('No', style: AppStyles.commonPixel()),
              ),
            ],
          ),
        ],
      ),
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

class AddSkillDialog extends StatefulWidget {
  final ICharacterSheetWM wm;
  const AddSkillDialog({required this.wm, super.key});

  @override
  State<AddSkillDialog> createState() => _AddSkillDialogState();
}

class _AddSkillDialogState extends State<AddSkillDialog> {
  final TextEditingController nameController = TextEditingController();
  String ability = 'STR';
  String initialValue = 'STR';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: nameController,
            title: 'Name',

            minLines: 1,
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              PopupMenuButton(
                padding: EdgeInsets.zero,
                menuPadding: EdgeInsets.zero,
                position: PopupMenuPosition.under,
                style: const ButtonStyle(alignment: Alignment.centerRight),
                color: AppColors.darkBlue,
                icon: Text(
                  ability == '' ? initialValue : ability,
                  textAlign: TextAlign.end,
                  style: AppStyles.commonPixel(),
                ),
                initialValue: initialValue,
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
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  widget.wm.addSkill(nameController.text, innerAbilityName());
                  Navigator.of(context).pop();
                },
                child: Text('Save', style: AppStyles.commonPixel()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String innerAbilityName() {
    if (ability == 'STR') return AbilityEnum.str.name;
    if (ability == 'DEX') return AbilityEnum.dex.name;
    if (ability == 'CON') return AbilityEnum.con.name;
    if (ability == 'INT') return AbilityEnum.charint.name;
    if (ability == 'WIS') return AbilityEnum.wis.name;
    if (ability == 'CHA') return AbilityEnum.cha.name;
    return AbilityEnum.str.name;
  }
}

class SkillBlock extends StatefulWidget {
  final ICharacterSheetWM wm;
  final bool isFirst;
  final Skill skill;
  final ValueNotifier<int> abilityNotifier;
  final SkillControllers controllers;
  final ValueNotifier<int> chkPenaltyNotifier;

  const SkillBlock({
    required this.wm,
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
      child: ValueListenableBuilder(
        valueListenable: widget.chkPenaltyNotifier,
        builder: (context, chkPenalty, child) {
          return ValueListenableBuilder(
            valueListenable: rankNotifier,
            builder: (context, rankValue, child) {
              return ValueListenableBuilder(
                valueListenable: widget.abilityNotifier,
                builder: (context, abilityModValue, child) {
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Name',
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Skill',
                                style: AppStyles.commonPixel().copyWith(
                                  fontSize: 6.0,
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
                                style: AppStyles.commonPixel().copyWith(
                                  fontSize: 6.0,
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
                            formatters: [LengthLimitingTextInputFormatter(2)],
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

  Widget changeNameDialog({
    required ICharacterSheetWM wm,
    required BuildContext context,
    required String skillName,
  }) {
    TextEditingController controller = TextEditingController();
    controller.text = skillName;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(controller: controller, minLines: 1, fontSize: 10.0),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  wm.changeSkillName(skillName, controller.text);
                  Navigator.of(context).pop();
                },
                child: Text('Save', style: AppStyles.commonPixel()),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text('Cancel', style: AppStyles.commonPixel()),
              ),
            ],
          ),
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

class MiscDialogContent extends StatefulWidget {
  final BuildContext context;
  final ICharacterSheetWM wm;
  final Skill skill;
  final List<MiscContollers> listMiscControllers;
  final int abilityMod;
  final int chkPenalty;

  const MiscDialogContent({
    required this.context,
    required this.wm,
    required this.skill,
    required this.listMiscControllers,
    required this.abilityMod,
    required this.chkPenalty,
    super.key,
  });

  @override
  State<MiscDialogContent> createState() => _MiscDialogContentState();
}

class _MiscDialogContentState extends State<MiscDialogContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0,
      width: 100.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCheckBox(
                    wm: widget.wm,
                    skillName: widget.skill.name,
                    isClass: widget.skill.isClass,
                  ),

                  const SizedBox(width: 8.0),

                  Text(
                    'Ability: ${widget.abilityMod}',
                    style: AppStyles.commonPixel().copyWith(
                      fontSize: 8.0,
                      color: AppColors.darkPink,
                    ),
                  ),

                  const SizedBox(width: 8.0),
                  if (widget.skill.ability == AbilityEnum.str.name ||
                      widget.skill.ability == AbilityEnum.dex.name)
                    Text(
                      'ACP: ${widget.chkPenalty}',
                      style: AppStyles.commonPixel().copyWith(
                        fontSize: 8.0,
                        color: AppColors.darkPink,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 12.0),

              ...miscsList(),

              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.wm.addSkillMisc(widget.skill.name);
                      setState(() {});
                    },
                    child: CustomPaint(
                      painter: const FullBorderPainter(),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Add misc',
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
          ),
        ),
      ),
    );
  }

  List<Widget> miscsList() {
    final List<Widget> miscsWidgets = [];
    for (int i = 0; i < widget.listMiscControllers.length; i++) {
      miscsWidgets.add(
        miscRow(
          index: i,
          skillName: widget.skill.name,
          valueController: widget.listMiscControllers[i].valueController,
          noteController: widget.listMiscControllers[i].noteController,
        ),
      );
    }
    return miscsWidgets;
  }

  Widget miscRow({
    required int index,
    required String skillName,
    required TextEditingController valueController,
    required TextEditingController noteController,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextField(
            controller: valueController,
            fontSize: 10.0,
            borderColorAlpha: 255,
            minLines: 1,
            height: 30,
            width: 60,
            formatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
            ],
          ),

          const SizedBox(width: 8.0),

          Expanded(
            child: CustomTextField(
              controller: noteController,
              fontSize: 8.0,
              borderColorAlpha: 255,
              minLines: 1,
              borderWidth: 1.0,
            ),
          ),

          const SizedBox(width: 8.0),

          GestureDetector(
            onTap: () {
              widget.wm.deleteSkillMisc(index, skillName);
              setState(() {});
            },
            child: const Icon(Icons.close, color: AppColors.hp),
          ),
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  final ICharacterSheetWM wm;
  final bool isClass;
  final String skillName;
  const CustomCheckBox({
    required this.wm,
    required this.isClass,
    required this.skillName,
    super.key,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = true;

  @override
  void initState() {
    isChecked = widget.isClass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isChecked = !isChecked;
        widget.wm.setSkillClassed(widget.skillName, isChecked);
        setState(() {});
      },
      child: SizedBox(
        height: 20.0,
        width: 20.0,
        child: CustomPaint(
          painter: const CheckBoxPainter(),
          child: isChecked
              ? const Icon(size: 20.0, Icons.check, color: AppColors.darkPink)
              : const SizedBox(),
        ),
      ),
    );
  }
}

class CheckBoxPainter extends CustomPainter {
  const CheckBoxPainter({Listenable? repaint});

  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.2;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = AppColors.white;
    Path pathFrame = Path();

    pathFrame.moveTo(0.0, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    pathFrame.lineTo(0.0 + widthCut, size.height);
    pathFrame.lineTo(0.0, size.height - widthCut);
    pathFrame.close();
    canvas.drawPath(pathFrame, paintFrame);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
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
