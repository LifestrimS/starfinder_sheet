import 'package:flutter/material.dart';
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

class ColorButton extends StatelessWidget {
  final AppTheme theme;
  final String title;
  final VoidCallback onTap;
  final double? colorWidth;
  final double? textBWidth;
  final double? height;

  const ColorButton(
      {required this.theme,
      required this.title,
      required this.onTap,
      this.colorWidth,
      this.textBWidth,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: colorWidth,
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0)),
            border: Border.all(color: theme.getTextContrastColor()),
            color: theme.getTextContrastColor(),
          ),
        ),
        const SizedBox(
          width: 1.0,
        ),
        Container(
          width: textBWidth,
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)),
            border: Border.all(color: theme.getTextContrastColor()),
            color: theme.getAccent2Color(),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: theme.getTextContrastColor(), fontSize: 15.0),
            ),
          ),
        )
      ],
    );
  }
}
