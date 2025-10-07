import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class Move extends StatelessWidget {
  final MoveControllers controllers;

  const Move({required this.controllers, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        speedBlock(controllers.moveController, 'Move', 4),
        speedBlock(controllers.flyController, 'Fly', 2.5),
        speedBlock(controllers.swimController, 'Swim', 3.5)
      ],
    );
  }

  Widget speedBlock(
      TextEditingController controller, String title, double cutModificator) {
    return SizedBox(
      height: 45.0,
      width: 75.0,
      child: Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
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
              painter: MovePainter(cutModificator: cutModificator),
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
                  contentPadding: EdgeInsets.only(left: 4.0, top: 4.0),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class MovePainter extends CustomPainter {
  final double cutModificator;

  const MovePainter({
    required this.cutModificator,
    Listenable? repaint,
  });
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.1;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path pathFrame = Path();

    pathFrame.moveTo(0.0 + widthCut * cutModificator, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    pathFrame.lineTo(0.0 + widthCut, size.height);
    pathFrame.lineTo(0.0, size.height - widthCut);
    pathFrame.lineTo(0.0, 0.0 + widthCut);
    //pathFrame.close();
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
