import 'package:flutter/material.dart';

class ViewUtil {
  static Color userRowBackgroundColor() {
    return const Color.fromRGBO(236, 236, 236, 1.0);
  }

  static Color getColorForName(String name) {
    var color = '#';
    var hash = 0;
    for (var i = 0; i < name.length; i++) {
      hash = name.codeUnits[i] + ((hash << 5) - hash);
    }
    for (var i = 0; i < 3; i++) {
      var value = (hash >> (i * 8)) & 0xFF;
      color += ('00' + value.toRadixString(16)).substring(2);
    }
    return HexColor(color);
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
