// lib/core/theme/app_theme.dart
import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.colorFoundationBrownNormal,
      scaffoldBackgroundColor: AppColors.colorFoundationSurfaceLight,
      appBarTheme: const AppBarTheme(
        color: AppColors.colorFoundationSurfaceLight,
        elevation: 0,
      ));
  
  }
}