import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  // final primarySwatch = _buildPrimarySwatch();
  // final secondarySwatch = _buildSecondarySwatch();
  const textColor = Colors.black;

  const iconSize = 24.0;

  final textTheme = _buildTextTheme('Manrope', textColor: textColor);

  // Themes

  const iconTheme = IconThemeData(color: Colors.grey, size: iconSize);

  return ThemeData(
    // brightness: brightness,
    // primaryColor: primarySwatch,
    // colorScheme: colorScheme,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    iconTheme: iconTheme,
  );
}

TextTheme _buildTextTheme(String fontFamily, {required Color textColor}) {
  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 96,
      height: 1.17,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 60,
      height: 1.2,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 48,
      height: 1,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      height: 1.19,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      height: 1.17,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      height: 1.2,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      height: 1.25,
      fontWeight: FontWeight.w300,
      color: textColor,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      height: 1.14,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      height: 1.57,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      height: 1.25,
      fontWeight: FontWeight.w700,
      color: textColor,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      height: 1.33,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      height: 1,
      fontWeight: FontWeight.w400,
      color: textColor,
    ),
  );
}
