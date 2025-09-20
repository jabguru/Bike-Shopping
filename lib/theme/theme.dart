import 'package:bike_shopping/gen/fonts.gen.dart';
import 'package:bike_shopping/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get themeData => ThemeData(
    fontFamily: FontFamily.poppins,
    scaffoldBackgroundColor: AppColors.background,
  );

  static final linearGradient = LinearGradient(
    colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final neutralGradient = LinearGradient(
    colors: [
      Color(0xFFFFFFFF).withValues(alpha: 0.6),
      Color(0xFF000000).withValues(alpha: 0.6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static final greyBlueGradient = LinearGradient(
    colors: [
      AppColors.greyBlue.withValues(alpha: 0.6),
      AppColors.darkBlue.withValues(alpha: 0.6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// ThemeData get kThemeData => ThemeData(
//   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
//   useMaterial3: true,
//   scaffoldBackgroundColor: AppColors.white,
//   hoverColor: Colors.transparent,
//   splashColor: Colors.transparent,
//   focusColor: Colors.transparent,
//   highlightColor: Colors.transparent,
//   fontFamily: FontFamily.inter,
//   // appBarTheme: const AppBarTheme(
//   //   backgroundColor: kWhiteColor,
//   //   iconTheme: IconThemeData(color: kBlackColor),
//   // ),
//   textTheme: TextTheme(
//     headlineLarge: TextStyle(
//       color: AppColors.black,
//       fontSize: 24.0,
//       fontWeight: FontWeight.w600,
//       height: 1.21,
//       letterSpacing: 24.0.percent(-4),
//     ),
//     titleLarge: TextStyle(
//       color: AppColors.black,
//       fontSize: 32.0,
//       fontWeight: FontWeight.w600,
//       height: 1.0,
//     ),
//     titleMedium: TextStyle(
//       color: AppColors.gray4,
//       fontSize: 20.0,
//       letterSpacing: 20.0.percent(-4),
//       fontWeight: FontWeight.w600,
//       height: 1.21,
//     ),
//     titleSmall: TextStyle(
//       color: AppColors.gray,
//       fontSize: 18.0,
//       fontWeight: FontWeight.w600,
//       height: 1.21,
//     ),
//     bodyLarge: TextStyle(
//       color: AppColors.gray5,
//       fontSize: 16.0,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 16.0.percent(4),
//     ),
//     bodyMedium: TextStyle(
//       color: AppColors.gray4,
//       fontSize: 14.0,
//       height: 1.21,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 0.0,
//     ),
//     bodySmall: TextStyle(
//       color: AppColors.gray4,
//       fontSize: 12.0,
//       fontWeight: FontWeight.w500,
//     ),
//     labelMedium: TextStyle(
//       color: AppColors.gray5,
//       fontSize: 10.0,
//       height: 1.21,
//       letterSpacing: 10.0.percent(4),
//       fontWeight: FontWeight.w400,
//     ),
//     labelSmall: TextStyle(
//       color: AppColors.gray5,
//       fontSize: 8.0,
//       letterSpacing: 8.0.percent(4),
//       fontWeight: FontWeight.w400,
//     ),
//   ),
// );
