import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ac_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/bab_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/live_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/resolve_block.dart';
import 'package:pathfinder_sheet/screens/util_widgets/pull_to_refresh.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class BattlePage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const BattlePage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return AppRefreshWidget(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        int? index = wm.currentPage;
        wm.onRefresh(pageIndex: index);
      },
      child: ListView(children: [
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ResolveBlock(
                  wm: wm,
                  controller: wm.liveBlockTextControllers.maxResolveController,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                ACBlock(
                  eacControllers: wm.eacControllers,
                  kacControllers: wm.kacControllers,
                  dexModificatorNotifier: wm.dexModificatorNotifier(),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                LiveBlock(
                  wm: wm,
                  controllers: wm.liveBlockTextControllers,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                BabBlock(
                  controllers: wm.babControllers,
                  dexModificatorNotifier: wm.dexModificatorNotifier(),
                  strModificatorNotifier: wm.strModificatorNotifier(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  'BAB, THR, DRs',
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
