import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class CustomDialog extends StatelessWidget {
  final Widget content;

  const CustomDialog({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        shadowColor: AppColors.teal,
        elevation: 20.0,
        insetPadding: const EdgeInsets.all(21.0),
        backgroundColor: AppColors.backgroundDark,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
                topRight: Radius.circular(28.0),
                bottomLeft: Radius.circular(28.0))),
        child: CustomPaint(painter: DialogFramePainter(), child: content),
      ),
    );
  }
}

class DialogFramePainter extends CustomPainter {
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
