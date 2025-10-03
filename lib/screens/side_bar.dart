import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class SideBar extends StatelessWidget {
  final ICharacterSheetWM wm;
  final List<Character?> listOfCharacters;

  const SideBar({required this.wm, required this.listOfCharacters, super.key});

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
                itemCount: listOfCharacters.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 45.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            wm.goToCharacter(listOfCharacters[index]!.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name: ${listOfCharacters[index]!.charName}',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // wm.goToCharacter(isNew: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Create new',
                        style: AppStyles.commonPixel(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
