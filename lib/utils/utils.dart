import 'package:flutter/material.dart';

Color getColorFromString(String stringColor) {
  if (stringColor == '') {
    return Colors.black;
  }
  String valueString =
      stringColor.split('(0x')[1].split(')')[0]; // kind of hacky..
  int value = int.parse(valueString, radix: 16);
  return Color(value);
}
