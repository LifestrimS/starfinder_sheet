import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/theme.dart';

class CommonTextField extends StatefulWidget {
  final String labelText;
  final AppTheme theme;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const CommonTextField(
      {required this.labelText,
      required this.theme,
      this.height,
      this.width,
      this.controller,
      this.textInputType,
      super.key});

  @override
  State<StatefulWidget> createState() => _CustomTextField();
}

class _CustomTextField extends State<CommonTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50.0,
      width: widget.width,
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        cursorColor: widget.theme.getTextContrastColor(),
        style: TextStyle(
            fontSize: 20.0, color: widget.theme.getTextContrastColor()),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.theme.getTextContrastColor(), width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: widget.theme.getTextContrastColor()),
            floatingLabelStyle:
                TextStyle(color: widget.theme.getTextContrastColor()),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.theme.getTextContrastColor(), width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.theme.getTextContrastColor(), width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            filled: true,
            fillColor: widget.theme.getSecondaryColor(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 9.0)),
      ),
    );
  }
}

class DropdownField extends StatefulWidget {
  final String labelText;
  final AppTheme theme;
  final double? height;
  final double? width;
  final ValueNotifier<String> notifier;
  final List<String> listStringItems;

  const DropdownField(
      {required this.labelText,
      required this.theme,
      this.height,
      this.width,
      required this.notifier,
      required this.listStringItems,
      super.key});

  @override
  State<StatefulWidget> createState() => _DropdownField();
}

class _DropdownField extends State<DropdownField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? selectedValue = widget.listStringItems[0];

    return SizedBox(
      height: widget.height ?? 50.0,
      width: widget.width,
      child: DropdownButtonFormField(
        style: TextStyle(
            fontSize: 20.0, color: widget.theme.getTextContrastColor()),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.theme.getTextContrastColor(), width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: widget.theme.getTextContrastColor()),
            floatingLabelStyle:
                TextStyle(color: widget.theme.getTextContrastColor()),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.theme.getTextContrastColor(), width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.theme.getTextContrastColor(), width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            filled: true,
            fillColor: widget.theme.getSecondaryColor(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 9.0)),
        dropdownColor: widget.theme.getSecondaryColor(),
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
            widget.notifier.value = newValue;
          });
        },
        items: widget.listStringItems
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
      ),
    );
  }
}
