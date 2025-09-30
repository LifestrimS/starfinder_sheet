import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/characrer/character_wm.dart';
import 'package:pathfinder_sheet/characrer/widgets/avatar.dart';
import 'package:pathfinder_sheet/characrer/widgets/contet_block.dart';
import 'package:pathfinder_sheet/characrer/widgets/ability_block.dart';
import 'package:pathfinder_sheet/characrer/widgets/live_block.dart';
import 'package:pathfinder_sheet/characrer/widgets/resolve_block.dart';
import 'package:pathfinder_sheet/characrer/widgets/short_bio_block.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class CharacterView extends ElementaryWidget<ICharacterWM> {
  const CharacterView({
    Key? key,
    WidgetModelFactory<CharacterWM> wmFactory = createCharacterWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICharacterWM wm) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        toolbarHeight: 45.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              'Save',
              style: AppStyles.commonPixel(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Avatar(), Expanded(child: ShortBioBlock())],
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 12.0,
              ),
              AbilityBlock(
                stats: wm.getAbility(),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ResolveBlock(wm: wm),
              SizedBox(
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
    );
  }
}
