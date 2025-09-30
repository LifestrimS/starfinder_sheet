import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/di_container.dart';
import 'package:pathfinder_sheet/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DIContainer.init();

  runApp(const MaterialApp(home: MyApp()));
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
    return const SplashScreen();
  }
}
