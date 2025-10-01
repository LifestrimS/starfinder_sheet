import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/screens/character_list/character_list_wm.dart';
import 'package:pathfinder_sheet/screens/side_bar.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/screens/widgets/loading_indicator.dart';
import 'package:pathfinder_sheet/screens/widgets/pull_to_refresh.dart';

class CharacterListView extends ElementaryWidget<ICharacterListWM> {
  const CharacterListView({Key? key}) : super(createCharacterListWM, key: key);

  @override
  Widget build(ICharacterListWM wm) {
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
              if (value != -1 && value != 0)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'Save',
                    style: AppStyles.commonPixel(),
                  ),
                )
            ],
          ),
          backgroundColor: AppColors.backgroundDark,
          body: AppRefreshWidget(
            child: builderBody(wm: wm, value: value),
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              wm.onRefresh();
            },
          ),
        );
      },
    );
  }

  Widget builderBody({required ICharacterListWM wm, required int value}) {
    if (value == -1) {
      return Center(
          child: LoadingIndicatorWidget(
        dimension: 250.0,
      ));
    } else if (value != 0) {
      return const CharacterSheetView();
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
