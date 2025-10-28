import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/util_widgets/border_with_text.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class Initiative extends StatelessWidget {
  final TextEditingController controller;

  final ValueNotifier dexModificatorNotifier;

  const Initiative({
    required this.controller,
    required this.dexModificatorNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dexModificatorNotifier,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ContainerBorderWithText(
              height: 40.0,
              width: 70.0,
              title: 'Init',
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(countInit(value), style: AppStyles.commonPixel()),
                ),
              ),
            ),
            const SizedBox(height: 22.0),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('=', style: AppStyles.commonPixel()),
            ),
            ContainerBorderWithText(
              height: 40.0,
              width: 70.0,
              title: 'Dex',
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(value.toString(), style: AppStyles.commonPixel()),
                ),
              ),
            ),

            const SizedBox(height: 22.0),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('+', style: AppStyles.commonPixel()),
            ),
            CustomTextFieldWithBorder(
              height: 40.0,
              width: 70.0,
              title: 'Misc',
              controller: controller,
              context: context,
              fontSize: 10.0,
              textAlign: TextAlign.center,
              contentPadding: const EdgeInsets.only(top: 12.0, left: 4.0),
              formatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
              ],
            ),
            const SizedBox(height: 22.0),
          ],
        );
      },
    );
  }

  String countInit(int modificator) {
    return (modificator + parseIntFromString(controller.text)).toString();
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
