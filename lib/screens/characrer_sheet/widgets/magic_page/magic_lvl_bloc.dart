import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/battle_page/resolve_block.dart';
import 'package:pathfinder_sheet/util_widgets/custom_text_form_field.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class MagicLvl extends StatelessWidget {
  final int lvl;
  const MagicLvl({required this.lvl, super.key});

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
                child: Text('$lvl-lvl', style: AppStyles.commonPixel()),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('known: 6', style: AppStyles.commonPixel()),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 24.0),
                child: Text('DC: 15', style: AppStyles.commonPixel()),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bonus spell',
                  style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
                ),
                Text(
                  '2/5',
                  style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
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
                  child: bonusSpellGrid(currentResolve: 2, maxResolve: 5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Spell / day',
                  style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
                ),
                Text(
                  '1/8',
                  style: AppStyles.commonPixel().copyWith(fontSize: 6.0),
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
                  child: bonusSpellGrid(currentResolve: 1, maxResolve: 8),
                ),
              ],
            ),
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
    required int currentResolve,
    required int maxResolve,
  }) {
    return GridView.builder(
      itemCount: maxResolve,
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
            //addResolveByTap(index, currentResolve, maxResolve);
          },
          child: CustomPaint(
            painter: ResolveCounterPainer(isFilled: index < currentResolve),
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
