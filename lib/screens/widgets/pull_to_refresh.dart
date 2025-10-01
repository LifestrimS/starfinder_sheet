import 'dart:math' as math;

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class AppRefreshWidget extends StatelessWidget {
  final Widget child;
  final AsyncCallback onRefresh;

  final ValueNotifier<int> animationNumber = ValueNotifier<int>(0);

  AppRefreshWidget({required this.child, required this.onRefresh, super.key});

  static Widget _defaultBuilder(
          BuildContext context, Widget child, IndicatorController controller) =>
      child;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
        onStateChanged: (change) {
          if (change.currentState == IndicatorState.idle) {
            animationNumber.value = math.Random().nextInt(2);
          }
        },
        builder: (context, child, controller) {
          return Stack(
            children: <Widget>[
              _defaultBuilder(context, child, controller),
              _PositionedIndicatorContainer(
                edgeOffset: 20.0,
                displacement: 20.0,
                controller: controller,
                child: ScaleTransition(
                  scale: controller.isFinalizing
                      ? controller.clamp(0.0, 1.0)
                      : const AlwaysStoppedAnimation(1.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.all(4.0),
                    child: Material(
                      type: MaterialType.circle,
                      clipBehavior: Clip.none,
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: AnimatedBuilder(
                          animation: controller,
                          builder: (context, _) => ValueListenableBuilder(
                                valueListenable: animationNumber,
                                builder: (context, value, child) {
                                  return ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.textContrastDark,
                                        BlendMode.srcIn),
                                    child: getLottie(value),
                                  );
                                },
                              )),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        onRefresh: onRefresh,
        child: child);
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

class _PositionedIndicatorContainer extends StatelessWidget {
  final IndicatorController controller;
  final double displacement;
  final Widget child;
  final double edgeOffset;

  /// Position child widget in a similar way
  /// to the built-in [RefreshIndicator] widget.
  const _PositionedIndicatorContainer({
    Key? key,
    required this.child,
    required this.controller,
    required this.displacement,
    required this.edgeOffset,
  }) : super(key: key);

  Alignment _getAlignement(IndicatorSide side) {
    switch (side) {
      case IndicatorSide.left:
        return Alignment.centerLeft;
      case IndicatorSide.top:
        return Alignment.topCenter;
      case IndicatorSide.right:
        return Alignment.centerRight;
      case IndicatorSide.bottom:
        return Alignment.bottomCenter;
      case IndicatorSide.none:
        throw UnsupportedError('Cannot get alignement for "none" side.');
    }
  }

  EdgeInsets _getEdgeInsets(IndicatorSide side) {
    switch (side) {
      case IndicatorSide.left:
        return EdgeInsets.only(left: displacement);
      case IndicatorSide.top:
        return EdgeInsets.only(top: displacement);
      case IndicatorSide.right:
        return EdgeInsets.only(right: displacement);
      case IndicatorSide.bottom:
        return EdgeInsets.only(bottom: displacement);
      case IndicatorSide.none:
        throw UnsupportedError('Cannot get edge insets for "none" side.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final side = controller.side;
    if (side.isNone) return const SizedBox.shrink();

    final isVerticalAxis = side.isTop || side.isBottom;
    final isHorizontalAxis = side.isLeft || side.isRight;

    final AlignmentDirectional alignment = isVerticalAxis
        ? AlignmentDirectional(-1.0, side.isTop ? 1.0 : -1.0)
        : AlignmentDirectional(side.isLeft ? 1.0 : -1.0, -1.0);

    final endOffset = isVerticalAxis
        ? Offset(0.0, side.isTop ? 1.0 : -1.0)
        : Offset(side.isLeft ? 1.0 : -1.0, 0.0);

    final animation = controller.isFinalizing
        ? AlwaysStoppedAnimation(endOffset)
        : Tween(begin: const Offset(0.0, 0.0), end: endOffset)
            .animate(controller);

    return Positioned(
      top: isHorizontalAxis
          ? 0
          : side.isTop
              ? edgeOffset
              : null,
      bottom: isHorizontalAxis
          ? 0
          : side.isBottom
              ? edgeOffset
              : null,
      left: isVerticalAxis
          ? 0
          : side.isLeft
              ? edgeOffset
              : null,
      right: isVerticalAxis
          ? 0
          : side.isRight
              ? edgeOffset
              : null,
      child: Align(
        alignment: alignment,
        heightFactor: isVerticalAxis ? 0.0 : null,
        widthFactor: isHorizontalAxis ? 0.0 : null,
        child: SlideTransition(
          position: animation,
          child: Padding(
            padding: _getEdgeInsets(side),
            child: Align(
              alignment: _getAlignement(side),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
