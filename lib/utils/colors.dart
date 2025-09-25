import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0x00000000);

  //Light theme draft
  static const Color backgroundLight = Color(0xFFFCFAF8);
  static const Color accent1Light = Color(0xFF1D828E);
  static const Color accent2Light = Color(0xFFFEAC5D);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textContrastLight = Color(0xFF202020);
  static const Color secondaryLight = Color(0xFFFFFFFF);

  //Dark theme draft
  static const Color backgroundDark = Color(0xFF323339);
  static const Color accent1Dark = Color(0xFF327078);
  static const Color accent2Dark = Color(0xFFBE854D);
  static const Color textDark = Color(0xFFDFDFDF);
  static const Color textContrastDark = Color(0xFFDFDFDF);
  static const Color secondaryDark = Color(0xFF717484);

  //Cyberpunk theme
  static const Color darkBlue = Color(0xFF025373);
  static const Color darkGreenBlue = Color(0xFF012326);
  static const Color teal = Color(0xFF05F2DB);
  static const Color darkPink = Color(0xFFD9048E);
  static const Color pink = Color(0xFFF205CB);

  //Shadows
  static BoxShadow containerShadow = BoxShadow(
    color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.25),
    blurRadius: 4.0,
    offset: const Offset(5.0, 5.0),
  );
  static Shadow textShadowLight = Shadow(
    color: const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.5),
    blurRadius: 0.0,
    offset: const Offset(0.3, 0.3),
  );
  static Shadow textShadowDark = Shadow(
    color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.5),
    blurRadius: 0.0,
    offset: const Offset(0.3, 0.3),
  );
}
