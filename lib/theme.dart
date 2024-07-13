import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundYellowLight = Color.fromRGBO(255, 243, 219, 1);
  static const Color backgroundYellowDark = Color.fromRGBO(253, 185, 51, 1);
  static const Color highlightBlue = Color.fromRGBO(0, 139, 144, 1);
  static const Color backgroundGrey = Color.fromRGBO(244, 245, 247, 1);
  static const Color highlightYellow = Color.fromRGBO(217, 159, 44, 1);
  static const Color blackDark = Color.fromRGBO(51, 51, 51, 1);
  static const Color lightGrey = Color.fromRGBO(200, 200, 204, 1);
  static const Color blackLight = Color.fromRGBO(87, 87, 92, 1);
  static const Color error = Color.fromRGBO(242, 155, 155, 1);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Museo Sans',
      appBarTheme: const AppBarTheme(),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: backgroundYellowDark,
          onPrimary: backgroundYellowLight,
          secondary: backgroundGrey,
          onSecondary: blackLight,
          tertiary: highlightBlue,
          onTertiary: Colors.white,
          surface: Colors.white,
          onSurface: blackLight,
          surfaceContainer: lightGrey,
          primaryContainer: backgroundYellowLight,
          onPrimaryContainer: highlightYellow,
          error: error,
          onError: error),
      textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: 16, height: 1.5),
          bodyMedium: TextStyle(fontSize: 20),
          bodyLarge: TextStyle(fontSize: 24, color: blackDark, height: 1.5),
          titleMedium: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w600, color: blackDark),
          titleLarge: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: blackDark)),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: blackLight, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: blackLight, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
