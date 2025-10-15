import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/screens/util_widgets/custom_text_form_field.dart'
    as inf;
import 'package:pathfinder_sheet/utils/styles.dart';

class ArmorsBlock extends StatefulWidget {
  final ICharacterSheetWM wm;
  // final ArmorList weapons;
  // final List<ArmorControllers> controllers;
  // final ValueNotifier<int> controllersNotifier;

  const ArmorsBlock({
    required this.wm,
    // required this.weapons,
    // required this.controllers,
    // required this.controllersNotifier,
    super.key,
  });

  @override
  State<ArmorsBlock> createState() => _ArmorsBlockkState();
}

class _ArmorsBlockkState extends State<ArmorsBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ...weaponWidgets(notifiersCount: 2),
        ExpansionBlock(controllers: getControllers()),
        ExpansionBlock(controllers: getControllers()),
        ExpansionBlock(controllers: getControllers()),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                // widget.wm.addWeapon();
                setState(() {});
              },
              child: CustomPaint(
                painter: ButtonBorderPainter(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add armor', style: AppStyles.commonPixel()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  ArmorControllers getControllers() {
    return ArmorControllers(
      nameController: TextEditingController(),
      typeController: TextEditingController(),
      kacController: TextEditingController(),
      eacController: TextEditingController(),
      chkPenaltyController: TextEditingController(),
      maxDexController: TextEditingController(),
      speedController: TextEditingController(),
      upgradesController: TextEditingController(),
    );
  }

  // List<Widget> weaponWidgets({required int notifiersCount}) {
  //   List<Widget> weaponWidgetList = [];
  //   if (notifiersCount == 0) {
  //     weaponWidgetList.add(const SizedBox());
  //   } else {
  //     int max = notifiersCount < widget.weapons.weapons.length
  //         ? notifiersCount
  //         : widget.weapons.weapons.length;
  //     for (int i = 0; i < max; i++) {
  //       weaponWidgetList.add(
  //         ExpansionBlock(
  //           weapon: widget.weapons.weapons[i],
  //           deleteWeapon: () => widget.wm.deleteWeapon(i),
  //           controllers: widget.controllers[i],
  //         ),
  //       );
  //     }
  //     if (notifiersCount > widget.weapons.weapons.length) {
  //       for (
  //         int i = 0;
  //         i < notifiersCount - widget.weapons.weapons.length;
  //         i++
  //       ) {
  //         weaponWidgetList.add(
  //           ExpansionBlock(
  //             weapon: const Weapon.empty(),
  //             deleteWeapon: () =>
  //                 widget.wm.deleteWeapon(widget.weapons.weapons.length + i),
  //             controllers:
  //                 widget.controllers[widget.weapons.weapons.length + i],
  //           ),
  //         );
  //       }
  //     }
  //   }

  //   return weaponWidgetList;
  // }
}

class ExpansionBlock extends StatefulWidget {
  // final Weapon weapon;
  final ArmorControllers controllers;
  // final VoidCallback deleteWeapon;

  const ExpansionBlock({
    // required this.weapon,
    required this.controllers,

    // required this.deleteWeapon,
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
          childrenPadding: const EdgeInsets.only(top: 1.0, right: 36.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.check_box,
                    color: AppColors.white,
                    size: 30.0,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Name',
                      height: 35.0,
                      controller: widget.controllers.nameController,
                      borderColorAlpha: 255,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'KAC',
                  controller: widget.controllers.kacController,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: CustomTextField(
                  hintText: 'EAC',
                  controller: widget.controllers.eacController,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: CustomTextField(
                  hintText: 'ChkPenalty',
                  controller: widget.controllers.chkPenaltyController,
                ),
              ),
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Type',
                    controller: widget.controllers.typeController,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: CustomTextField(
                    hintText: 'maxDex',
                    controller: widget.controllers.maxDexController,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Speed',
                    controller: widget.controllers.speedController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Expanded(
            //       child: CustomTextField(
            //         hintText: 'Upgrades',
            //         controller: widget.controllers.upgradesController,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 8.0),
            inf.CustomTextField(
              controller: TextEditingController(),
              borderColorAlpha: 150,
            ),

            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    //widget.deleteWeapon();
                    setState(() {});
                  },
                  child: CustomPaint(
                    painter: ButtonBorderPainter(),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Delete',
                          style: AppStyles.commonPixel().copyWith(
                            color: AppColors.hp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
  final int? borderColorAlpha;

  const CustomTextField({
    required this.hintText,
    required this.controller,
    this.height,
    this.borderColorAlpha,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.0,
      width: 50.0,
      child: CustomPaint(
        painter: TextFieldBorderPainter(borderColorAlpha: borderColorAlpha),
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
            contentPadding: const EdgeInsets.only(left: 8.0),
          ),
        ),
      ),
    );
  }
}

class TextFieldBorderPainter extends CustomPainter {
  final int? borderColorAlpha;

  const TextFieldBorderPainter({this.borderColorAlpha, Listenable? repaint});
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.04;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = AppColors.teal.withAlpha(borderColorAlpha ?? 150);
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
    const cut = 0.05;
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

class ArmorControllers {
  final TextEditingController nameController;
  final TextEditingController typeController;
  final TextEditingController kacController;
  final TextEditingController eacController;
  final TextEditingController chkPenaltyController;
  final TextEditingController maxDexController;
  final TextEditingController speedController;
  final TextEditingController upgradesController;

  const ArmorControllers({
    required this.nameController,
    required this.typeController,
    required this.kacController,
    required this.eacController,
    required this.chkPenaltyController,
    required this.maxDexController,
    required this.speedController,
    required this.upgradesController,
  });
}
