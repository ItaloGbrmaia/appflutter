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

// MaterialColor _buildPrimarySwatch() {
//   const defaultPrimary = Color.fromARGB(255, 255, 255, 255);

//   return MaterialColor(
//     defaultPrimary.value,
//     const {
//       50: Color(0xFFFFFFFF),
//       100: Color(0xFFFFFFFF),
//       200: Color(0xFFFFFFFF),
//       300: Color(0xFFFFFFFF),
//       400: Color(0xFFFFFFFF),
//       500: defaultPrimary,
//       600: Color(0xFFFFFFFF),
//       700: Color(0xFFFFFFFF),
//       800: Color(0xFFFFFFFF),
//       900: Color(0xFFFFFFFF),
//     },
//   );
// }

// MaterialColor _buildSecondarySwatch() {
//   const defaultSecondary = Color(0xFFAE841A);

//   return MaterialColor(
//     defaultSecondary.value,
//     const {
//       50: Color(0xFFEAFAE6),
//       100: Color(0xFFCAF1C0),
//       200: Color(0xFFA4E796),
//       300: Color(0xFF79DD68),
//       400: Color(0xFF51D541),
//       500: defaultSecondary,
//       600: Color(0xFF00BD00),
//       700: Color(0xFF00A800),
//       800: Color(0xFF009400),
//       900: Color(0xFF007100),
//     },
//   );
// }

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
