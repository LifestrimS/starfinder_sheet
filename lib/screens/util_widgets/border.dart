import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class FullBorderPainter extends CustomPainter {
  final double? customCut;

  const FullBorderPainter({this.customCut, Listenable? repaint});

  @override
  void paint(Canvas canvas, Size size) {
    final cut = customCut ?? 0.05;
    final widthCut = size.width * cut;

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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
