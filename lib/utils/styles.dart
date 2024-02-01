import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

abstract class AppStyles {
  static TextStyle h1Black() {
    return const TextStyle(
      fontSize: 24.0,
      height: 1.16,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    );
  }
}
