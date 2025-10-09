import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class Initiative extends StatelessWidget {
  final TextEditingController controller;

  final ValueNotifier dexModificatorNotifier;

  const Initiative(
      {required this.controller,
      required this.dexModificatorNotifier,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: dexModificatorNotifier,
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 45.0,
                width: 75.0,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Init',
                      style: AppStyles.commonPixel()
                          .copyWith(fontSize: 6.0, color: AppColors.darkPink),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 40.0,
                      width: 70.0,
                      child: CustomPaint(
                        painter: InitiativePainter(),
                        child: Center(
                          child: Text(
                            countInit(value),
                            style: AppStyles.commonPixel(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '=',
                  style: AppStyles.commonPixel(),
                ),
              ),
              SizedBox(
                height: 45.0,
                width: 75.0,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Dex',
                      style: AppStyles.commonPixel()
                          .copyWith(fontSize: 6.0, color: AppColors.darkPink),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 40.0,
                      width: 70.0,
                      child: CustomPaint(
                        painter: InitiativePainter(),
                        child: Center(
                          child: Text(
                            value.toString(),
                            style: AppStyles.commonPixel(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '+',
                  style: AppStyles.commonPixel(),
                ),
              ),
              SizedBox(
                height: 45.0,
                width: 75.0,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Misc',
                      style: AppStyles.commonPixel()
                          .copyWith(fontSize: 6.0, color: AppColors.darkPink),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 40.0,
                      width: 70.0,
                      child: CustomPaint(
                        painter: InitiativePainter(),
                        child: TextFormField(
                          controller: controller,
                          expands: true,
                          maxLines: null,
                          style: AppStyles.commonPixel(),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 4.0, top: 4.0),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^-?[0-9]*')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 22.0,
              )
            ],
          );
        });
  }

  String countInit(int modificator) {
    return (modificator + parseIntFromString(controller.text)).toString();
  }
}

class InitiativePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.1;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path pathFrame = Path();

    pathFrame.moveTo(0.0 + widthCut * 3.5, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    pathFrame.lineTo(0.0 + widthCut, size.height);
    pathFrame.lineTo(0.0, size.height - widthCut);
    pathFrame.lineTo(0.0, 0.0 + widthCut);
    canvas.drawPath(pathFrame, paintFrame);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MoveControllers {
  final TextEditingController moveController;
  final TextEditingController flyController;
  final TextEditingController swimController;

  const MoveControllers(
      {required this.moveController,
      required this.flyController,
      required this.swimController});
}
