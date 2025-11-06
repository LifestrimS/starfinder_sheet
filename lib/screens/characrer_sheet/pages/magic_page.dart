import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/magic_page/title_row.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';

class MagicPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const MagicPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      wm: wm,
      content: [
        TitleRow(
          strModNotifier: wm.strModificatorNotifier(),
          dexModNotifier: wm.dexModificatorNotifier(),
          conModNotifier: wm.conModificatorNotifier(),
          intModNotifier: wm.intModificatorNotifier(),
          wisModNotifier: wm.wisModificatorNotifier(),
          chaModNotifier: wm.chaModificatorNotifier(),
        ),
      ],
    );
  }
}
