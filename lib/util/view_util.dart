import 'package:flutter/material.dart';

class ViewUtil {
  static Color userRowBackgroundColor() {
    return const Color.fromRGBO(236, 236, 236, 1.0);
  }

  static Color getColorForName(String name) {
    String color =  "#FF" + name.hashCode.abs().toString();
    return HexColor(color.substring(0, 9).replaceAll('F', '9'));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
