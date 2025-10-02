import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/character_list/character_list_wm.dart';
import 'package:pathfinder_sheet/screens/side_bar.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/debug_screen.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/screens/widgets/loading_indicator.dart';
import 'package:pathfinder_sheet/screens/widgets/pull_to_refresh.dart';

class MainScreenView extends ElementaryWidget<IMainScreenWM> {
  const MainScreenView({Key? key}) : super(createMainScreenWM, key: key);

  @override
  Widget build(IMainScreenWM wm) {
    return ValueListenableBuilder(
      valueListenable: wm.characterLenghtNotifire(),
      builder: (context, value, child) {
        return Scaffold(
          drawer: SideBar(
            wm: wm,
          ),
          appBar: AppBar(
            backgroundColor: AppColors.darkBlue,
            actions: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DebugScreen())),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'Debug',
                    style: AppStyles.commonPixel(),
                  ),
                ),
              ),
              // if (value != -1 && value != 0)
              //   GestureDetector(
              //     onTap: () => wm.saveCharacter,
              //     child: Padding(
              //       padding: const EdgeInsets.only(right: 8.0),
              //       child: Text(
              //         'Save',
              //         style: AppStyles.commonPixel(),
              //       ),
              //     ),
              //   )
            ],
          ),
          backgroundColor: AppColors.backgroundDark,
          body: builderBody(wm: wm, value: value),
        );
      },
    );
  }

  Widget builderBody({required IMainScreenWM wm, required int value}) {
    if (value == -1) {
      return Center(
          child: LoadingIndicatorWidget(
        dimension: 250.0,
      ));
    } else if (value != 0) {
      return wm.goToCharacter();
    } else {
      return AppRefreshWidget(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
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
