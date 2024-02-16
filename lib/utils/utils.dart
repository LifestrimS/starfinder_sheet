import 'dart:ui';

Color getColorFromString(String stringColor) {
  String valueString =
      stringColor.split('(0x')[1].split(')')[0]; // kind of hacky..
  int value = int.parse(valueString, radix: 16);
  return Color(value);
}
