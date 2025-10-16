import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/util_widgets/border_with_text.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final double? height;
  final double? width;
  final int? borderColorAlpha;
  final double? borderWidth;
  final double? customCut;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final double? fontSize;
  final EdgeInsets? contentPadding;
  final Color? customColor;
  final int? minLines;

  const CustomTextField({
    required this.controller,
    this.title,
    this.height,
    this.width,
    this.borderColorAlpha,
    this.borderWidth,
    this.customCut,
    this.textAlign,
    this.textAlignVertical,
    this.fontSize,
    this.contentPadding,
    this.customColor,
    this.minLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != null ? height! + 5 : null,
      width: width != null ? width! + 5 : null,
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
                  painter: TextFieldBorderPainter(
                    borderColorAlpha: borderColorAlpha,
                    textWidth: title != null
                        ? getTextSize(title ?? '', context)
                        : null,
                    customCut: customCut,
                    customColor: customColor,
                  ),
                  child: TextFormField(
                    controller: controller,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    cursorColor: AppColors.darkPink,
                    style: AppStyles.commonPixel().copyWith(
                      fontSize: fontSize ?? 14.0,
                    ),
                    minLines: minLines ?? 2,
                    textAlign: textAlign ?? TextAlign.left,
                    textAlignVertical:
                        textAlignVertical ?? TextAlignVertical.center,

                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding:
                          contentPadding ?? const EdgeInsets.all(8.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double getTextSize(String text, BuildContext context) {
    final Size size = (TextPainter(
      text: TextSpan(
        text: text,
        style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
      ),
      maxLines: 1,
      textScaler: MediaQuery.of(context).textScaler,
      textDirection: TextDirection.ltr,
    )..layout()).size;

    return size.width;
  }
}
