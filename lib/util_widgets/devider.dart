import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class Devider extends StatelessWidget {
  final String title;
  final double? topPadding;
  final double? fontSize;

  const Devider({
    required this.title,
    this.topPadding,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 32.0, bottom: 8.0),
      child: Row(
        children: [
          const SizedBox(
            height: 4.0,
            width: 20.0,
            child: CustomPaint(painter: DeviderPainter()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
            child: Text(
              title,
              style: AppStyles.commonPixel().copyWith(
                fontSize: fontSize ?? 8.0,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 4.0,
              child: CustomPaint(painter: DeviderPainter(customCut: 0.015)),
            ),
          ),
        ],
      ),
    );
  }
}

class DeviderPainter extends CustomPainter {
  final double? customCut;

  const DeviderPainter({this.customCut});

  @override
  void paint(Canvas canvas, Size size) {
    final cut = customCut ?? 0.06;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = AppColors.darkPink.withAlpha(150);
    Path pathFrame = Path();

    pathFrame.moveTo(0.0, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    //pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    pathFrame.lineTo(0.0 + widthCut, size.height);
    //pathFrame.lineTo(0.0, size.height - widthCut);
    pathFrame.close();
    canvas.drawPath(pathFrame, paintFrame);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
