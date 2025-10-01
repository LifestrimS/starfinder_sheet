import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/character_list/character_list_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class SideBar extends StatelessWidget {
  final ICharacterListWM wm;

  const SideBar({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkBlue,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 52.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Sheets:',
              style: AppStyles.commonPixel(),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: wm.characterLength,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 45.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          wm.goToCharacter(charId: wm.characterList[index].id);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name: ${wm.characterList[index].charName}',
                              style: AppStyles.commonPixel(),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 32.0,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        color: AppColors.teal,
                      ),
                      const SizedBox(
                        height: 8.0,
                      )
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                wm.goToCharacter(isNew: true);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Create new',
                  style: AppStyles.commonPixel(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
