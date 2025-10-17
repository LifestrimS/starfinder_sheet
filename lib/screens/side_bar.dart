import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/util_widgets/border.dart';
import 'package:pathfinder_sheet/util_widgets/devider.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class SideBar extends StatelessWidget {
  final ICharacterSheetWM wm;
  final List<Character?> listOfCharacters;

  const SideBar({required this.wm, required this.listOfCharacters, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: AppColors.teal,
      elevation: 20,
      backgroundColor: AppColors.darkBlue,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.teal.withAlpha(200), width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 52.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Devider(
                title: 'Characters',
                topPadding: 0.0,
                fontSize: 12.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listOfCharacters.length,
                  padding: const EdgeInsets.only(top: 12.0),
                  itemBuilder: (BuildContext context, int index) {
                    return ListCharacterBlock(
                      wm: wm,
                      character: listOfCharacters[index] ?? Character.empty(),
                    );
                  },
                ),
              ),
            ),
            //const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    wm.createNewCharacter();
                  },
                  child: CustomPaint(
                    painter: const NewCharacterPainter(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Create new', style: AppStyles.commonPixel()),
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

class ListCharacterBlock extends StatelessWidget {
  final ICharacterSheetWM wm;
  final Character character;

  const ListCharacterBlock({
    required this.wm,
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          wm.goToCharacter(character.id);
        },
        child: SizedBox(
          height: 60.0,
          child: CustomPaint(
            painter: const FullBorderPainter(),
            child: Row(
              children: [
                const SizedBox(width: 50.0, height: 60.0),
                const SizedBox(width: 8.0),
                Container(color: AppColors.teal, width: 2),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 6.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            character.charName,
                            style: AppStyles.commonPixel(),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                character.charClass,
                                style: AppStyles.commonPixel(),
                              ),

                              Text(
                                character.lvl.toString(),
                                style: AppStyles.commonPixel(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewCharacterPainter extends CustomPainter {
  const NewCharacterPainter({Listenable? repaint});

  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.12;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = AppColors.teal;
    Path pathFrame = Path();

    pathFrame.lineTo(0.0, size.height);
    pathFrame.lineTo(0.0, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);

    canvas.drawPath(pathFrame, paintFrame);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
