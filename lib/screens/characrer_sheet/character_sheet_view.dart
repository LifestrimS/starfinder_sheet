import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/avatar.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/contet_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/ability_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/live_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/resolve_block.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/widgets/short_bio_block.dart';
import 'package:pathfinder_sheet/screens/widgets/pull_to_refresh.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class CharacterSheetView extends ElementaryWidget<ICharacterSheetWM> {
  final int charIndex;
  final bool isNew;

  CharacterSheetView({
    required this.charIndex,
    this.isNew = false,
    Key? key,
    WidgetModelFactory<CharacterSheetWM>? wmFactory,
  }) : super(
            wmFactory ??
                (context) => createCharacterSheetWM(context, charIndex, isNew),
            key: key);

  @override
  Widget build(ICharacterSheetWM wm) {
    return ValueListenableBuilder(
      valueListenable: wm.characterLoadNotifier(),
      builder: (context, character, child) {
        if (character == null) {
          return Center(
            child: Text(
              'Can\'t load character',
              style: AppStyles.commonPixel(),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.backgroundDark,
            body: AppRefreshWidget(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
                wm.onRefresh();
              },
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 135.0,
                        child: Stack(children: [
                          Align(
                              alignment: AlignmentGeometry.topRight,
                              child: Text('11',
                                  style: AppStyles.commonPixel()
                                      .copyWith(color: AppColors.darkPink))),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 130.0,
                              margin: const EdgeInsets.only(right: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Avatar(),
                                  Expanded(
                                      child: ShortBioBlock(
                                    character: wm.character,
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
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      ResolveBlock(wm: wm),
                      const SizedBox(
                        height: 8.0,
                      ),
                      LiveBlock(
                        wm: wm,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const ContentBlock(),
                    ],
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
