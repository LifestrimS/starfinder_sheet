import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/util_widgets/border.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.wm.addWeapon();
                    setState(() {});
                  },
                  child: CustomPaint(
                    painter: const FullBorderPainter(),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Add weapon',
                          style: AppStyles.commonPixel(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
            top: 1.0,
            right: 36.0,
            left: 1.0,
            bottom: 1.0,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.add_home_work_sharp,
                    color: AppColors.white,
                    size: 30.0,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: getMainTextField(
                      title: 'Name',
                      controller: widget.controllers.nameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: getTextField(
                  title: 'ATK',
                  controller: widget.controllers.attackBonusController,
                  isCentered: true,
                ),
              ),
              const SizedBox(width: 8.0),
              Flexible(
                flex: 2,
                child: getTextField(
                  title: 'Damage',
                  controller: widget.controllers.damageController,
                ),
              ),
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: getTextField(
                    title: 'Range',
                    controller: widget.controllers.rangeController,
                    isCentered: true,
                  ),
                ),

                const SizedBox(width: 8.0),
                Flexible(
                  flex: 2,
                  child: getTextField(
                    title: 'Type',
                    controller: widget.controllers.typeController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: getTextField(
                    title: 'Crit',
                    controller: widget.controllers.critController,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: getTextField(
                    title: 'Special',
                    controller: widget.controllers.specialController,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: getTextField(
                    title: 'Size',
                    controller: widget.controllers.sizeController,
                    isCentered: true,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: getTextField(
                    title: 'Capacity',
                    controller: widget.controllers.capacityController,
                    isCentered: true,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: getTextField(
                    title: 'Usages',
                    controller: widget.controllers.usagesController,
                    isCentered: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            getTextField(
              title: 'Notes',
              controller: widget.controllers.notesController,
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.deleteWeapon();
                    setState(() {});
                  },
                  child: CustomPaint(
                    painter: const FullBorderPainter(customCut: 0.1),
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

  Widget getMainTextField({
    required String title,
    required TextEditingController controller,
  }) {
    return CustomTextFieldWithBorder(
      title: title,
      controller: controller,
      height: null,
      minLines: 1,
      borderColorAlpha: 255,
      customCut: 0.03,
      fontSize: 10.0,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
    );
  }

  Widget getTextField({
    required String title,
    required TextEditingController controller,
    bool isCentered = false,
  }) {
    return CustomTextFieldWithBorder(
      title: title,
      controller: controller,
      height: null,
      fontSize: isCentered ? 14.0 : 10.0,
      textAlign: isCentered ? TextAlign.center : TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      minLines: isCentered ? 1 : 2,
      contentPadding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 14.0,
        bottom: isCentered ? 14.0 : 4.0,
      ),
    );
  }
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
  final TextEditingController notesController;

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
    required this.notesController,
  });
}
