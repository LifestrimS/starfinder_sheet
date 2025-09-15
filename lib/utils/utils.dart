import 'dart:developer';

import 'package:flutter/material.dart';

Color getColorFromString(String stringColor) {
  log('getColorFromString: $stringColor');

  if (stringColor == '') {
    return Colors.black;
  }

  if (stringColor.startsWith('0x')) {
    String valueString = stringColor.split('(0x')[1].split(')')[0];
    int value = int.parse(valueString, radix: 16);
    return Color(value);
  }

  if (stringColor.startsWith('Color') ||
      stringColor.startsWith('MaterialColor')) {
    String tmpString;

    if (stringColor.startsWith('MaterialColor')) {
      tmpString = stringColor.substring(stringColor.indexOf(':') + 1);
    } else {
      tmpString = stringColor;
    }

    final tmpStringList = tmpString.split(': ');

    final splittedColor = [
      tmpStringList[1].substring(0, tmpStringList[1].indexOf(',')),
      tmpStringList[2].substring(0, tmpStringList[1].indexOf(',')),
      tmpStringList[3].substring(0, tmpStringList[1].indexOf(',')),
      tmpStringList[4].substring(0, tmpStringList[1].indexOf(','))
    ];

    Color color = Color.from(
        alpha: double.parse(splittedColor[0]),
        red: double.parse(splittedColor[1]),
        green: double.parse(splittedColor[2]),
        blue: double.parse(splittedColor[3]));

    return color;
  }

  return Colors.black;
}
