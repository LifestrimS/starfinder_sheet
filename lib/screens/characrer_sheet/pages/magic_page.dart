import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class MagicPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const MagicPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Magic',
        textAlign: TextAlign.center,
        style: AppStyles.commonPixel(),
      ),
    );
  }
}
