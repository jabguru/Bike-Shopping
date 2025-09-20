import 'package:bike_shopping/gen/fonts.gen.dart';
import 'package:bike_shopping/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get themeData => ThemeData(
    fontFamily: FontFamily.poppins,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 13.0,
        color: AppColors.white.withValues(alpha: 0.6),
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final linearGradient = LinearGradient(
    colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final neutralGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFF000000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static final greyBlueGradient = LinearGradient(
    colors: [AppColors.greyBlue, AppColors.darkBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
