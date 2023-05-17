import 'package:flutter/material.dart';

class ColorLib {
  static final primary = '#1ED760'.toColor();
  static final white = '#FFFFFF'.toColor();
  static final black = '#121212'.toColor();
  static final bodyText = '#B8B8B8'.toColor();
  static final icon = '#B3B3B3'.toColor();
  static final label = '#B3B3B3'.toColor();
  static final grayButton = '#2A2A2A'.toColor();
  static final greenButton = '#14833B'.toColor();
  static final grayBlack1 = '#282828'.toColor();
  static final grayBlack2 = '#444444'.toColor();
  static final trackLine = '#2A2A2A'.toColor();
  static final buttonStroke = '#7F7F7F'.toColor();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
