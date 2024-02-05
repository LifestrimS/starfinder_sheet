import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder_sheet/character_list/character_list_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/theme.dart';

class CharacterListView extends ElementaryWidget<CharacterListWM> {
  const CharacterListView({Key? key}) : super(createCharacterListWM, key: key);

  @override
  Widget build(CharacterListWM wm) {
    AppTheme theme = wm.theme;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          // onTap: wm.goCharacterCreation,
          onTap: wm.addCharacter,
          child: Container(
            decoration: BoxDecoration(
              color: theme.getAccent2Color(),
              borderRadius: BorderRadius.circular(18.0),
            ),
            width: 60.0,
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/images/icons/add_character.svg',
                colorFilter: ColorFilter.mode(
                    theme.getBackgroundColor(), BlendMode.srcIn),
              ),
            ),
          ),
        ),
        backgroundColor: theme.getBackgroundColor(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            actions: [
              GestureDetector(
                onTap: wm.goSettings,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SvgPicture.asset(
                    'assets/images/icons/settings.svg',
                    width: 32.0,
                    height: 32.0,
                    alignment: Alignment.centerRight,
                    colorFilter:
                        ColorFilter.mode(theme.getTextColor(), BlendMode.srcIn),
                  ),
                ),
              ),
            ],
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'CHARACTERS',
                style: TextStyle(
                    color: theme.getTextColor(),
                    fontSize: 32.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            backgroundColor: theme.getAccent1Color(),
          ),
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
                            boxShadow: [
                              AppColors.containerShadow,
                            ],
                            // image: const DecorationImage(
                            //     image:
                            //         AssetImage('assets/images/card_img_1.png'),
                            //     fit: BoxFit.cover,
                            //     alignment: Alignment.topCenter),
                            borderRadius: BorderRadius.circular(15.0),
                            color: theme.getAccent2Color(),
                            // color: AppColors.accentGreen,
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
                                      colorFilter: ColorFilter.mode(
                                          theme.getTextColor(),
                                          BlendMode.srcIn),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(wm.characterList[index].name,
                                    style: TextStyle(
                                      shadows: [AppColors.textShadowLight],
                                      color: theme.getTextColor(),
                                      fontStyle: FontStyle.italic,
                                      fontSize: 32.0,
                                    )),
                                Text(
                                  wm.characterList[index].chClass,
                                  style: TextStyle(
                                    shadows: [AppColors.textShadowLight],
                                    color: theme.getTextColor(),
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
                return const SizedBox();
              }
            }));
  }
}
