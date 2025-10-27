import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/util_widgets/border_with_text.dart';
import 'package:pathfinder_sheet/util_widgets/dialog.dart';
import 'package:pathfinder_sheet/util_widgets/dialog_box.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class SavingThrowsBlock extends StatelessWidget {
  final ICharacterSheetWM wm;
  final STHRTexEditingControllers controllers;
  final ValueNotifier<int> dexModificatorNotifier;
  final ValueNotifier<int> conModificatorNotifier;
  final ValueNotifier<int> wisModificatorNotifier;

  const SavingThrowsBlock({
    required this.wm,
    required this.controllers,
    required this.dexModificatorNotifier,
    required this.conModificatorNotifier,
    required this.wisModificatorNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        STHRBlock(
          title: 'FORT',
          type: STHREnum.fort,
          baseController: controllers.fortBaseController,
          magicController: controllers.fortMagicController,
          miscController: controllers.fortMiscController,
          tmpController: controllers.fortTempController,
          modificatorNotifier: conModificatorNotifier,
        ),
        STHRBlock(
          title: 'REF',
          type: STHREnum.ref,
          baseController: controllers.refBaseController,
          magicController: controllers.refMagicController,
          miscController: controllers.refMiscController,
          tmpController: controllers.refTempController,
          modificatorNotifier: dexModificatorNotifier,
        ),
        STHRBlock(
          title: 'WILL',
          type: STHREnum.will,
          baseController: controllers.willBaseController,
          magicController: controllers.willMagicController,
          miscController: controllers.willMiscController,
          tmpController: controllers.willTempController,
          modificatorNotifier: wisModificatorNotifier,
        ),
      ],
    );
  }
}

class STHRBlock extends StatefulWidget {
  final String title;
  final STHREnum type;
  final TextEditingController baseController;
  final TextEditingController magicController;
  final TextEditingController miscController;
  final TextEditingController tmpController;
  final ValueNotifier<int> modificatorNotifier;
  const STHRBlock({
    required this.title,
    required this.type,
    required this.baseController,
    required this.magicController,
    required this.miscController,
    required this.tmpController,
    required this.modificatorNotifier,
    super.key,
  });

  @override
  State<STHRBlock> createState() => _STHRBlockState();
}

class _STHRBlockState extends State<STHRBlock> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => CustomDialog(
            content: dialogContent(
              context,
              widget.title,
              widget.modificatorNotifier.value,
              widget.baseController,
              widget.magicController,
              widget.miscController,
              widget.tmpController,
            ),
          ),
        );
        setState(() {});
      },
      child: ValueListenableBuilder(
        valueListenable: widget.modificatorNotifier,
        builder: (context, modValue, child) {
          return ContainerBorderWithText(
            height: 50.0,
            width: 70.0,
            title: widget.title,
            borderColorAlpha: 255,
            customCut: 0.17,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Center(
                child: Text(
                  countTHR(modValue),
                  style: AppStyles.commonPixel().copyWith(fontSize: 14.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String countTHR(int modValue) {
    int value =
        parseIntFromString(widget.baseController.text) +
        modValue +
        parseIntFromString(widget.magicController.text) +
        parseIntFromString(widget.miscController.text) +
        parseIntFromString(widget.tmpController.text);
    return value.toString();
  }

  Widget dialogContent(
    BuildContext context,
    String title,
    int modValue,
    TextEditingController baseController,
    TextEditingController magicController,
    TextEditingController miscController,
    TextEditingController tmpController,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppStyles.commonPixel().copyWith(color: AppColors.darkPink),
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DialogBox(title: 'Base', controller: baseController),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('+', style: AppStyles.commonPixel()),
              ),
              DialogBox(title: 'Abil', value: modValue.toString()),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('+', style: AppStyles.commonPixel()),
              ),
              DialogBox(title: 'Magic', controller: magicController),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DialogBox(title: 'Misc', controller: miscController),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('+', style: AppStyles.commonPixel()),
              ),
              DialogBox(title: 'Temp', controller: tmpController),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text("Done", style: AppStyles.commonPixel()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class STHRTexEditingControllers {
  final TextEditingController fortBaseController;
  final TextEditingController fortMagicController;
  final TextEditingController fortMiscController;
  final TextEditingController fortTempController;
  final TextEditingController refBaseController;
  final TextEditingController refMagicController;
  final TextEditingController refMiscController;
  final TextEditingController refTempController;
  final TextEditingController willBaseController;
  final TextEditingController willMagicController;
  final TextEditingController willMiscController;
  final TextEditingController willTempController;

  const STHRTexEditingControllers({
    required this.fortBaseController,
    required this.fortMagicController,
    required this.fortMiscController,
    required this.fortTempController,
    required this.refBaseController,
    required this.refMagicController,
    required this.refMiscController,
    required this.refTempController,
    required this.willBaseController,
    required this.willMagicController,
    required this.willMiscController,
    required this.willTempController,
  });
}

enum STHREnum { fort, ref, will }
