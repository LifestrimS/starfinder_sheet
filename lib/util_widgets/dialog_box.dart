import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/util_widgets/border_with_text.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class DialogBox extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? value;

  const DialogBox({
    required this.title,
    this.controller,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller != null
        ? CustomTextFieldWithBorder(
            controller: controller!,
            context: context,
            title: title,
            height: 40.0,
            width: 50.0,
            fontSize: 10.0,
            textAlign: TextAlign.center,
            contentPadding: const EdgeInsets.only(top: 12.0, left: 4.0),
            formatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
            ],
          )
        : ContainerBorderWithText(
            height: 40.0,
            width: 50.0,
            title: title,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(value ?? '', style: AppStyles.commonPixel()),
              ),
            ),
          );
  }
}

Widget plusSymbol() {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, left: 6.0),
    child: Text('+', style: AppStyles.commonPixel()),
  );
}
