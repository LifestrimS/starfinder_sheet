import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/skill_page.dart';
import 'package:pathfinder_sheet/util_widgets/border.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

Widget deleteDialog(
  String skillName,
  BuildContext context,
  Function(String name) deleteSkill,
) {
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
                deleteSkill(skillName);
                //widget.wm.deleteSkill(skillName);
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
