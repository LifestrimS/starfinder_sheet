import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class LiveBlock extends StatelessWidget {
  const LiveBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'HP',
              style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
            ),
            Text(
              '?/70',
              style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
          width: double.infinity,
          child: CustomPaint(
            painter: LiveCounterPainer(currentHp: 0.7),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'STAM',
              style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
            ),
            Text(
              '?/70',
              style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
          width: double.infinity,
          child: CustomPaint(
            painter: LiveCounterPainer(currentHp: 0.3),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30.0,
              //16.0 -> horizontal padding
              width: (MediaQuery.of(context).size.width - 32.0) / 2,
              child: CustomPaint(
                painter: DamageCounterPainter(),
                child: Center(
                  child: TextFormField(
                    controller: controller,
                    //initialValue: '23',
                    expands: true,
                    maxLines: null,
                    style: AppStyles.commonPixel(),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    //onChanged: (value) => statValue.value = int.parse(value),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.clear();
              },
              child: Text(
                'Add',
                style: AppStyles.commonPixel(),
              ),
            )
          ],
        ),
        SizedBox(
          height: 100.0,
          width: double.infinity,
          child: CustomPaint(
            painter: DamagePainter(),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Some damage text 2 + 2 + 2 + 2 + 2',
                    style: AppStyles.commonPixel(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: 123',
                        style: AppStyles.commonPixel(),
                      ),
                      Text(
                        'Clear',
                        style: AppStyles.commonPixel(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DamagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
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

class DamageCounterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path pathFrame = Path();

    pathFrame.moveTo(0.0, size.height);
    pathFrame.lineTo(0.0, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    canvas.drawPath(pathFrame, paintFrame);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class LiveCounterPainer extends CustomPainter {
  //Part hp from full (part of 1)
  final double currentHp;

  const LiveCounterPainer({required this.currentHp, Listenable? repaint});

  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
    final widthCut = size.width * cut;

    const delta = 0.06;

    Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = AppColors.darkBlue;
    Path pathFill = Path();

    if (currentHp == 1) {
      pathFill.moveTo(0.0, 0.0);
      pathFill.lineTo(size.width - widthCut, 0.0);
      pathFill.lineTo(size.width, 0.0 + widthCut);
      pathFill.lineTo(size.width, size.height);
      pathFill.lineTo(0.0 + widthCut, size.height);
      pathFill.lineTo(0.0, size.height - widthCut);
      pathFill.close();
      canvas.drawPath(pathFill, paintFill);
    } else {
      pathFill.moveTo(0.0, 0.0);
      pathFill.lineTo(size.width * currentHp, 0.0);
      pathFill.lineTo(size.width * currentHp, size.height);
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

    Paint paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = AppColors.teal;
    Path pathStroke = Path();

    double startPoint = 0.01;
    int counter = 1;

    while (size.width * (delta * counter) < size.width - widthCut) {
      pathStroke.moveTo(size.width * startPoint, 0.0);
      pathStroke.lineTo(size.width * (delta * counter), size.height);
      startPoint = startPoint + delta;
      counter++;
    }

    canvas.drawPath(pathStroke, paintStroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
