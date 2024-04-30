import 'package:flutter/material.dart';
import 'package:movies_app/utils/utils.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Color(0xff0c1c3d)),
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black54),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.lightPrimaryColor,
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.lightPrimaryColor,
    elevation: 0,
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
