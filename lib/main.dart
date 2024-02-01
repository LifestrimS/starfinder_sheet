import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/character_Info/character_info_view.dart';
import 'package:pathfinder_sheet/database/database.dart';
import 'package:pathfinder_sheet/settings/settings_view.dart';
import 'package:pathfinder_sheet/utils/routes.dart';

void main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDb();

  await database.into(database.todoItems).insert(TodoItemsCompanion.insert(
        title: 'todo: finish drift setup',
        content: 'We can now write queries and define our own tables.',
      ));

  List<TodoItem> allItems = await database.select(database.todoItems).get();

  log('Items in database: $allItems');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pathfinder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const CharacterInfoView(),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.characterList,
      path: '/',
      builder: (context, state) => const CharacterInfoView(),
    ),
    GoRoute(
      name: Routes.settings,
      path: '/settings',
      builder: (context, state) => const SettingsView(),
    ),
  ],
);
