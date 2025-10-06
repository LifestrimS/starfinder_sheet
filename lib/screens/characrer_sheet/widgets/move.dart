import 'package:flutter/material.dart';
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
        Column(
          children: [
            Text(
              'Move',
              style: AppStyles.commonPixel(),
            ),
            const SizedBox(
              height: 4.0,
            ),
            SizedBox(
              height: 30.0,
              width: 50.0,
              child: CustomPaint(
                painter: MovePainter(),
                child: TextFormField(
                  controller: controllers.moveController,
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
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            Text(
              'Fly',
              style: AppStyles.commonPixel(),
            ),
            const SizedBox(
              height: 4.0,
            ),
            SizedBox(
              height: 30.0,
              width: 50.0,
              child: CustomPaint(
                painter: MovePainter(),
                child: TextFormField(
                  controller: controllers.flyController,
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
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            Text(
              'Swim',
              style: AppStyles.commonPixel(),
            ),
            const SizedBox(
              height: 4.0,
            ),
            SizedBox(
              height: 30.0,
              width: 50.0,
              child: CustomPaint(
                painter: MovePainter(),
                child: TextFormField(
                  controller: controllers.swimController,
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
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class MovePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.1;
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

class MoveControllers {
  final TextEditingController moveController;
  final TextEditingController flyController;
  final TextEditingController swimController;

  const MoveControllers(
      {required this.moveController,
      required this.flyController,
      required this.swimController});
}
