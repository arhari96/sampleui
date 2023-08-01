import 'package:flutter/material.dart';

class Constants {
  static const String _ACCESSkEY = '-o8uGkzV2waHsGWuA33F3njiv-iu4QsiL0JgGEccgUY';
  static const String _SECRETKEY = 'RHW2P9Lgt_vmRAmOrDBFkRYqEy2h7W4RTVRObVkJafE';
  static String get ACCESSKEY => _ACCESSkEY;
  static String get SECRETKEY => _SECRETKEY;
  static String get GETXUPDATEKEY => 'Photos';
  static String get GETXSEARCHUPDATEKEY => 'SearchPhoto';
  static const String Url = 'https://api.unsplash.com/';
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
