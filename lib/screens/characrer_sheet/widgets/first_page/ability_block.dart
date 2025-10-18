import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/util_widgets/dialog.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class AbilityBlock extends StatefulWidget {
  final CharacterAbility ability;
  final AbilityTextControllers controllers;
  const AbilityBlock({
    required this.ability,
    required this.controllers,
    super.key,
  });

  @override
  State<AbilityBlock> createState() => _AbilityBlockState();
}

class _AbilityBlockState extends State<AbilityBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AbilityCell(
              ability: AbilityEnum.str,
              controller: widget.controllers.strController,
              tmpController: widget.controllers.strTmpController,
            ),
            AbilityCell(
              ability: AbilityEnum.dex,
              controller: widget.controllers.dexController,
              tmpController: widget.controllers.dexTmpController,
            ),
            AbilityCell(
              ability: AbilityEnum.con,
              controller: widget.controllers.conController,
              tmpController: widget.controllers.conTmpController,
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AbilityCell(
              ability: AbilityEnum.charint,
              controller: widget.controllers.intController,
              tmpController: widget.controllers.intTmpController,
            ),
            AbilityCell(
              ability: AbilityEnum.wis,
              controller: widget.controllers.wisController,
              tmpController: widget.controllers.wisTmpController,
            ),
            AbilityCell(
              ability: AbilityEnum.cha,
              controller: widget.controllers.chaController,
              tmpController: widget.controllers.chaTmpController,
            ),
          ],
        ),
      ],
    );
  }
}

class AbilityCell extends StatefulWidget {
  final AbilityEnum ability;
  final TextEditingController controller;
  final TextEditingController tmpController;

  const AbilityCell({
    required this.ability,
    required this.controller,
    required this.tmpController,
    super.key,
  });

  @override
  State<AbilityCell> createState() => _AbilityCellState();
}

class _AbilityCellState extends State<AbilityCell> {
  ValueNotifier<int> statValueNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    statValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        await showDialog(
          context: context,
          builder: (context) => CustomDialog(
            content: dialogContent(context, getName(), widget.tmpController),
          ),
        );
        setState(() {});
      },
      child: SizedBox(
        height: 90.0,
        width: 90.0,
        child: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: statValueNotifier,
              builder: (context, value, child) {
                return Align(
                  alignment: AlignmentGeometry.center,
                  child: SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: CustomPaint(
                      painter: StatBorderPainter(
                        isTmp: isHaveTmpValue(),
                        nameWidth: getTextSize(getName(), context),
                        numbersCount: widget.controller.text.length,
                        // valueWidth: getTextSize(
                        //   widget.controller.text,
                        //   context,
                        // ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 3.0,
                              ),
                              child: isHaveTmpValue()
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          getModifierValue(value),
                                          style: AppStyles.commonPixel()
                                              .copyWith(fontSize: 20.0),
                                        ),
                                        Container(
                                          width: 10.0,
                                          height: 2.0,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 6.0,
                                          ),
                                          color: AppColors.darkPink,
                                        ),
                                        Text(
                                          widget.tmpController.text,
                                          style: AppStyles.commonPixel()
                                              .copyWith(fontSize: 8.0),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      getModifierValue(value),
                                      style: AppStyles.commonPixel().copyWith(
                                        fontSize: 20.0,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 20.0,
                child: TextFormField(
                  controller: widget.controller,
                  expands: true,
                  maxLines: null,
                  style: AppStyles.commonPixel().copyWith(fontSize: 10.0),
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 0.0),
                  ),
                  onChanged: (value) =>
                      statValueNotifier.value = parseIntFromString(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                getName(),
                style: AppStyles.commonPixel().copyWith(
                  fontSize: 6.0,
                  color: AppColors.darkPink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getModifierValue(int value) {
    int modificator = 0;

    if (isHaveTmpValue()) {
      modificator = CharacterAbility.getModifier(
        parseIntFromString(widget.tmpController.text),
      );
    } else {
      modificator = CharacterAbility.getModifier(
        parseIntFromString(widget.controller.text),
      );
    }

    statValueNotifier.value = modificator;

    return modificator.toString();
  }

  String getName() {
    switch (widget.ability) {
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

  bool isHaveTmpValue() {
    switch (widget.ability) {
      case AbilityEnum.str:
        if (widget.tmpController.text.isNotEmpty &&
            widget.tmpController.text != '0') {
          return true;
        } else {
          return false;
        }
      case AbilityEnum.dex:
        if (widget.tmpController.text.isNotEmpty &&
            widget.tmpController.text != '0') {
          return true;
        } else {
          return false;
        }
      case AbilityEnum.con:
        if (widget.tmpController.text.isNotEmpty &&
            widget.tmpController.text != '0') {
          return true;
        } else {
          return false;
        }
      case AbilityEnum.charint:
        if (widget.tmpController.text.isNotEmpty &&
            widget.tmpController.text != '0') {
          return true;
        } else {
          return false;
        }
      case AbilityEnum.wis:
        if (widget.tmpController.text.isNotEmpty &&
            widget.tmpController.text != '0') {
          return true;
        } else {
          return false;
        }
      case AbilityEnum.cha:
        if (widget.tmpController.text.isNotEmpty &&
            widget.tmpController.text != '0') {
          return true;
        } else {
          return false;
        }
    }
  }

  Widget dialogContent(
    BuildContext context,
    String title,
    TextEditingController abilityTmpController,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppStyles.commonPixel().copyWith(color: AppColors.darkPink),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text('Tmp value: ', style: AppStyles.commonPixel()),
              ),
              Expanded(
                child: SizedBox(
                  height: 30.0,
                  child: TextFormField(
                    controller: abilityTmpController,
                    expands: true,
                    maxLines: null,
                    style: AppStyles.commonPixel(),
                    textAlign: TextAlign.left,
                    cursorColor: AppColors.darkPink,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      focusColor: AppColors.darkPink,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.darkPink),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text("Done", style: AppStyles.commonPixel()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatBorderPainter extends CustomPainter {
  final bool isTmp;
  final double nameWidth;
  final int numbersCount;

  const StatBorderPainter({
    required this.isTmp,
    required this.nameWidth,
    required this.numbersCount,
    Listenable? repaint,
  });
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.15;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = isTmp ? AppColors.darkPink : AppColors.teal;
    Path path = Path();

    path.moveTo(numbersCount * 11, 0.0);

    path.lineTo(size.width * (1 - cut), 0.0);
    path.lineTo(size.width, size.height * cut);
    path.lineTo(size.width, size.height - 10.0);
    path.moveTo(size.width - nameWidth, size.height);
    path.lineTo(size.width * cut, size.height);
    path.lineTo(0.0, size.height * (1 - cut));
    path.lineTo(0.0, 14.0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class AbilityTextControllers {
  final TextEditingController strController;
  final TextEditingController dexController;
  final TextEditingController conController;
  final TextEditingController intController;
  final TextEditingController wisController;
  final TextEditingController chaController;
  final TextEditingController strTmpController;
  final TextEditingController dexTmpController;
  final TextEditingController conTmpController;
  final TextEditingController intTmpController;
  final TextEditingController wisTmpController;
  final TextEditingController chaTmpController;

  const AbilityTextControllers({
    required this.strController,
    required this.dexController,
    required this.conController,
    required this.intController,
    required this.wisController,
    required this.chaController,
    required this.strTmpController,
    required this.dexTmpController,
    required this.conTmpController,
    required this.intTmpController,
    required this.wisTmpController,
    required this.chaTmpController,
  });
}
