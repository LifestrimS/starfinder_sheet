import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class ResolveBlock extends StatelessWidget {
  final ICharacterSheetWM wm;
  final TextEditingController controller;
  const ResolveBlock({required this.wm, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: wm.currentResolveNotifier(),
      builder: (context, currentResolve, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resolve',
                  style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                ),
                const Spacer(),
                Text(
                  '$currentResolve/',
                  style: AppStyles.commonPixel().copyWith(
                    fontSize: 8.0,
                  ),
                ),
                SizedBox(
                  width: 35.0,
                  height: 15.0,
                  child: TextFormField(
                    controller: controller,
                    expands: true,
                    maxLines: null,
                    style: AppStyles.commonPixel().copyWith(
                      fontSize: 8.0,
                    ),
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: resolveGrid(currentResolve)),
                wm.maxResolve > 8
                    ? Column(
                        children: buttons(context),
                      )
                    : Row(
                        children: buttons(context, isVertical: false),
                      )
              ],
            ),
          ],
        );
      },
    );
  }

  List<Widget> buttons(BuildContext context, {bool isVertical = true}) {
    return [
      GestureDetector(
        onTap: wm.addResolve,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.teal, width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(2.0))),
            child: const Icon(
              size: 16.0,
              Icons.add_sharp,
              color: AppColors.teal,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: wm.removeResolve,
        child: Padding(
          padding: EdgeInsets.only(
              left: isVertical ? 8.0 : 4.0, top: isVertical ? 8.0 : 4.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.teal, width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(2.0))),
            child: const Icon(
              size: 16.0,
              Icons.remove_sharp,
              color: AppColors.teal,
            ),
          ),
        ),
      )
    ];
  }

  Widget resolveGrid(int currentResolve) {
    return GridView.builder(
      itemCount: wm.maxResolve,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            addResolveByTap(index, currentResolve, int.parse(controller.text));
          },
          child: CustomPaint(
            painter: ResolveCounterPainer(isFilled: index < currentResolve),
          ),
        );
      },
    );
  }

  void addResolveByTap(int tapedIndex, int currentResolve, int maxResolve) {
    if (tapedIndex + 1 > currentResolve && tapedIndex + 1 <= maxResolve) {
      log('add current: $currentResolve index: ${tapedIndex + 1}');
      for (int i = 0; i <= tapedIndex - currentResolve; i++) {
        wm.addResolve();
      }
    }

    if (tapedIndex + 1 < currentResolve && tapedIndex + 1 > 0) {
      log('remove current: $currentResolve index: ${tapedIndex + 1}');
      for (int i = 1; i < currentResolve - tapedIndex; i++) {
        wm.removeResolve();
      }
    }
  }
}

class ResolveCounterPainer extends CustomPainter {
  final bool isFilled;
  const ResolveCounterPainer({required this.isFilled, Listenable? repaint});

  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.2;
    final widthCut = size.width * cut;

    if (isFilled) {
      Paint paintFill = Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = 2.0
        ..color = AppColors.darkPink;
      Path pathFill = Path();

      pathFill.moveTo(0.0, 0.0);
      pathFill.lineTo(size.width - widthCut, 0.0);
      pathFill.lineTo(size.width, 0.0 + widthCut);
      pathFill.lineTo(size.width, size.height);
      pathFill.lineTo(0.0 + widthCut, size.height);
      pathFill.lineTo(0.0, size.height - widthCut);
      pathFill.close();
      canvas.drawPath(pathFill, paintFill);
    }

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = AppColors.teal;
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
