import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/theme.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final AppTheme theme;

  const CustomTextField(
      {required this.labelText, required this.theme, super.key});

  @override
  State<StatefulWidget> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.theme.getTextContrastColor(), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.theme.getTextContrastColor(), width: 1.0),
        ),
      ),
    );
  }
}
