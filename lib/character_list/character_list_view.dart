import 'dart:io';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder_sheet/character_list/character_list_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/widgets/loading_indicator.dart';
import 'package:pathfinder_sheet/widgets/pull_to_refresh.dart';

class CharacterListView extends ElementaryWidget<CharacterListWM> {
  const CharacterListView({Key? key}) : super(createCharacterListWM, key: key);

  @override
  Widget build(CharacterListWM wm) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          //onTap: wm.goCharacterCreation,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.accent2Dark,
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: [AppColors.containerShadow]),
            width: 60.0,
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/images/icons/add_character.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.backgroundDark, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundDark,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'CHARACTERS',
            ),
          ),
          backgroundColor: AppColors.accent1Light,
        ),
        body: AppRefreshWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ValueListenableBuilder(
              valueListenable: wm.characterLenghtNotifire,
              builder: (context, value, child) {
                return builderBody(wm: wm, value: value);
              },
            ),
          ),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
            wm.onRefresh();
          },
        ));
  }

  Widget builderBody({required CharacterListWM wm, required int value}) {
    if (value == -1) {
      return Center(
          child: LoadingIndicatorWidget(
        dimension: 250.0,
      ));
    } else if (value != 0) {
      return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: wm.characterList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20.0,
                bottom: index == wm.characterList.length - 1 ? 100.0 : 0),
            child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  boxShadow: [
                    AppColors.containerShadow,
                  ],
                  image: wm.characterList[index].imagePath == 'null'
                      ? null
                      : DecorationImage(
                          image: Image.file(
                            File(wm.characterList[index].imagePath ?? ''),
                          ).image,
                          fit: BoxFit.fitWidth,
                        ),
                  borderRadius: BorderRadius.circular(15.0),
                  color: wm.characterList[index].imageColor ??
                      AppColors.accent2Dark,
                ),
                height: 120.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/images/icons/threedots2.svg',
                            width: 32.0,
                            height: 32.0,
                            colorFilter: const ColorFilter.mode(
                                AppColors.textContrastDark, BlendMode.srcIn),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(wm.characterList[index].name,
                          style: TextStyle(
                            shadows: [AppColors.textShadowLight],
                            color: AppColors.textContrastDark,
                            fontStyle: FontStyle.italic,
                            fontSize: 32.0,
                          )),
                      Text(
                        wm.characterList[index].chClass.name,
                        style: TextStyle(
                          shadows: [AppColors.textShadowLight],
                          color: AppColors.textContrastDark,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                )),
          );
        },
      );
    } else {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: wm.screenHeight()),
          child: const Center(
            child: Text(
              'You don\'t have characters :(',
              style:
                  TextStyle(color: AppColors.textContrastDark, fontSize: 20.0),
            ),
          ),
        ),
      );
    }
  }
}
