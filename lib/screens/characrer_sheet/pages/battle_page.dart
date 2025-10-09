import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/ac_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/bab_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/dr_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/live_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/resolve_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/saving_throws_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';

class BattlePage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const BattlePage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      wm: wm,
      content: [
        ACBlock(
          eacControllers: wm.eacControllers,
          kacControllers: wm.kacControllers,
          dexModificatorNotifier: wm.dexModificatorNotifier(),
        ),
        const SizedBox(
          height: 12.0,
        ),
        ResolveBlock(
          wm: wm,
          controller: wm.liveBlockTextControllers.maxResolveController,
        ),
        const SizedBox(
          height: 12.0,
        ),
        LiveBlock(
          wm: wm,
          controllers: wm.liveBlockTextControllers,
        ),
        const SizedBox(
          height: 18.0,
        ),
        BabBlock(
          controllers: wm.babControllers,
          dexModificatorNotifier: wm.dexModificatorNotifier(),
          strModificatorNotifier: wm.strModificatorNotifier(),
        ),
        const SizedBox(
          height: 18.0,
        ),
        SavingThrowsBlock(
          wm: wm,
          controllers: wm.sTHRTexEditingControllers,
          dexModificatorNotifier: wm.dexModificatorNotifier(),
          conModificatorNotifier: wm.conModificatorNotifier(),
          wisModificatorNotifier: wm.wisModificatorNotifier(),
        ),
        const SizedBox(
          height: 18.0,
        ),
        DrBlock(wm: wm, controllers: wm.drSrControllers)
      ],
    );
  }
}
