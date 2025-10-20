import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class BorderWithTextPainter extends CustomPainter {
  final int? borderColorAlpha;
  final double? width;
  final double? customCut;
  final double? textWidth;
  final Color? customColor;
  final double? borderWidth;

  const BorderWithTextPainter({
    this.borderColorAlpha,
    this.width,
    this.customCut,
    this.textWidth,
    this.customColor,
    this.borderWidth,
    Listenable? repaint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cut = customCut ?? 0.05;
    final widthCut = size.width * cut;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth ?? 3.0
      ..color =
          customColor ?? AppColors.teal.withAlpha(borderColorAlpha ?? 150);
    Path path = Path();

    path.moveTo(textWidth != null ? textWidth! + 6.0 : 0.0, 0.0);

    path.lineTo(size.width - widthCut, 0.0);
    path.lineTo(size.width, 0.0 + widthCut);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0 + widthCut, size.height);
    path.lineTo(0.0, size.height - widthCut);
    path.lineTo(0.0, textWidth != null ? 8.0 : 0.0);
    if (textWidth == null) {
      path.close();
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
