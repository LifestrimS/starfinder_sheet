import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';

class Move extends StatelessWidget {
  final MoveControllers controllers;

  const Move({required this.controllers, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        speedBlock(controllers.moveController, 'Move', 4, context),
        speedBlock(controllers.flyController, 'Fly', 2.5, context),
        speedBlock(controllers.swimController, 'Swim', 3.5, context),
      ],
    );
  }

  Widget speedBlock(
    TextEditingController controller,
    String title,
    double cutModificator,
    BuildContext context,
  ) {
    return CustomTextFieldWithBorder(
      height: 40.0,
      width: 70.0,
      title: title,
      context: context,
      controller: controller,
      fontSize: 10.0,
      textAlign: TextAlign.center,
      contentPadding: const EdgeInsets.only(top: 12.0, left: 4.0),
      formatters: [FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*'))],
    );
  }
}

class MoveControllers {
  final TextEditingController moveController;
  final TextEditingController flyController;
  final TextEditingController swimController;

  const MoveControllers({
    required this.moveController,
    required this.flyController,
    required this.swimController,
  });
}
