import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  ///Primary colors
  static const Color primary100 = Color(0xFF2C50E6);
  static const Color primary20 = Color(0xFFDDE3FC);
  static const Color primary10 = Color(0xFFECEFFA);
  static const Color primary5 = Color(0xFFF5F7FF);

  ///Neutral colors
  static const Color neutral100 = Color(0xFF1B1F3B);
  static const Color neutral80 = Color(0xFF788090);
  static const Color neutral60 = Color(0xFF9099AB);
  static const Color neutral40 = Color(0xFFA5ACBD);
  static const Color neutral20 = Color(0xFFCED0D4);
  static const Color neutral10 = Color(0xFFE7E8EA);
  static const Color neutral00 = Color(0xFFFFFFFF);

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

  ///Shadow accent colors
  static Color shadowBar = const Color(0xFF475069).withOpacity(0.15);
  static Color shadowCard = const Color(0xFF182C61).withOpacity(0.12);
  static Color shadowButton = const Color(0xFF324063).withOpacity(0.1);

  ///Text colors
  static const Color textColorBright = Color.fromARGB(255, 255, 255, 255);
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
}
