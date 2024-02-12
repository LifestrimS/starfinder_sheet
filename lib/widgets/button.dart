import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pathfinder_sheet/utils/theme.dart';

class Button extends StatelessWidget {
  final AppTheme theme;
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  const Button(
      {required this.theme,
      required this.title,
      required this.onTap,
      this.width,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: theme.getAccent2Color(),
            border: Border.all(color: theme.getTextContrastColor()),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 6.0),
            child: Text(
              title,
              style: TextStyle(
                  color: theme.getTextContrastColor(), fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorButton extends StatefulWidget {
  final AppTheme theme;
  final String title;
  final VoidCallback onTap;
  final double? colorWidth;
  final double? textBWidth;
  final double? height;
  final ValueNotifier<Color>? colorNotifier;
  final Color? initialColor;

  const ColorButton(
      {required this.theme,
      required this.title,
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
          Container(
            width: widget.colorWidth,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
              border: Border.all(color: widget.theme.getTextContrastColor()),
              color: selectedColor,
            ),
          ),
          const SizedBox(
            width: 3.0,
          ),
          Container(
            width: widget.textBWidth,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
              border: Border.all(color: widget.theme.getTextContrastColor()),
              color: widget.theme.getAccent2Color(),
            ),
            child: Center(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: widget.theme.getTextContrastColor(), fontSize: 15.0),
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
              enableLabel: true,
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
