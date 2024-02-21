import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pathfinder_sheet/utils/theme.dart';

/// Виджет индикатор ожидания
class LoadingIndicatorWidget extends StatelessWidget {
  final AppTheme theme;
  final double? dimension;

  final ValueNotifier<int> animationNumber = ValueNotifier<int>(0);

  LoadingIndicatorWidget({required this.theme, this.dimension, super.key});

  @override
  Widget build(BuildContext context) {
    animationNumber.value = math.Random().nextInt(2);

    return SizedBox(
      width: dimension ?? 150.0,
      height: dimension ?? 150.0,
      child: ValueListenableBuilder(
        valueListenable: animationNumber,
        builder: (context, value, child) {
          return ColorFiltered(
              colorFilter: ColorFilter.mode(
                  theme.getTextContrastColor(), BlendMode.srcIn),
              child: getLottie(value));
        },
      ),
    );
  }

  Widget getLottie(int number) {
    if (number == 1) {
      return Lottie.asset(
        'assets/images/d20_withground.json',
      );
    } else {
      return Lottie.asset(
        'assets/images/d20_withground_1.json',
      );
    }
  }
}
