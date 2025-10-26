import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/util_widgets/dialog.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class VitalsBlock extends StatelessWidget {
  final ICharacterSheetWM wm;
  final LiveBlockTextControllers controllers;

  const VitalsBlock({required this.wm, required this.controllers, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        FocusManager.instance.primaryFocus?.unfocus();
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: wm.currentHpNotifier(),
            builder: (context, value, child) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'HP',
                        style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                      ),
                      const Spacer(),
                      Text(
                        '$value/',
                        style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                      ),
                      SizedBox(
                        width: 35.0,
                        height: 15.0,
                        child: VitalsTextFormField(
                          controller: controllers.maxHpController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 20.0,
                          width: double.infinity,
                          child: CustomPaint(
                            painter: LiveCounterPainer(
                              current: value,
                              total: wm.maxHp,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              content: dialogContent(context, true),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.add_box_outlined,
                            color: AppColors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 8.0),
          ValueListenableBuilder(
            valueListenable: wm.currentStamNotifier(),
            builder: (context, value, child) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'STAM',
                        style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                      ),
                      const Spacer(),
                      Text(
                        '$value/',
                        style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                      ),
                      SizedBox(
                        width: 35.0,
                        height: 15.0,
                        child: VitalsTextFormField(
                          controller: controllers.maxStamController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 20.0,
                          width: double.infinity,
                          child: CustomPaint(
                            painter: LiveCounterPainer(
                              current: value,
                              total: wm.maxStam,
                              isHP: false,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              content: dialogContent(context, false),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.add_box_outlined,
                            color: AppColors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              SizedBox(
                height: 30.0,
                width: (MediaQuery.of(context).size.width - 32.0) / 2,
                child: CustomPaint(
                  painter: DamageCounterPainter(),
                  child: Center(
                    child: TextFormField(
                      controller: wm.damageTextController,
                      expands: true,
                      maxLines: null,
                      style: AppStyles.commonPixel(),
                      textAlign: TextAlign.center,
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      cursorColor: AppColors.darkPink,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
                      ],
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: wm.totalDamageNotifier(),
                builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '= $value',
                    style: AppStyles.commonPixel().copyWith(
                      color: AppColors.darkPink,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: wm.getDamage,
                child: Text('Hit', style: AppStyles.commonPixel()),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
            width: double.infinity,
            child: CustomPaint(
              painter: DamagePainter(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: wm.damageLogNotifier(),
                      builder: (context, value, child) => Expanded(
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: AppStyles.commonPixel(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            wm.clearDamageLog();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                            child: Text(
                              'Clear',
                              style: AppStyles.commonPixel(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dialogContent(BuildContext context, bool isHp) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isHp ? 'HP' : 'Stam',
            style: AppStyles.commonPixel().copyWith(color: AppColors.darkPink),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text('Heal value: ', style: AppStyles.commonPixel()),
              ),
              Expanded(
                child: SizedBox(
                  height: 30.0,
                  child: TextFormField(
                    controller: controller,
                    expands: true,
                    maxLines: null,
                    style: AppStyles.commonPixel(),
                    textAlign: TextAlign.left,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
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
                      FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
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
                  isHp
                      ? wm.healHP(parseIntFromString(controller.text))
                      : wm.healStam(parseIntFromString(controller.text));
                  Navigator.of(context).pop();
                },
                child: Text("Heal", style: AppStyles.commonPixel()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DialogFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
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

class DamagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
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

class DamageCounterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path pathFrame = Path();

    pathFrame.moveTo(0.0, size.height);
    pathFrame.lineTo(0.0, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    canvas.drawPath(pathFrame, paintFrame);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class LiveCounterPainer extends CustomPainter {
  final int current;
  final int total;
  final bool isHP;

  const LiveCounterPainer({
    required this.current,
    required this.total,
    Listenable? repaint,
    this.isHP = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
    final widthCut = size.width * cut;

    final double partOf = current / total;

    const delta = 0.06;

    Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = isHP ? AppColors.hp : AppColors.stamina;
    Path pathFill = Path();

    if (partOf >= 1) {
      pathFill.moveTo(0.0, 0.0);
      pathFill.lineTo(size.width - widthCut, 0.0);
      pathFill.lineTo(size.width, 0.0 + widthCut);
      pathFill.lineTo(size.width, size.height);
      pathFill.lineTo(0.0 + widthCut, size.height);
      pathFill.lineTo(0.0, size.height - widthCut);
      pathFill.close();
      canvas.drawPath(pathFill, paintFill);
    } else {
      pathFill.moveTo(0.0, 0.0);
      pathFill.lineTo(size.width * partOf, 0.0);
      pathFill.lineTo(size.width * partOf, size.height);
      pathFill.lineTo(0.0 + widthCut, size.height);
      pathFill.lineTo(0.0, size.height - widthCut);
      pathFill.close();
      canvas.drawPath(pathFill, paintFill);
    }

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = AppColors.teal;
    Path pathFrame = Path();

    pathFrame.moveTo(0.0, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    pathFrame.lineTo(0.0 + widthCut, size.height);
    pathFrame.lineTo(0.0, size.height - widthCut);
    pathFrame.close();
    canvas.drawPath(pathFrame, paintFrame);

    Paint paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = AppColors.teal;
    Path pathStroke = Path();

    double startPoint = 0.01;
    int counter = 1;

    while (size.width * (delta * counter) < size.width - widthCut) {
      pathStroke.moveTo(size.width * startPoint, 0.0);
      pathStroke.lineTo(size.width * (delta * counter), size.height);
      startPoint = startPoint + delta;
      counter++;
    }

    canvas.drawPath(pathStroke, paintStroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class LiveBlockTextControllers {
  final TextEditingController maxHpController;
  final TextEditingController maxStamController;
  final TextEditingController maxResolveController;

  const LiveBlockTextControllers({
    required this.maxHpController,
    required this.maxStamController,
    required this.maxResolveController,
  });
}
