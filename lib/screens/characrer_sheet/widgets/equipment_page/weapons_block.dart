import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class WeaponsBlock extends StatelessWidget {
  const WeaponsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ExpansionBlock(
          weapon: Weapon.empty(),
        ),
        ExpansionBlock(
          weapon: Weapon.empty(),
        ),
        ExpansionBlock(
          weapon: Weapon.empty(),
        )
      ],
    );
  }
}

class ExpansionBlock extends StatefulWidget {
  final Weapon weapon;

  const ExpansionBlock({required this.weapon, super.key});

  @override
  State<ExpansionBlock> createState() => _ExpansionBlockState();
}

class _ExpansionBlockState extends State<ExpansionBlock> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding:
              const EdgeInsets.only(top: 8.0, right: 8.0, left: 16.0),
          onExpansionChanged: (value) {
            setState(() {
              _isExpanded = value;
            });
          },
          trailing: AnimatedRotation(
            turns: _isExpanded ? 0 : .5,
            alignment: FractionalOffset.center,
            duration: const Duration(milliseconds: 250),
            child: SvgPicture.asset(
              'assets/images/icons/shevron.svg',
              width: 20.0,
              height: 20.0,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                hintText: 'Name',
                height: 35.0,
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Attack bonus',
                      controller: TextEditingController(),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Damage',
                      controller: TextEditingController(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Crit',
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Special',
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Range',
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Type',
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Size',
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Capacity',
                    controller: TextEditingController(),
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Usages',
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            Container(
              height: 4.0,
              margin: const EdgeInsets.only(top: 8.0),
              color: AppColors.darkPink,
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double? height;

  const CustomTextField(
      {required this.hintText,
      required this.controller,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.0,
      width: 50.0,
      child: CustomPaint(
        painter: TextFieldBorderPainter(),
        child: TextFormField(
          controller: controller,
          expands: true,
          maxLines: null,
          cursorColor: AppColors.darkPink,
          style: AppStyles.commonPixel(),
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: const EdgeInsets.only(left: 4.0)),
        ),
      ),
    );
  }
}

class TextFieldBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.04;
    final widthCut = size.width * cut;

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
