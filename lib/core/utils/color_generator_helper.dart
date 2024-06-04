import 'package:flutter/cupertino.dart';

class ColorGeneratorHelper {
  /// generates a custom color based on the [inputString] provided
  Color generateColorByString(String inputString) {
    var hash = 0;
    for (var i = 0; i < inputString.length; i++) {
      hash = inputString.codeUnitAt(i) + ((hash << 5) - hash);
    }
    var h = hash % 360;
    return HSLColor.fromAHSL(1.0, h.toDouble(), 0.6, 0.75).toColor();
  }
}
