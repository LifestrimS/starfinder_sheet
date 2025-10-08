import 'package:carousel_slider/carousel_slider.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/battle_page.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/bio_page.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/equipment_page.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/first_page.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/magic_page.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/pages/skill_page.dart';
import 'package:pathfinder_sheet/screens/side_bar.dart';
import 'package:pathfinder_sheet/screens/util_widgets/loading_indicator.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class CharacterSheetView extends ElementaryWidget<ICharacterSheetWM> {
  CharacterSheetView({
    Key? key,
    WidgetModelFactory<CharacterSheetWM>? wmFactory,
  }) : super(wmFactory ?? (context) => createCharacterSheetWM(context),
            key: key);

  @override
  Widget build(ICharacterSheetWM wm) {
    AppBar appbar = AppBar(
      backgroundColor: AppColors.darkBlue,
      actions: [
        GestureDetector(
          onTap: () => wm.saveCharacter(),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              'Save',
              style: AppStyles.commonPixel(),
            ),
          ),
        ),
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
    );

    return PopScope(
      canPop: false,
      child: EntityStateNotifierBuilder(
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
              appBar: appbar,
              body: EntityStateNotifierBuilder(
                listenableEntityState: wm.characterLoadNotifier(),
                errorBuilder: (context, e, data) {
                  return Center(
                    child: Text(
                      'Can\'t load character',
                      style: AppStyles.commonPixel(),
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
                    return Center(
                      child: Text(
                        'Can\'t load character',
                        textAlign: TextAlign.center,
                        style: AppStyles.commonPixel(),
                      ),
                    );
                  } else {
                    return CarouselBody(
                      wm: wm,
                      appBarHeight: appbar.preferredSize.height,
                    );
                  }
                },
              ),
            );
          } else {
            return Scaffold(
              drawer: SideBar(
                wm: wm,
                listOfCharacters: listOfCharacters ?? [],
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
              body: const Center(
                child: Text(
                  'You don\'t have characters :(',
                  style: TextStyle(
                      color: AppColors.textContrastDark, fontSize: 20.0),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class CarouselBody extends StatefulWidget {
  final ICharacterSheetWM wm;
  final double appBarHeight;
  const CarouselBody({required this.wm, required this.appBarHeight, super.key});

  @override
  State<CarouselBody> createState() => _CarouselBodyState();
}

class _CarouselBodyState extends State<CarouselBody> {
  final ValueNotifier pageNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            carouselController: widget.wm.carouselController,
            options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                height: MediaQuery.sizeOf(context).height -
                    64.0 -
                    widget.appBarHeight,
                onPageChanged: (index, reason) {
                  pageNotifier.value = index;
                  widget.wm.setCurrentPage(index);
                }),
            items: [
              FirstPage(wm: widget.wm),
              BattlePage(wm: widget.wm),
              MagicPage(wm: widget.wm),
              SkillsPage(wm: widget.wm),
              EquipmentPage(wm: widget.wm),
              BioPage(wm: widget.wm)
            ],
          ),
        ),
        ValueListenableBuilder(
            valueListenable: pageNotifier,
            builder: (context, value, child) {
              return Container(
                height: 24.0,
                color: AppColors.darkBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () {
                        widget.wm.carouselController.animateToPage(entry.key);
                        widget.wm.setCurrentPage(entry.key);
                      },
                      child: Container(
                        width: 24.0,
                        height: 16.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 4.0),
                        child: CustomPaint(
                          painter:
                              IndicatorPainter(isFilled: value == entry.key),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
      ],
    );
  }

  List<int> list = [0, 1, 2, 3, 4, 5];
}

class IndicatorPainter extends CustomPainter {
  final bool isFilled;

  const IndicatorPainter({
    required this.isFilled,
    Listenable? repaint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.12;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
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
