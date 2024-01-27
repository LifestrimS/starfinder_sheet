import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder_sheet/character_Info/character_info_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class CharacterInfoView extends ElementaryWidget<CharacterInfoWM> {
  const CharacterInfoView({Key? key}) : super(createCharacterInfoWM, key: key);

  @override
  Widget build(CharacterInfoWM wm) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: AppColors.accentGreen,
            borderRadius: BorderRadius.circular(18.0),
          ),
          width: 70.0,
          height: 70.0,
          child: SvgPicture.asset(
            'assets/images/icons/plus.svg',
            colorFilter: const ColorFilter.mode(
                AppColors.textColorBright, BlendMode.srcIn),
          ),
        ),
        backgroundColor: AppColors.neutral00,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            SvgPicture.asset(
              'assets/images/icons/gear.svg',
              width: 40.0,
              height: 40.0,
              alignment: Alignment.centerRight,
              colorFilter: const ColorFilter.mode(
                  AppColors.textColorBright, BlendMode.srcIn),
            ),
          ],
          title: const Text(
            'CHARACTERS',
            style: TextStyle(color: AppColors.textColorBright),
          ),
          backgroundColor: AppColors.accentGreen,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                              AppColors.textColorBright, BlendMode.srcIn),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Text('Янтюл',
                        style: TextStyle(
                          color: AppColors.textColorBright,
                          fontStyle: FontStyle.italic,
                          fontSize: 30.0,
                        )),
                    const Text(
                      'Бард 15/Маршал 7',
                      style: TextStyle(
                        color: AppColors.textColorBright,
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
