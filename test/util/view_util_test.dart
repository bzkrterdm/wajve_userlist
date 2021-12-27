import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/util/view_util.dart';

void main() {
  test("Color for name", () {
    var color = ViewUtil.getColorForName("erdem");
    var sameColor = ViewUtil.getColorForName("erdem");
    var differentColor = ViewUtil.getColorForName("soheil");
    expect(_isSameColor(color, sameColor), true);
    expect(_isSameColor(color, differentColor), false);
  });
}

bool _isSameColor(Color color, Color otherColor) {
  return color.red == otherColor.red && color.green == otherColor.green && color.blue == otherColor.blue;
}
