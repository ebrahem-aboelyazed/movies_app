import 'package:flutter/material.dart';
import 'package:movies_app/utils/utils.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  cardColor: const Color(0xff222222),
  dividerColor: const Color(0xff777777),
  // textTheme: const TextTheme(
  //   titleLarge: TextStyle(color: Color(0xfff5f5ff)),
  //   bodyLarge: TextStyle(color: Color(0xff999999)),
  //   bodyMedium: TextStyle(color: Color(0xff777777)),
  // ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkPrimaryColor,
    secondary: AppColors.darkSecondaryColor,
    background: AppColors.darkBackgroundColor,
    brightness: Brightness.dark,
  ),
  iconTheme: const IconThemeData(color: Color(0xff5A5A5A)),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: const Color(0xff83899B),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffd9d9d9)),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
