import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/equipment_page/weapons_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class EquipmentPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const EquipmentPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(wm: wm, content: [
      WeaponsBlock(),
      const SizedBox(
        height: 16,
      ),
      Text(
        'Equipment\nweapon, armor, equip',
        textAlign: TextAlign.center,
        style: AppStyles.commonPixel(),
      ),
    ]);
  }
}
