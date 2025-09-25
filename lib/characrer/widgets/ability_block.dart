import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class AbilityBlock extends StatelessWidget {
  final Ability stats;
  const AbilityBlock({required this.stats, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AbilityCell(
            statName: 'STR',
            statValue: stats.str,
          ),
          AbilityCell(
            statName: 'DEX',
            statValue: stats.dex,
          ),
          AbilityCell(
            statName: 'CON',
            statValue: stats.con,
          ),
        ],
      ),
      const SizedBox(
        height: 12.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AbilityCell(
            statName: 'INT',
            statValue: stats.intel,
          ),
          AbilityCell(
            statName: 'WIS',
            statValue: stats.wis,
          ),
          AbilityCell(
            statName: 'CHA',
            statValue: stats.cha,
          ),
        ],
      ),
    ]);
  }
}

class AbilityCell extends StatefulWidget {
  final String statName;
  final int statValue;
  const AbilityCell(
      {required this.statName, required this.statValue, super.key});

  @override
  State<AbilityCell> createState() => _AbilityCellState();
}

class _AbilityCellState extends State<AbilityCell> {
  ValueNotifier<int> statValue = ValueNotifier(0);

  @override
  void initState() {
    statValue.value = widget.statValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      width: 90.0,
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: statValue,
            builder: (context, value, child) {
              return ColoredBox(
                color: Colors.transparent,
                child: Align(
                  alignment: AlignmentGeometry.center,
                  child: SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: CustomPaint(
                      painter: StatBorderPainter(),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 3.0),
                              child: Text(
                                getModifier(value),
                                style: AppStyles.commonPixel()
                                    .copyWith(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 20.0,
              child: TextFormField(
                initialValue: widget.statValue.toString(),
                expands: true,
                maxLines: null,
                style: AppStyles.commonPixel().copyWith(
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 0.0),
                ),
                onChanged: (value) => statValue.value = int.parse(value),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.statName,
              style: AppStyles.commonPixel()
                  .copyWith(fontSize: 6.0, color: AppColors.darkPink),
            ),
          )
        ],
      ),
    );
  }

  String getModifier(int value) {
    int modifier = 0;
    if (value > 0) {
      modifier = -5 + (value ~/ 2);
      return modifier > 0 ? '+$modifier' : '$modifier';
    } else {
      return '0';
    }
  }
}

class StatBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.15;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path path = Path();

    path.moveTo(size.width * (cut * 2), 0.0);

    path.lineTo(size.width * (1 - cut), 0.0);
    path.lineTo(size.width, size.height * cut);
    path.lineTo(size.width, size.height * (1 - cut));
    path.moveTo(size.width * (1 - cut * 2), size.height);
    path.lineTo(size.width * cut, size.height);
    path.lineTo(0.0, size.height * (1 - cut));
    path.lineTo(0.0, size.height * cut * 1.2);
    //path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Ability {
  final int str;
  final int dex;
  final int con;
  final int intel;
  final int wis;
  final int cha;

  const Ability(
      {required this.str,
      required this.dex,
      required this.con,
      required this.intel,
      required this.wis,
      required this.cha});
}
