import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';

class DrBlock extends StatelessWidget {
  final ICharacterSheetWM wm;
  final DrSrControllers controllers;

  const DrBlock({required this.wm, required this.controllers, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWithBorder(
          controller: controllers.drController,
          title: 'DRs',
          fontSize: 10.0,
          borderColorAlpha: 255,
        ),
        // const SizedBox(height: 12.0),
        // CustomTextField(
        //   controller: controllers.srController,
        //   title: 'SRs',
        //   fontSize: 10.0,
        //   borderColorAlpha: 255,
        // ),
      ],
    );
  }
}

class DrSrControllers {
  final TextEditingController drController;
  final TextEditingController srController;

  const DrSrControllers({
    required this.drController,
    required this.srController,
  });
}
