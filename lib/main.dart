import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_view.dart';
import 'package:pathfinder_sheet/character_list/character_list_view.dart';
import 'package:pathfinder_sheet/di_container.dart';
import 'package:pathfinder_sheet/settings/settings_view.dart';
import 'package:pathfinder_sheet/splash_screen.dart';
import 'package:pathfinder_sheet/utils/routes.dart';

void main() async {
  await DIContainer.init();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pathfinder',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.splashscreen,
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: Routes.characterList,
      path: '/characterList',
      builder: (context, state) => const CharacterListView(),
    ),
    GoRoute(
      name: Routes.settings,
      path: '/settings',
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      name: Routes.characterCreation,
      path: '/character_creation',
      builder: (context, state) => const CharacterCreationView(),
    ),
  ],
);
