import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/equipment_page/armor_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/equipment_page/weapons_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';

class EquipmentPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const EquipmentPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      wm: wm,
      content: [
        const Devider(title: 'Weapon', topPadding: 16.0),
        WeaponsBlock(
          wm: wm,
          weapons: wm.weapons,
          controllers: wm.weaponsControllers,
          controllersNotifier: wm.weaponControllersNotifier(),
        ),
        const Devider(title: 'Armor'),
        ArmorsBlock(
          wm: wm,
          armors: wm.armors,
          controllers: wm.armorControllers,
          controllersNotifier: wm.armorControllersNotifier(),
          checkedArmorIndexNotifier: wm.checkedArmorIndexNotifier(),
        ),
      ],
    );
  }
}
