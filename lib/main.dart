import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_view.dart';
import 'package:pathfinder_sheet/character_list/character_list_view.dart';
import 'package:pathfinder_sheet/di_container.dart';
import 'package:pathfinder_sheet/settings/settings_view.dart';
import 'package:pathfinder_sheet/splash_screen.dart';
import 'package:pathfinder_sheet/utils/routes.dart';
import 'package:pathfinder_sheet/utils/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DIContainer.init();
  await GetIt.I.get<AppTheme>().initTheme();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I.get<AppTheme>(),
      child: Consumer<AppTheme>(
        builder: (context, value, child) {
          return MaterialApp.router(
            title: 'Pathfinder',
            theme: ThemeData(
              useMaterial3: true,
            ),
            routerConfig: _router,
          );
        },
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.splashscreen,
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
        name: Routes.characterList,
        path: '/characterList',
        builder: (context, state) {
          return const CharacterListView();
        },
        routes: [
          GoRoute(
            name: Routes.characterCreation,
            path: 'character_creation',
            builder: (context, state) => const CharacterCreationView(),
          ),
          GoRoute(
            name: Routes.settings,
            path: 'settings',
            builder: (context, state) => const SettingsView(),
          ),
        ]),
  ],
);
