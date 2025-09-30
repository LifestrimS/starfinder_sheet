import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/character_list/character_list_view.dart';
import 'package:pathfinder_sheet/di_container.dart';
import 'package:pathfinder_sheet/splash_screen.dart';
import 'package:pathfinder_sheet/utils/debug_screen.dart';
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
            title: 'Starfinder sheet',
            theme: ThemeData(
              useMaterial3: true,
              textTheme: ThemeData.light().textTheme.copyWith(
                  bodyMedium: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  bodySmall: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  bodyLarge: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  displayLarge: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  displayMedium: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  displaySmall: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  titleLarge: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  titleMedium: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  titleSmall: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  labelLarge: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  labelMedium: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  labelSmall: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  headlineLarge: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  headlineMedium: const TextStyle(
                    fontFamily: "Overpass",
                  ),
                  headlineSmall: const TextStyle(
                    fontFamily: "Overpass",
                  )),
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
            builder: (context, state) => const CharacterView(),
          ),
          GoRoute(
            name: Routes.debug,
            path: 'debug',
            builder: (context, state) => const DebugScreen(),
          ),
        ]),
  ],
);
