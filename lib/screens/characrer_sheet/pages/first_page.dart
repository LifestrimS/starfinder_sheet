import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ability_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/avatar.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/initiative.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/move.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/short_bio_block.dart';
import 'package:pathfinder_sheet/screens/util_widgets/pull_to_refresh.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class FirstPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const FirstPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return AppRefreshWidget(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        wm.onRefresh();
      },
      child: ListView(children: [
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 140.0,
                  child: Stack(children: [
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
                          style: AppStyles.commonPixel()
                              .copyWith(color: AppColors.darkPink),
                          textAlign: TextAlign.right,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]*')),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 130.0,
                        margin: const EdgeInsets.only(
                          right: 5.0,
                        ),
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
                            ))
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                AbilityBlock(
                  ability: wm.getAbility(),
                  controllers: wm.abilityTextControllers,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Move(controllers: wm.moveControllers),
                const SizedBox(
                  height: 16.0,
                ),
                Initiative(
                  controller: wm.initMiscController,
                  dexModificatorNotifier: wm.dexModificatorNotifier(),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  'Feats, features, abilities',
                  textAlign: TextAlign.center,
                  style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
