import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class BioPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const BioPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Bio',
        textAlign: TextAlign.center,
        style: AppStyles.commonPixel(),
      ),
    );
  }
}
