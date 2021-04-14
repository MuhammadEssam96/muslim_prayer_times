import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData lightThemeData = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    primaryVariant: AppColors.primaryColorLight,
    secondary: AppColors.accentColor,
    secondaryVariant: AppColors.accentColorLight,
    background: AppColors.primaryColor,
  ),
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.accentColorLight,
  primaryColorDark: AppColors.primaryColorDark,
  accentColor: AppColors.accentColor,
  backgroundColor: AppColors.primaryColor,
  brightness: Brightness.light
);