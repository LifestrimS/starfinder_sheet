import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/routes.dart';
import 'package:pathfinder_sheet/utils/splash_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => context.goNamed(Routes.characterList));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Spacer(),
            Transform.rotate(
              angle: getRandomAngle(),
              child: Text(
                getRandomText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: AppColors.textDarkLight, fontSize: 56.0),
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/images/icons/dice_vector.svg',
              width: screenWidth, //left + right paddings
              colorFilter: const ColorFilter.mode(
                  AppColors.textLightLight, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }

  String getRandomText() => splashText[Random().nextInt(splashText.length)];

  double getRandomAngle() => pi / Random().nextDouble() * 4.0;
}
