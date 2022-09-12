import 'package:flutter/material.dart';

abstract class CustomColors {
  static Color green = const Color(0xFF8EC045);
  static Color black = const Color(0xFF111111);
}

abstract class CustomPadding {
  static double padding_1 = 4.0;
  static double padding_2 = 8.0;
  static double padding_3 = 12.0;
  static double padding_4 = 16.0;
}

abstract class CustomStyle {
  static TextStyle title = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle price = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
}
