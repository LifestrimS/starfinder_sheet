import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/screens/widgets/button.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Debug',
            style: TextStyle(
              color: AppColors.textContrastDark,
              fontSize: 32.0,
            ),
          ),
        ),
        backgroundColor: AppColors.textContrastDark,
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
}
