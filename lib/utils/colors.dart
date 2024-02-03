import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0x00000000);
  static const Color mainBackground = Color(0xFFFFFFFF);
  static const Color appBarColor = Color(0xFF3CA340);

  ///Accent colors
  static const Color accentGreen = Color(0xFF3CA340);
  static const Color accentLightGreen = Color(0xFFEFFCE5);
  static const Color accentRed = Color(0xFFF04B40);
  static const Color accentLightRed = Color(0xFFFDEFEF);
  static const Color accentYellow = Color(0xFFFFA800);
  static const Color accentLightYellow = Color(0xFFFFF4E0);
  static const Color accentOrange = Color(0xFFFF810D);
  static const Color accentPink = Color(0xFFDC34DF);
  static const Color accentLightBlue = Color(0xFFF0F9FF);

  ///Text colors
  static const Color textColorLight = Color.fromARGB(255, 255, 255, 255);
  static const Color textColorDark = Color.fromARGB(255, 0, 0, 0);

  ///Other colors
  static const Color shadowColor = Color(0x47506926);
  static const Color borderColor = Color.fromRGBO(112, 182, 246, 0.12);
  static const Color headerShadowColor = Color(0x17182C61);
  static const Color secondHeaderShadowColor = Color(0x182C611F);
  static const Color notificationDotColor = Color.fromRGBO(89, 190, 93, 1);
  static const Color cardShadowColor = Color.fromRGBO(71, 80, 105, 0.15);
  static const Color mediumRed = Color(0xFFFEE5E6);
  static const Color mediumGreen = Color(0xFFD5F2DC);

  static const cardBoxShadow = [
    BoxShadow(
      color: AppColors.cardShadowColor,
      blurRadius: 15,
      offset: Offset(0, 4),
    ),
  ];

  //Light theme draft
  static const Color backgroundLight = Color(0xFFFCFAF8);
  static const Color accent_1Light = Color(0xFF1D828E);
  static const Color accent_2Light = Color(0xFFFEAC5D);
  static const Color textLight = Color(0xFF140F1F);
  static const Color secondaryLight = Color(0xFFFFFFFF);

  //Dark theme draft
  static const Color backgroundDark = Color(0xFF323339);
  static const Color accent_1Dark = Color(0xFF327078);
  static const Color accent_2Dark = Color(0xFFBE854D);
  static const Color textDark = Color(0xFFDFDFDF);
  static const Color secondaryDark = Color(0xFF717484);
}
