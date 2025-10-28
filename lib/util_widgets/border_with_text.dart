import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class ContainerBorderWithText extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final int? borderColorAlpha;
  final double? borderWidth;
  final double? customCut;
  final Color? customColor;
  final Widget? child;

  const ContainerBorderWithText({
    required this.child,
    this.title,
    this.height,
    this.width,
    this.borderColorAlpha,
    this.borderWidth,
    this.customCut,
    this.customColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != null && title != null ? height! + 5 : null,
      width: width != null && title != null ? width! + 5 : null,
      child: Stack(
        children: [
          if (title != null)
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title!,
                style: AppStyles.commonPixel().copyWith(
                  color: AppColors.darkPink,
                  fontSize: 6.0,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: height == null ? 5.0 : 0.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: height,
                width: width,
                child: CustomPaint(
                  painter: BorderWithTextPainter(
                    borderColorAlpha: borderColorAlpha,
                    context: context,
                    textWidth: title != null
                        ? getTextSize(title ?? '', context)
                        : null,
                    customCut: customCut,
                    customColor: customColor,
                    borderWidth: borderWidth,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BorderWithTextPainter extends CustomPainter {
  final int? borderColorAlpha;
  final double? width;
  final double? customCut;
  final double? textWidth;
  final Color? customColor;
  final double? borderWidth;
  final BuildContext context;

  const BorderWithTextPainter({
    this.borderColorAlpha,
    this.width,
    this.customCut,
    this.textWidth,
    this.customColor,
    this.borderWidth,
    required this.context,
    Listenable? repaint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cut = customCut ?? MediaQuery.of(context).size.width * 0.02;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth ?? 3.0
      ..color =
          customColor ?? AppColors.teal.withAlpha(borderColorAlpha ?? 255);
    Path path = Path();

    path.moveTo(textWidth != null ? textWidth! + 4.0 : 0.0, 0.0);

    path.lineTo(size.width - cut, 0.0);
    path.lineTo(size.width, 0.0 + cut);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0 + cut, size.height);
    path.lineTo(0.0, size.height - cut);
    path.lineTo(0.0, textWidth != null ? 8.0 : 0.0);
    if (textWidth == null) {
      path.close();
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
