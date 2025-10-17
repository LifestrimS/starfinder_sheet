import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/ac_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/bab_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/live_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/resolve_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/saving_throws_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';

class BattlePage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const BattlePage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      wm: wm,
      content: [
        const Devider(title: 'Defence', topPadding: 16.0),
        ACBlock(
          eacControllers: wm.eacControllers,
          kacControllers: wm.kacControllers,
          dexModificatorNotifier: wm.dexModificatorNotifier(),
          drSrControllers: wm.drSrControllers,
        ),
        const Devider(title: 'Vitals'),
        ResolveBlock(
          wm: wm,
          controller: wm.liveBlockTextControllers.maxResolveController,
        ),
        const SizedBox(height: 12.0),
        LiveBlock(wm: wm, controllers: wm.liveBlockTextControllers),

        const Devider(title: 'BAB'),
        BabBlock(
          controllers: wm.babControllers,
          dexModificatorNotifier: wm.dexModificatorNotifier(),
          strModificatorNotifier: wm.strModificatorNotifier(),
        ),
        const Devider(title: 'Saving throws'),
        SavingThrowsBlock(
          wm: wm,
          controllers: wm.sTHRTexEditingControllers,
          dexModificatorNotifier: wm.dexModificatorNotifier(),
          conModificatorNotifier: wm.conModificatorNotifier(),
          wisModificatorNotifier: wm.wisModificatorNotifier(),
        ),
      ],
    );
  }
}
