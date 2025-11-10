import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/resolve_block.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class MagicLvl extends StatefulWidget {
  final int lvl;
  final int baseDC;
  const MagicLvl({required this.lvl, required this.baseDC, super.key});

  @override
  State<MagicLvl> createState() => _MagicLvlState();
}

class _MagicLvlState extends State<MagicLvl> {
  final ValueNotifier<int> totalBonusNotifier = ValueNotifier(5);
  final ValueNotifier<int> currentBonusNotifier = ValueNotifier(2);
  final ValueNotifier<int> totalPerDayNotifier = ValueNotifier(8);
  final ValueNotifier<int> currentPerDayNotifier = ValueNotifier(6);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                height: 4.0,
                width: 20.0,
                child: CustomPaint(painter: DeviderPainter()),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '${widget.lvl}-lvl',
                  style: AppStyles.commonPixel(),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('known: 6', style: AppStyles.commonPixel()),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 24.0),
                child: Text(
                  'DC: ${widget.baseDC + widget.lvl}',
                  style: AppStyles.commonPixel(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ValueListenableBuilder<int>(
            valueListenable: totalBonusNotifier,
            builder: (context, totalBonus, child) {
              return ValueListenableBuilder<int>(
                valueListenable: currentBonusNotifier,
                builder: (context, currentBonus, child) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bonus spell',
                              style: AppStyles.commonPixel().copyWith(
                                fontSize: 6.0,
                              ),
                            ),
                            Text(
                              '$currentBonus/$totalBonus',
                              style: AppStyles.commonPixel().copyWith(
                                fontSize: 6.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: bonusSpellGrid(
                                currentSpell: currentBonus,
                                maxSpell: totalBonus,
                                currentBonus: currentBonusNotifier,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 8.0),
          ValueListenableBuilder(
            valueListenable: totalPerDayNotifier,
            builder: (context, totalPerDay, child) {
              return ValueListenableBuilder(
                valueListenable: currentPerDayNotifier,
                builder: (context, currentPerDay, child) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Spell / day',
                              style: AppStyles.commonPixel().copyWith(
                                fontSize: 6.0,
                              ),
                            ),
                            Text(
                              '$currentPerDay/$totalPerDay',
                              style: AppStyles.commonPixel().copyWith(
                                fontSize: 6.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: bonusSpellGrid(
                                currentSpell: currentPerDay,
                                maxSpell: totalPerDay,
                                currentBonus: currentPerDayNotifier,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: getTextField(
              title: 'Notes',
              controller: TextEditingController(),
              context: context,
            ),
          ),
        ],
      ),
    );
  }

  Widget bonusSpellGrid({
    required int currentSpell,
    required int maxSpell,
    required ValueNotifier currentBonus,
  }) {
    return GridView.builder(
      itemCount: maxSpell,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 12,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            //addResolveByTap(index, currentSpell, maxSpell);
            currentBonus.value = index + 1;
          },
          child: CustomPaint(
            painter: ResolveCounterPainer(isFilled: index < currentSpell),
          ),
        );
      },
    );
  }

  Widget getTextField({
    required String title,
    required TextEditingController controller,
    List<TextInputFormatter>? formatters,
    required BuildContext context,
  }) {
    return CustomTextFieldWithBorder(
      title: title,
      controller: controller,
      height: null,
      context: context,
      fontSize: 10.0,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      minLines: 1,
      formatters: formatters,
      contentPadding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 14.0,
        bottom: 4.0,
      ),
    );
  }
}
