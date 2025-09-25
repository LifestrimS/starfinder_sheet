import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_wm.dart';
import 'package:pathfinder_sheet/characrer_creation/widgets/avatar.dart';
import 'package:pathfinder_sheet/characrer_creation/widgets/contet_block.dart';
import 'package:pathfinder_sheet/characrer_creation/widgets/ability_block.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class CharacterCreationView extends ElementaryWidget<ICharacterCreationWM> {
  const CharacterCreationView({
    Key? key,
    WidgetModelFactory<CharacterCreationWM> wmFactory =
        createCharacterCreationWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICharacterCreationWM wm) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        toolbarHeight: 45.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Avatar(),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Name: Chiara', style: AppStyles.commonPixel()),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text('Class: Operative',
                            style: AppStyles.commonPixel()),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text('Lvl: 11', style: AppStyles.commonPixel()),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text('Race: elf', style: AppStyles.commonPixel()),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text('Alignment: NN', style: AppStyles.commonPixel()),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text('Size: M', style: AppStyles.commonPixel()),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 21.0,
              ),
              AbilityBlock(
                stats: wm.getAbility(),
              ),
              const ContentBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
