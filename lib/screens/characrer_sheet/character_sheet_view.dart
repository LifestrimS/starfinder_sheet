import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/avatar.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/contet_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ability_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/live_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/resolve_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/short_bio_block.dart';
import 'package:pathfinder_sheet/screens/side_bar.dart';
import 'package:pathfinder_sheet/screens/util_widgets/loading_indicator.dart';
import 'package:pathfinder_sheet/screens/util_widgets/pull_to_refresh.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class CharacterSheetView extends ElementaryWidget<ICharacterSheetWM> {
  // final int charIndex;
  // final bool isNew;

  CharacterSheetView({
    // required this.charIndex,
    // this.isNew = false,
    Key? key,
    WidgetModelFactory<CharacterSheetWM>? wmFactory,
  }) : super(wmFactory ?? (context) => createCharacterSheetWM(context),
            key: key);

  @override
  Widget build(ICharacterSheetWM wm) {
    return EntityStateNotifierBuilder(
      listenableEntityState: wm.listCharactersNotifier(),
      errorBuilder: (context, e, data) => Scaffold(
        body: Center(
          child: Text(
            'Can\'t load list of characters',
            style: AppStyles.commonPixel(),
          ),
        ),
      ),
      loadingBuilder: (context, data) => Center(
        child: LoadingIndicatorWidget(
          dimension: 250.0,
        ),
      ),
      builder: (context, listOfCharacters) {
        if (listOfCharacters != null && listOfCharacters.isNotEmpty) {
          return Scaffold(
            drawer: SideBar(
              wm: wm,
              listOfCharacters: listOfCharacters,
            ),
            backgroundColor: AppColors.backgroundDark,
            appBar: AppBar(
              backgroundColor: AppColors.darkBlue,
              actions: [
                GestureDetector(
                  onTap: () => wm.goDebug(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Debug',
                      style: AppStyles.commonPixel(),
                    ),
                  ),
                ),
              ],
            ),
            body: EntityStateNotifierBuilder(
              listenableEntityState: wm.characterLoadNotifier(),
              errorBuilder: (context, e, data) {
                return AppRefreshWidget(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                    wm.onRefresh();
                  },
                  child: Center(
                    child: Text(
                      'Can\'t load character',
                      style: AppStyles.commonPixel(),
                    ),
                  ),
                );
              },
              loadingBuilder: (context, data) {
                return Center(
                  child: Text(
                    'Loading character...',
                    style: AppStyles.commonPixel(),
                  ),
                );
              },
              builder: (context, character) {
                if (character == null) {
                  return GestureDetector(
                    onTap: () => wm.onRefresh(),
                    child: Center(
                      child: Text(
                        'Can\'t load character\n\nPress for refresh',
                        textAlign: TextAlign.center,
                        style: AppStyles.commonPixel(),
                      ),
                    ),
                  );
                } else {
                  return AppRefreshWidget(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      wm.onRefresh();
                    },
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 140.0,
                              child: Stack(children: [
                                Align(
                                  alignment: AlignmentGeometry.topRight,
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 25.0,
                                    child: TextFormField(
                                      controller: wm.lvlTextController,
                                      expands: true,
                                      maxLines: null,
                                      keyboardType: TextInputType.number,
                                      style: AppStyles.commonPixel()
                                          .copyWith(color: AppColors.darkPink),
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 130.0,
                                    margin: const EdgeInsets.only(
                                      right: 5.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Avatar(),
                                        Expanded(
                                            child: ShortBioBlock(
                                          character: wm.character,
                                          nameController: wm.nameTextController,
                                          classController:
                                              wm.classTextController,
                                          raceController: wm.raceTextController,
                                          setAlignment: wm.setAlignment,
                                          setSize: wm.setSize,
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            AbilityBlock(
                              ability: wm.getAbility(),
                              controllers: wm.abilityTextControllers,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            ResolveBlock(
                              wm: wm,
                              controller: wm.liveBlockTextControllers
                                  .maxResolveController,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            LiveBlock(
                              wm: wm,
                              controllers: wm.liveBlockTextControllers,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            const ContentBlock(),
                            const SizedBox(
                              height: 12.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                wm.saveCharacter();
                              },
                              child: SizedBox(
                                height: 40.0,
                                width: double.infinity,
                                child: CustomPaint(
                                  painter: SaveButtonPainter(),
                                  child: Center(
                                    child: Text(
                                      'Save',
                                      style: AppStyles.commonPixel()
                                          .copyWith(color: AppColors.darkPink),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          );
        } else {
          return AppRefreshWidget(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
              wm.onRefresh();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: wm.screenHeight()),
                child: const Center(
                  child: Text(
                    'You don\'t have characters :(',
                    style: TextStyle(
                        color: AppColors.textContrastDark, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class SaveButtonPainter extends CustomPainter {
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
