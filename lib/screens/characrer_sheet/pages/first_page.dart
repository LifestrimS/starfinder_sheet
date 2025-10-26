import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/first_page/ability_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/first_page/avatar.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/first_page/initiative.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/first_page/move.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/first_page/short_bio_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class FirstPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const FirstPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      wm: wm,
      content: [
        const SizedBox(height: 16.0),
        SizedBox(
          height: 140.0,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentGeometry.topRight,
                child: SizedBox(
                  width: 40.0,
                  height: 25.0,
                  child: TextFormField(
                    controller: wm.lvlTextController,
                    expands: true,
                    maxLines: null,
                    keyboardType: TextInputType.number,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    cursorColor: AppColors.darkPink,
                    style: AppStyles.commonPixel().copyWith(
                      color: AppColors.darkPink,
                    ),
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 130.0,
                  margin: const EdgeInsets.only(right: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Avatar(),
                      Expanded(
                        child: ShortBioBlock(
                          character: wm.character,
                          nameController: wm.nameTextController,
                          classController: wm.classTextController,
                          raceController: wm.raceTextController,
                          setAlignment: wm.setAlignment,
                          setSize: wm.setSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Devider(title: 'Abilities'),
        AbilityBlock(
          ability: wm.getAbility(),
          controllers: wm.abilityTextControllers,
        ),
        const Devider(title: 'Movements'),
        Move(controllers: wm.moveControllers),
        const Devider(title: 'Initiative'),
        Initiative(
          controller: wm.initMiscController,
          dexModificatorNotifier: wm.dexModificatorNotifier(),
        ),
        const SizedBox(height: 12.0),
        Text(
          'Feats, features, abilities',
          textAlign: TextAlign.center,
          style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
        ),
      ],
    );
  }
}
