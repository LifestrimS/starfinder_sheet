import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/utils/theme.dart';
import 'package:pathfinder_sheet/widgets/button.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = GetIt.I.get<AppTheme>();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Debug',
            style: TextStyle(
              color: theme.getTextColor(),
              fontSize: 32.0,
            ),
          ),
        ),
        backgroundColor: theme.getAccent1Color(),
        leading: IconButton(
            onPressed: () {
              context.pop(true);
            },
            icon: Icon(
              Icons.arrow_back,
              color: theme.getTextColor(),
            )),
      ),
      backgroundColor: theme.getBackgroundColor(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Button(
                theme: theme,
                title: 'Delete all characters',
                onTap: deleteAllCharaters),
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
