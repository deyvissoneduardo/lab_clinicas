import 'package:flutter/material.dart';

final class LabClinicasTheme {
  static const orangeColor = Color(0XFFFFAE45);
  static const lightOrangeColor = Color(0XFFFFEFE9);
  static const blueColor = Color(0XFF01BDD6);
  static const lightGreColor = Color(0XFFFFEFE9);

  static final _defualtBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: lightOrangeColor),
  );

  static final darkTheme = lightTheme;
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    colorScheme: ColorScheme.fromSeed(seedColor: lightOrangeColor),
    scaffoldBackgroundColor: lightOrangeColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightOrangeColor,
      labelStyle: const TextStyle(
        fontSize: 14,
        color: orangeColor,
        fontWeight: FontWeight.w700,
      ),
      floatingLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        color: blueColor,
      ),
      border: _defualtBorder,
      enabledBorder: _defualtBorder,
      focusedBorder: _defualtBorder,
      errorBorder: _defualtBorder.copyWith(
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blueColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );

  static const titleStyle =
      TextStyle(color: blueColor, fontSize: 32, fontWeight: FontWeight.w900);
  static const titleSmallStyle =
      TextStyle(color: blueColor, fontSize: 24, fontWeight: FontWeight.w900);
  static const subTitleSmallStyle =
      TextStyle(color: blueColor, fontSize: 18, fontWeight: FontWeight.w500);
}
