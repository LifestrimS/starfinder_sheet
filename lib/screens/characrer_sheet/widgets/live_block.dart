import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class LiveBlock extends StatelessWidget {
  final ICharacterWM wm;

  const LiveBlock({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: wm.currentHpNotifier(),
          builder: (context, value, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'HP',
                      style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Text(
                        '$value/${wm.totalHp}',
                        style: AppStyles.commonPixel().copyWith(
                          fontSize: 8.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 20.0,
                        width: double.infinity,
                        child: CustomPaint(
                          painter: LiveCounterPainer(
                              current: value, total: wm.totalHp),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => addHPDiolog(context),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.add_box_outlined,
                          color: AppColors.teal,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 8.0,
        ),
        ValueListenableBuilder(
          valueListenable: wm.currentStamNotifier(),
          builder: (context, value, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'STAM',
                      style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Text(
                        '$value/${wm.totalStam}',
                        style: AppStyles.commonPixel().copyWith(fontSize: 8.0),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 20.0,
                        width: double.infinity,
                        child: CustomPaint(
                          painter: LiveCounterPainer(
                              current: value, total: wm.totalStam),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => addStamDiolog(context),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.add_box_outlined,
                          color: AppColors.teal,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          },
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
                    controller: wm.damageTextController,
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
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: wm.getDamage,
              child: Text(
                'Hit',
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
                  ValueListenableBuilder(
                    valueListenable: wm.damageLogNotifier(),
                    builder: (context, value, child) => Expanded(
                      child: Text(
                        value,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: AppStyles.commonPixel(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: wm.totalDamageNotifier(),
                        builder: (context, value, child) => Text(
                          'Total: $value',
                          style: AppStyles.commonPixel(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          wm.clearDamageLog();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                          child: Text(
                            'Clear',
                            style: AppStyles.commonPixel(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget addHPDiolog(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Text(
        "Heal Hp",
        style: AppStyles.commonPixel(),
      ),
      backgroundColor: AppColors.darkBlue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.zero)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30.0,
            child: CustomPaint(
              painter: DialogFramePainter(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: controller,
                  //initialValue: '23',
                  expands: true,
                  maxLines: null,
                  style: AppStyles.commonPixel(),
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  wm.healHP(int.parse(controller.text));
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Heal",
                  style: AppStyles.commonPixel(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget addStamDiolog(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Text(
        "Heal Stam",
        style: AppStyles.commonPixel(),
      ),
      backgroundColor: AppColors.darkBlue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.zero)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30.0,
            child: CustomPaint(
              painter: DialogFramePainter(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: controller,
                  //initialValue: '23',
                  expands: true,
                  maxLines: null,
                  style: AppStyles.commonPixel(),
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  wm.healStam(int.parse(controller.text));
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Heal",
                  style: AppStyles.commonPixel(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DialogFramePainter extends CustomPainter {
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
  final int current;
  final int total;

  const LiveCounterPainer(
      {required this.current, required this.total, Listenable? repaint});

  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
    final widthCut = size.width * cut;

    final double partOf = current / total;

    const delta = 0.06;

    Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = AppColors.darkBlue;
    Path pathFill = Path();

    if (partOf >= 1) {
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
      pathFill.lineTo(size.width * partOf, 0.0);
      pathFill.lineTo(size.width * partOf, size.height);
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
