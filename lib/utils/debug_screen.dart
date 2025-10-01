import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/screens/widgets/button.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Debug',
            style: AppStyles.commonPixel(),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textContrastDark,
            )),
      ),
      backgroundColor: AppColors.backgroundDark,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Button(title: 'Delete all characters', onTap: deleteAllCharaters),
            const SizedBox(
              height: 12.0,
            ),
            Button(title: 'Add empty character', onTap: addEmptyCharacter),
          ],
        ),
      ),
    );
  }

  void deleteAllCharaters() {
    try {
      GetIt.I.get<Repository>().deleteAllCharacters();
      log('All characters deleted');
    } catch (e) {
      log('Smthing get worng on delete all characters: $e');
    }
  }

  void addEmptyCharacter() {
    try {
      GetIt.I.get<Repository>().addCharacter(Character.empty());
      log('Added empty character');
    } catch (e) {
      log('Smthing get worng on add empty character: $e');
    }
  }
}
