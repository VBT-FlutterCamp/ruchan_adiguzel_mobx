import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      // color: Color(0xFF29773E),
      iconTheme: const IconThemeData(color: const Color(0xff369457)),
    ),
    primaryTextTheme: const TextTheme(
        displayLarge: TextStyle(color: Color(0xFF369457)),
        displayMedium: TextStyle(color: Color(0xFF29773E)),
        displaySmall: TextStyle(color: Colors.red)),
  );
}
// Color(0xFF1f6032)
// Color(0xFF29773E)
//Color(0xFF369457)