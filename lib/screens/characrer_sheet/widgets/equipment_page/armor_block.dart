import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/util_widgets/border.dart';
import 'package:pathfinder_sheet/screens/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class ArmorsBlock extends StatefulWidget {
  final ICharacterSheetWM wm;
  final ArmorList armors;
  final List<ArmorControllers> controllers;
  final ValueNotifier<int> controllersNotifier;

  const ArmorsBlock({
    required this.wm,
    required this.armors,
    required this.controllers,
    required this.controllersNotifier,
    super.key,
  });

  @override
  State<ArmorsBlock> createState() => _ArmorsBlockkState();
}

class _ArmorsBlockkState extends State<ArmorsBlock> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controllersNotifier,
      builder: (context, value, child) {
        return Column(
          children: [
            ...armorWidgets(notifiersCount: value),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.wm.addArmor();
                    setState(() {});
                  },
                  child: CustomPaint(
                    painter: const FullBorderPainter(),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Add armor',
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

  List<Widget> armorWidgets({required int notifiersCount}) {
    List<Widget> armorWidgetList = [];
    if (notifiersCount == 0) {
      armorWidgetList.add(const SizedBox());
    } else {
      int max = notifiersCount < widget.armors.armors.length
          ? notifiersCount
          : widget.armors.armors.length;
      for (int i = 0; i < max; i++) {
        armorWidgetList.add(
          ExpansionBlock(
            armor: widget.armors.armors[i],
            deleteArmor: () => widget.wm.deleteArmor(i),
            controllers: widget.controllers[i],
          ),
        );
      }
      if (notifiersCount > widget.armors.armors.length) {
        for (int i = 0; i < notifiersCount - widget.armors.armors.length; i++) {
          armorWidgetList.add(
            ExpansionBlock(
              armor: const Armor.empty(),
              deleteArmor: () =>
                  widget.wm.deleteArmor(widget.armors.armors.length + i),
              controllers: widget.controllers[widget.armors.armors.length + i],
            ),
          );
        }
      }
    }

    return armorWidgetList;
  }
}

class ExpansionBlock extends StatefulWidget {
  final Armor armor;
  final ArmorControllers controllers;
  final VoidCallback deleteArmor;

  const ExpansionBlock({
    required this.armor,
    required this.controllers,
    required this.deleteArmor,
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
                    Icons.check_box,
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
              Expanded(
                child: getTextField(
                  title: 'KAC',
                  controller: widget.controllers.kacController,
                  isCentered: true,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: getTextField(
                  title: 'EAC',
                  controller: widget.controllers.eacController,
                  isCentered: true,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: getTextField(
                  title: 'ChkPenaltie',
                  controller: widget.controllers.chkPenaltyController,
                  isCentered: true,
                ),
              ),
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: getTextField(
                    title: 'Type',
                    controller: widget.controllers.typeController,
                    isCentered: true,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: getTextField(
                    title: 'maxDex',
                    controller: widget.controllers.maxDexController,
                    isCentered: true,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: getTextField(
                    title: 'Speed',
                    controller: widget.controllers.speedController,
                    isCentered: true,
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
                    widget.deleteArmor();
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
    return CustomTextField(
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
    return CustomTextField(
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

class ArmorControllers {
  final TextEditingController nameController;
  final TextEditingController typeController;
  final TextEditingController kacController;
  final TextEditingController eacController;
  final TextEditingController chkPenaltyController;
  final TextEditingController maxDexController;
  final TextEditingController speedController;
  final TextEditingController upgradesController;
  final TextEditingController notesController;

  const ArmorControllers({
    required this.nameController,
    required this.typeController,
    required this.kacController,
    required this.eacController,
    required this.chkPenaltyController,
    required this.maxDexController,
    required this.speedController,
    required this.upgradesController,
    required this.notesController,
  });
}
