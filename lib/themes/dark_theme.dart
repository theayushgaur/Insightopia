import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade800,
    onSecondary: Colors.grey.shade700,
    onSecondaryContainer: Colors.white54,
    tertiary: Colors.black, //for navbar
    onTertiary: Colors.white, //menubar text
    tertiaryContainer: Colors.white, //for favScreen text
  ),
);
