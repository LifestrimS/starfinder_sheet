import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder_sheet/character_list/character_list_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class CharacterListView extends ElementaryWidget<CharacterListWM> {
  const CharacterListView({Key? key}) : super(createCharacterListWM, key: key);

  @override
  Widget build(CharacterListWM wm) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: wm.goCharacterCreation,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.accentGreen,
              borderRadius: BorderRadius.circular(18.0),
            ),
            width: 70.0,
            height: 70.0,
            child: SvgPicture.asset(
              'assets/images/icons/plus.svg',
              colorFilter: const ColorFilter.mode(
                  AppColors.textColorLight, BlendMode.srcIn),
            ),
          ),
        ),
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: wm.goSettings,
              child: SvgPicture.asset(
                'assets/images/icons/gear.svg',
                width: 40.0,
                height: 40.0,
                alignment: Alignment.centerRight,
                colorFilter: const ColorFilter.mode(
                    AppColors.textColorLight, BlendMode.srcIn),
              ),
            ),
          ],
          title: const Text(
            'CHARACTERS',
            style: TextStyle(color: AppColors.textColorLight),
          ),
          backgroundColor: AppColors.accentGreen,
        ),
        body: ValueListenableBuilder<int>(
            valueListenable: wm.characterLenghtNotifire,
            builder: (context, value, child) {
              if (value != 0) {
                return ListView.builder(
                  itemCount: wm.characterList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 20.0,
                          right: 20.0,
                          left: 20.0,
                          bottom:
                              index == wm.characterList.length - 1 ? 100.0 : 0),
                      child: Container(
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/yantul.png'),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter),
                            borderRadius: BorderRadius.circular(15.0),
                            // color: AppColors.accentGreen,
                          ),
                          height: 120.0,
                          width: 350.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Spacer(),
                                    SvgPicture.asset(
                                      'assets/images/icons/3dots.svg',
                                      width: 30.0,
                                      height: 30.0,
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.textColorLight,
                                          BlendMode.srcIn),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(wm.characterList[index].name,
                                    style: const TextStyle(
                                      color: AppColors.textColorLight,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 30.0,
                                    )),
                                Text(
                                  wm.characterList[index].chClass,
                                  style: const TextStyle(
                                    color: AppColors.textColorLight,
                                  ),
                                )
                              ],
                            ),
                          )),
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            }));
  }
}
