import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class ResolveBlock extends StatefulWidget {
  final ICharacterSheetWM wm;
  final TextEditingController controller;
  const ResolveBlock({required this.wm, required this.controller, super.key});

  @override
  State<ResolveBlock> createState() => _ResolveBlockState();
}

class _ResolveBlockState extends State<ResolveBlock> {
  final ValueNotifier<int> maxResolveNotifier = ValueNotifier(0);

  @override
  void initState() {
    maxResolveNotifier.value = widget.wm.maxResolve;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.wm.currentResolveNotifier(),
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
                  style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                ),
                SizedBox(
                  width: 35.0,
                  height: 15.0,
                  child: VitalsTextFormField(
                    controller: widget.controller,
                    onChange: (value) {
                      maxResolveNotifier.value = parseIntFromString(value);
                      widget.wm.setMaxResolve(parseIntFromString(value));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            ValueListenableBuilder(
              valueListenable: maxResolveNotifier,
              builder: (context, maxResolve, child) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: resolveGrid(
                        currentResolve: currentResolve,
                        maxResolve: maxResolve,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget resolveGrid({required int currentResolve, required int maxResolve}) {
    return GridView.builder(
      itemCount: maxResolve,
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
            addResolveByTap(index, currentResolve, maxResolve);
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
      for (int i = 0; i <= tapedIndex - currentResolve; i++) {
        widget.wm.addResolve();
      }
    }

    if (tapedIndex + 1 <= currentResolve && tapedIndex + 1 >= 0) {
      for (int i = 1; i <= currentResolve - tapedIndex; i++) {
        widget.wm.removeResolve();
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
