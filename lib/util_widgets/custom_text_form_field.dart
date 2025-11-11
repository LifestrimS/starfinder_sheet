import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/util_widgets/border_with_text.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class CustomTextFieldWithBorder extends StatelessWidget {
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
  final List<TextInputFormatter>? formatters;
  final Function(String value)? onChange;
  final BuildContext context;

  const CustomTextFieldWithBorder({
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
    this.formatters,
    this.onChange,
    required this.context,
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
                    context: context,
                    borderColorAlpha: borderColorAlpha,
                    textWidth: title != null
                        ? getTextSize(title ?? '', context)
                        : null,
                    customCut: customCut,
                    customColor: customColor,
                    borderWidth: borderWidth,
                  ),
                  child: TextFormField(
                    controller: controller,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    cursorColor: AppColors.darkPink,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    style: AppStyles.commonPixel().copyWith(
                      fontSize: fontSize ?? 14.0,
                    ),
                    minLines: minLines ?? 2,
                    textAlign: textAlign ?? TextAlign.left,
                    textAlignVertical:
                        textAlignVertical ?? TextAlignVertical.center,
                    inputFormatters: formatters,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding:
                          contentPadding ?? const EdgeInsets.all(8.0),
                    ),
                    onChanged: (value) =>
                        onChange != null ? onChange!(value) : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VitalsTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? formatters;
  final double? fontSize;
  final TextInputType? textInputTupe;

  final Function(String value)? onChange;

  const VitalsTextFormField({
    required this.controller,
    this.formatters,
    this.fontSize,
    this.onChange,
    this.textInputTupe,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      expands: true,
      maxLines: null,
      style: AppStyles.commonPixel().copyWith(fontSize: fontSize ?? 8.0),
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputTupe ?? TextInputType.number,
      cursorColor: AppColors.darkPink,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkPink),
        ),
        contentPadding: EdgeInsets.zero,
      ),
      onChanged: (value) => onChange != null ? onChange!(value) : null,
      inputFormatters:
          formatters ??
          [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')),
            LengthLimitingTextInputFormatter(3),
          ],
    );
  }
}
