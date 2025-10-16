import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/util_widgets/pull_to_refresh.dart';

class PageTemplate extends StatelessWidget {
  final ICharacterSheetWM wm;
  final List<Widget> content;

  const PageTemplate({required this.wm, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return AppRefreshWidget(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        int? index = wm.currentPage;
        wm.onRefresh(pageIndex: index);
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

            child: Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [...content],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
