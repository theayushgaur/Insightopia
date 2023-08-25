import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    background: const Color.fromRGBO(12, 53, 106, 1),
    primary: Color.fromRGBO(241, 240, 232, 1),
    secondary: Colors.white70,
    onSecondaryContainer: Colors.black54,
    tertiary: const Color.fromRGBO(241, 240, 232, 1), //for navbar Color
    onTertiary: Colors.white,
    tertiaryContainer: Colors.black, //for favScreen Text
  ),
);
