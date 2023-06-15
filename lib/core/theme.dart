import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColorsLight.primary,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColorsLight.primary,
        onPrimary: AppColorsLight.white,
        secondary: AppColorsLight.primary,
        onSecondary: AppColorsLight.white,
        error: AppColorsLight.error,
        onError: AppColorsLight.white,
        background: AppColorsLight.backPrimary,
        onBackground: AppColorsLight.labelPrimary,
        surface: AppColorsLight.backSecondary,
        onSurface: AppColorsLight.labelPrimary,
        onPrimaryContainer: AppColorsLight.labelPrimary,
      ),
      // datePickerTheme: DatePickerThemeData(

      // ),

      fontFamily: 'Roboto',
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColorsDark.primary,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColorsDark.primary,
        onPrimary: AppColorsDark.white,
        secondary: AppColorsDark.primary,
        onSecondary: AppColorsDark.white,
        error: AppColorsDark.error,
        onError: AppColorsDark.white,
        background: AppColorsDark.backPrimary,
        // background: AppColorsLight.backPrimary,
        onBackground: AppColorsDark.labelPrimary,
        surface: AppColorsDark.backSecondary,
        onSurface: AppColorsDark.labelPrimary,
      ),
      fontFamily: 'Roboto',
    );
  }
}

class AppColors {
  static const Color primary = Color(0xFF007AFF);
  static const Color success = Color(0xFF34C759);
  static const Color error = Color(0xFFFF3B30);
  static const Color separator = Color(0x33000000);
  static const Color overlay = Color(0x0F000000);
  static const Color labelPrimary = Color(0xFF000000);
  static const Color labelSecondary = Color(0x99000000);
  static const Color labelTertiary = Color(0x4D000000);
  static const Color labelDisabled = Color(0x26000000);
  static const Color gray = Color(0xFF8E8E93);
  static const Color lightGray = Color(0xFFD1D1D6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backPrimary = Color(0xFFF7F6F2);
  static const Color backSecondary = Color(0xFFFFFFFF);
  static const Color backElevated = Color(0xFFFFFFFF);

  // static const Color primary = Color(0xFF0A84FF);
  // static const Color success = Color(0xFF32D74B);
  // static const Color error = Color(0xFFFF453A);
  // static const Color separator = Color(0x33FFFFFF);
  // static const Color overlay = Color(0x52000000);
  // static const Color labelPrimary = Color(0xFFFFFFFF);
  // static const Color labelSecondary = Color(0x99FFFFFF);
  // static const Color labelTertiary = Color(0x66FFFFFF);
  // static const Color labelDisabled = Color(0x26FFFFFF);
  // static const Color gray = Color(0xFF8E8E93);
  // static const Color lightGray = Color(0xFF48484A);
  // static const Color white = Color(0xFFFFFFFF);
  // static const Color backPrimary = Color(0xFF161618);
  // static const Color backSecondary = Color(0xFF252528);
  // static const Color backElevated = Color(0xFF3C3C3F);


  static TextStyle get largeTitle => const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 32,
        color: labelPrimary,
        height: 1.1875,
      );

  static TextStyle get title => const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: labelPrimary,
        height: 1.6,
      );

  static TextStyle get button => const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: labelPrimary,
        height: 1.714,
      );

  static TextStyle get body => const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: labelPrimary,
        height: 1.25,
      );

  static TextStyle get subhead => const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: labelPrimary,
        height: 1.428,
      );
}

class AppColorsLight {
  static const Color primary = Color(0xFF007AFF);
  static const Color success = Color(0xFF34C759);
  static const Color error = Color(0xFFFF3B30);
  static const Color separator = Color(0x33000000);
  static const Color overlay = Color(0x0F000000);
  static const Color labelPrimary = Color(0x00000000);
  static const Color labelSecondary = Color(0x99000000);
  static const Color labelTertiary = Color(0x4D000000);
  static const Color labelDisabled = Color(0x26000000);
  static const Color gray = Color(0xFF8E8E93);
  static const Color lightGray = Color(0xFFD1D1D6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backPrimary = Color(0xFFF7F6F2);
  static const Color backSecondary = Color(0xFFFFFFFF);
  static const Color backElevated = Color(0xFFFFFFFF);
}

class AppColorsDark {
  static const Color primary = Color(0xFF0A84FF);
  static const Color success = Color(0xFF32D74B);
  static const Color error = Color(0xFFFF453A);
  static const Color separator = Color(0x33FFFFFF);
  static const Color overlay = Color(0x52000000);
  static const Color labelPrimary = Color(0xFFFFFFFF);
  static const Color labelSecondary = Color(0x99FFFFFF);
  static const Color labelTertiary = Color(0x66FFFFFF);
  static const Color labelDisabled = Color(0x26FFFFFF);
  static const Color gray = Color(0xFF8E8E93);
  static const Color lightGray = Color(0xFF48484A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backPrimary = Color(0xFF161618);
  static const Color backSecondary = Color(0xFF252528);
  static const Color backElevated = Color(0xFF3C3C3F);
}
