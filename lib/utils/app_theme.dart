import 'package:flutter/material.dart';
import 'package:emotions_diary/utils/custom_colors.dart';


ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    primary: CustomColors.bodyColor,
    seedColor: CustomColors.bodyColor,
  ),
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: CustomColors.customBlack,
    ),
    titleMedium: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: CustomColors.gray2,
    ),
    titleSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: CustomColors.customBlack,
    ),
    labelLarge: TextStyle(
      fontSize: 22,
    fontWeight: FontWeight.w700,
      color: CustomColors.gray2,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: CustomColors.gray2,
    ),
  ),
);