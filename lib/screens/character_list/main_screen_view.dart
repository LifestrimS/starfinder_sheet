import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/character_list/main_screen_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/screens/widgets/loading_indicator.dart';
import 'package:pathfinder_sheet/screens/widgets/pull_to_refresh.dart';

class MainScreenView extends ElementaryWidget<IMainScreenWM> {
  const MainScreenView({Key? key}) : super(createMainScreenWM, key: key);

  @override
  Widget build(IMainScreenWM wm) {
    return Scaffold(
      // drawer: SideBar(
      //   wm: wm,
      //   characterLenghtNotifire: wm.characterLenghtNotifire(),
      // ),
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
        listenableEntityState: wm.characterLenghtNotifire(),
        loadingBuilder: (context, data) {
          return Center(
              child: LoadingIndicatorWidget(
            dimension: 250.0,
          ));
        },
        builder: (context, characterLenght) {
          if (characterLenght != null) {
            return builderBody(wm: wm, value: characterLenght);
          } else {
            return const Center(
              child: Text('Error during loading character list'),
            );
          }
        },
      ),
    );
  }

  Widget builderBody({required IMainScreenWM wm, required int value}) {
    if (value != 0) {
      return wm.goToCharacter();
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
  }
}
