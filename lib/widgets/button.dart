import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  const Button(
      {required this.title,
      required this.onTap,
      this.width,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.accent2Dark,
            border: Border.all(color: AppColors.textContrastDark),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 6.0),
            child: Text(
              title,
              style:
                  TextStyle(color: AppColors.textContrastDark, fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final double? colorWidth;
  final double? textBWidth;
  final double? height;
  final ValueNotifier<Color>? colorNotifier;
  final Color? initialColor;

  const ColorButton(
      {required this.title,
      required this.onTap,
      this.colorWidth,
      this.textBWidth,
      this.height,
      this.colorNotifier,
      this.initialColor,
      super.key});

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  Color selectedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    if (widget.colorNotifier != null) {
      selectedColor = widget.colorNotifier?.value ?? Colors.grey;
    }
    return GestureDetector(
      onTap: () {
        materialColorPicker(context);
        widget.onTap();
      },
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Container(
                //width: widget.colorWidth,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  border: Border.all(color: AppColors.textContrastDark),
                  color: selectedColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //width: widget.textBWidth,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                border: Border.all(color: AppColors.textContrastDark),
                color: AppColors.accent2Dark,
              ),
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.textContrastDark, fontSize: 15.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void materialColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: selectedColor,
              enableLabel: false,
              onColorChanged: (Color color) {
                selectedColor = color;
                if (widget.colorNotifier != null) {
                  widget.colorNotifier?.value = color;
                }
                setState(() {});
                log('Color: $color');
              },
            ),
          ),
        );
      },
    );
  }
}
