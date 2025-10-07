import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class UnderLinedTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const UnderLinedTextFormField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      expands: true,
      maxLines: null,
      style: AppStyles.commonPixel(),
      textAlign: TextAlign.left,
      cursorColor: AppColors.darkPink,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        focusColor: AppColors.darkPink,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkPink)),
      ),
    );
  }
}
