import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class CommonTextField extends StatefulWidget {
  final String labelText;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const CommonTextField(
      {required this.labelText,
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
        cursorColor: AppColors.textContrastDark,
        style:
            const TextStyle(fontSize: 20.0, color: AppColors.textContrastDark),
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textContrastDark, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: AppColors.textContrastDark),
            floatingLabelStyle:
                const TextStyle(color: AppColors.textContrastDark),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.textContrastDark, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.textContrastDark, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            filled: true,
            fillColor: AppColors.secondaryDark,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 9.0)),
      ),
    );
  }
}

class DropdownField extends StatefulWidget {
  final String labelText;
  final double? height;
  final double? width;
  final ValueNotifier<String> notifier;
  final List<String> listStringItems;

  const DropdownField(
      {required this.labelText,
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
        style: TextStyle(fontSize: 20.0, color: AppColors.textContrastDark),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textContrastDark, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: AppColors.textContrastDark),
            floatingLabelStyle: TextStyle(color: AppColors.textContrastDark),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.textContrastDark, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.textContrastDark, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            filled: true,
            fillColor: AppColors.secondaryDark,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 9.0)),
        dropdownColor: AppColors.secondaryDark,
        initialValue: selectedValue,
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
