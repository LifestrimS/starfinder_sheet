import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/dr_block.dart';
import 'package:pathfinder_sheet/util_widgets/border_with_text.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/util_widgets/dialog.dart';
import 'package:pathfinder_sheet/util_widgets/dialog_box.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class ACBlock extends StatefulWidget {
  final AcControllers eacControllers;
  final AcControllers kacControllers;
  final DrSrControllers drSrControllers;
  final ValueNotifier<int> armorDexBonusNotifier;

  const ACBlock({
    required this.eacControllers,
    required this.kacControllers,
    required this.drSrControllers,
    required this.armorDexBonusNotifier,
    super.key,
  });

  @override
  State<ACBlock> createState() => _ACBlockState();
}

class _ACBlockState extends State<ACBlock> {
  final ValueNotifier<int> eacNotifier = ValueNotifier(0);

  final ValueNotifier kacNotifier = ValueNotifier(0);

  @override
  void initState() {
    update(isEac: true, armorBonus: widget.eacControllers.armorNotifier.value);
    update(isEac: false, armorBonus: widget.kacControllers.armorNotifier.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: widget.armorDexBonusNotifier,
          builder: (context, dexModificator, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ValueListenableBuilder(
                  valueListenable: widget.eacControllers.armorNotifier,
                  builder: (context, eacArmorBonus, child) {
                    return GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            content: dialogContent(
                              context,
                              true,
                              dexModificator,
                              widget.eacControllers,
                            ),
                          ),
                        );
                        update(isEac: true, armorBonus: eacArmorBonus);
                      },
                      child: ValueListenableBuilder(
                        valueListenable: eacNotifier,
                        builder: (context, value, child) {
                          return ContainerBorderWithText(
                            height: 50.0,
                            width: 70.0,
                            title: 'EAC',
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Center(
                                child: Text(
                                  countAC(
                                    controllers: widget.eacControllers,
                                    armorBonus: eacArmorBonus,
                                  ).toString(),
                                  style: AppStyles.commonPixel().copyWith(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: widget.kacControllers.armorNotifier,
                  builder: (context, kacArmorBonus, child) {
                    return GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            content: dialogContent(
                              context,
                              false,
                              dexModificator,
                              widget.kacControllers,
                            ),
                          ),
                        );
                        update(isEac: false, armorBonus: kacArmorBonus);
                      },
                      child: ValueListenableBuilder(
                        valueListenable: eacNotifier,
                        builder: (context, value, child) {
                          return ContainerBorderWithText(
                            height: 50.0,
                            width: 70.0,
                            title: 'EAC',
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Center(
                                child: Text(
                                  countAC(
                                    controllers: widget.kacControllers,
                                    armorBonus: kacArmorBonus,
                                  ).toString(),
                                  style: AppStyles.commonPixel().copyWith(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 75.0,
                  child: CustomTextFieldWithBorder(
                    controller: widget.drSrControllers.srController,
                    context: context,
                    title: 'SRs',
                    textAlign: TextAlign.center,
                    contentPadding: const EdgeInsets.only(top: 14.0),
                    minLines: 1,
                    height: 55.0,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 12.0),
        CustomTextFieldWithBorder(
          context: context,
          controller: widget.drSrControllers.drController,
          title: 'Resistances/Immunities',
          fontSize: 10.0,
        ),
      ],
    );
  }

  int countAC({required AcControllers controllers, required int armorBonus}) {
    return 10 +
        widget.armorDexBonusNotifier.value +
        armorBonus +
        parseIntFromString(controllers.dodgeController.text) +
        parseIntFromString(controllers.naturalController.text) +
        parseIntFromString(controllers.deflectController.text) +
        parseIntFromString(controllers.miscController.text);
  }

  void update({required bool isEac, required int armorBonus}) {
    if (isEac) {
      eacNotifier.value = countAC(
        controllers: widget.eacControllers,
        armorBonus: armorBonus,
      );
    } else {
      kacNotifier.value = countAC(
        controllers: widget.kacControllers,
        armorBonus: armorBonus,
      );
    }
  }

  Widget dialogContent(
    BuildContext context,
    bool isEAC,
    int dexModificator,
    AcControllers controllers,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isEAC ? 'EAC' : 'KAC',
            style: AppStyles.commonPixel().copyWith(color: AppColors.darkPink),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DialogBox(title: 'Base', value: '10'),
              plusSymbol(),
              DialogBox(title: 'Dex', value: dexModificator.toString()),
              plusSymbol(),
              DialogBox(
                title: 'Armor',
                value: controllers.armorNotifier.value.toString(),
              ),
              plusSymbol(),
              DialogBox(
                title: 'Dodge',
                controller: controllers.dodgeController,
              ),
              plusSymbol(),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              plusSymbol(),
              DialogBox(
                title: 'Natur',
                controller: controllers.naturalController,
              ),
              plusSymbol(),
              DialogBox(
                title: 'Def',
                controller: controllers.deflectController,
              ),
              plusSymbol(),
              DialogBox(title: 'Misc', controller: controllers.miscController),
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

class AcControllers {
  final ValueNotifier<int> armorNotifier;
  final TextEditingController dexController;
  final TextEditingController dodgeController;
  final TextEditingController naturalController;
  final TextEditingController deflectController;
  final TextEditingController miscController;

  const AcControllers({
    required this.armorNotifier,
    required this.dexController,
    required this.dodgeController,
    required this.naturalController,
    required this.deflectController,
    required this.miscController,
  });
}
