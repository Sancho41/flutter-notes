import 'package:flutter/material.dart';

Map<String, String> _colors = {
  'white': "#fff",
  'red': "#e74c3c2e",
  'blue': "#3498db2e",
  'green': "#59b6712e"
};

int hexStringToInt(String hexString) => int.parse(hexString, radix: 16);

Color colorFromString(String stringColor) {
  if (stringColor.length == 9) {
    int r = hexStringToInt(stringColor.substring(1, 3));
    int g = hexStringToInt(stringColor.substring(3, 5));
    int b = hexStringToInt(stringColor.substring(5, 7));
    int a = hexStringToInt(stringColor.substring(7, 9));
    return Color.fromRGBO(r, g, b, a / 100);
  }

  if (stringColor.length == 4) {
    int r = hexStringToInt(stringColor.substring(1, 2));
    int g = hexStringToInt(stringColor.substring(2, 3));
    int b = hexStringToInt(stringColor.substring(3, 4));
    return Color.fromRGBO(r, g, b, 1.0);
  }

  return Color.fromRGBO(255, 255, 255, 1.0);
}