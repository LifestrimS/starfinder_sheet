import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class WeaponsBlock extends StatefulWidget {
  final ICharacterSheetWM wm;
  final WeaponList weapons;
  final List<WeaponControllers> controllers;
  final ValueNotifier<int> controllersNotifier;

  const WeaponsBlock({
    required this.wm,
    required this.weapons,
    required this.controllers,
    required this.controllersNotifier,
    super.key,
  });

  @override
  State<WeaponsBlock> createState() => _WeaponsBlockState();
}

class _WeaponsBlockState extends State<WeaponsBlock> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controllersNotifier,
      builder: (context, value, child) {
        return Column(
          children: [
            ...weaponWidgets(notifiersCount: value),
            const SizedBox(height: 12.0),
            GestureDetector(
              onTap: () {
                widget.wm.addWeapon();
                setState(() {});
              },
              child: CustomPaint(
                painter: ButtonBorderPainter(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add weapon', style: AppStyles.commonPixel()),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> weaponWidgets({required int notifiersCount}) {
    List<Widget> weaponWidgetList = [];
    if (notifiersCount == 0) {
      weaponWidgetList.add(const SizedBox());
    } else {
      int max = notifiersCount < widget.weapons.weapons.length
          ? notifiersCount
          : widget.weapons.weapons.length;
      for (int i = 0; i < max; i++) {
        weaponWidgetList.add(
          ExpansionBlock(
            weapon: widget.weapons.weapons[i],
            deleteWeapon: () => widget.wm.deleteWeapon(i),
            controllers: widget.controllers[i],
          ),
        );
      }
      if (notifiersCount > widget.weapons.weapons.length) {
        for (
          int i = 0;
          i < notifiersCount - widget.weapons.weapons.length;
          i++
        ) {
          weaponWidgetList.add(
            ExpansionBlock(
              weapon: const Weapon.empty(),
              deleteWeapon: () =>
                  widget.wm.deleteWeapon(widget.weapons.weapons.length + i),
              controllers:
                  widget.controllers[widget.weapons.weapons.length + i],
            ),
          );
        }
      }
    }

    return weaponWidgetList;
  }
}

class ExpansionBlock extends StatefulWidget {
  final Weapon weapon;
  final WeaponControllers controllers;
  final VoidCallback deleteWeapon;

  const ExpansionBlock({
    required this.weapon,
    required this.controllers,
    required this.deleteWeapon,

    super.key,
  });

  @override
  State<ExpansionBlock> createState() => _ExpansionBlockState();
}

class _ExpansionBlockState extends State<ExpansionBlock> {
  bool _isExpanded = false;
  final ExpansibleController _controller = ExpansibleController();

  @override
  void didUpdateWidget(covariant ExpansionBlock oldWidget) {
    _controller.collapse();

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          controller: _controller,
          childrenPadding: const EdgeInsets.only(
            top: 8.0,
            right: 8.0,
            left: 16.0,
          ),
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
                controller: widget.controllers.nameController,
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Attack bonus',
                      controller: widget.controllers.attackBonusController,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Damage',
                      controller: widget.controllers.damageController,
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
                    controller: widget.controllers.critController,
                  ),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Special',
                    controller: widget.controllers.specialController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Range',
                    controller: widget.controllers.rangeController,
                  ),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Type',
                    controller: widget.controllers.typeController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Size',
                    controller: widget.controllers.sizeController,
                  ),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Capacity',
                    controller: widget.controllers.capacityController,
                  ),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Usages',
                    controller: widget.controllers.usagesController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            GestureDetector(
              onTap: () {
                widget.deleteWeapon();
                setState(() {});
              },
              child: CustomPaint(
                painter: ButtonBorderPainter(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Delete weapon',
                      style: AppStyles.commonPixel().copyWith(
                        color: AppColors.hp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 4.0,
              margin: const EdgeInsets.only(top: 8.0),
              color: AppColors.darkPink,
            ),
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

  const CustomTextField({
    required this.hintText,
    required this.controller,
    this.height,
    super.key,
  });

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
            contentPadding: const EdgeInsets.only(left: 4.0),
          ),
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

class ButtonBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.02;
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

class WeaponControllers {
  final TextEditingController nameController;
  final TextEditingController attackBonusController;
  final TextEditingController damageController;
  final TextEditingController critController;
  final TextEditingController specialController;
  final TextEditingController rangeController;
  final TextEditingController typeController;
  final TextEditingController sizeController;
  final TextEditingController capacityController;
  final TextEditingController usagesController;

  const WeaponControllers({
    required this.nameController,
    required this.attackBonusController,
    required this.damageController,
    required this.critController,
    required this.specialController,
    required this.rangeController,
    required this.typeController,
    required this.sizeController,
    required this.capacityController,
    required this.usagesController,
  });
}
