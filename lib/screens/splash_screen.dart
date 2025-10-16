import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_view.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/splash_text.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CharacterSheetView()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
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
                style: AppStyles.commonPixel().copyWith(fontSize: 25.0),
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/images/icons/dice_vector.svg',
              width: screenWidth, //left + right paddings
              colorFilter: const ColorFilter.mode(
                AppColors.textContrastDark,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getRandomText() => splashText[Random().nextInt(splashText.length)];

  double getRandomAngle() => pi / Random().nextDouble() * 4.0;
}
