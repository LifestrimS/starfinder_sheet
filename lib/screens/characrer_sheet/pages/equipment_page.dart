import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/equipment_page/armor_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/equipment_page/weapons_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/page_template.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class EquipmentPage extends StatelessWidget {
  final ICharacterSheetWM wm;
  const EquipmentPage({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      wm: wm,
      content: [
        Row(
          children: [
            const SizedBox(
              height: 4.0,
              width: 30.0,
              child: CustomPaint(painter: DeviderPainter()),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: Text('Weapon', style: AppStyles.commonPixel()),
            ),
            const Expanded(
              child: SizedBox(
                height: 4.0,
                child: CustomPaint(painter: DeviderPainter(customCut: 0.015)),
              ),
            ),
          ],
        ),
        WeaponsBlock(
          wm: wm,
          weapons: wm.weapons,
          controllers: wm.weaponsControllers,
          controllersNotifier: wm.weaponControllersNotifier(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(
              height: 4.0,
              width: 30.0,
              child: CustomPaint(painter: DeviderPainter()),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: Text('Armor', style: AppStyles.commonPixel()),
            ),
            const Expanded(
              child: SizedBox(
                height: 4.0,
                child: CustomPaint(painter: DeviderPainter(customCut: 0.015)),
              ),
            ),
          ],
        ),

        ArmorsBlock(wm: wm),
      ],
    );
  }
}

class DeviderPainter extends CustomPainter {
  final double? customCut;

  const DeviderPainter({this.customCut});

  @override
  void paint(Canvas canvas, Size size) {
    final cut = customCut ?? 0.06;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = AppColors.darkPink;
    Path pathFrame = Path();

    pathFrame.moveTo(0.0, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    pathFrame.lineTo(0.0 + widthCut, size.height);
    pathFrame.lineTo(0.0, size.height - widthCut);
    pathFrame.close();
    canvas.drawPath(pathFrame, paintFrame);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
