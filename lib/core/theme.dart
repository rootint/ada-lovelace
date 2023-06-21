import 'package:flutter/material.dart';

abstract class AppTheme {
  static AppTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  late Color primary;
  late Color success;
  late Color error;
  late Color separator;
  late Color overlay;
  late Color labelPrimary;
  late Color labelSecondary;
  late Color labelTertiary;
  late Color labelDisabled;
  late Color gray;
  late Color lightGray;
  late Color white;
  late Color backPrimary;
  late Color backSecondary;
  late Color backElevated;

  TextStyle get largeTitle => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 32,
        color: labelPrimary,
        height: 1.1875,
      );

  TextStyle get title => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: labelPrimary,
        height: 1.6,
      );

  TextStyle get button => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: labelPrimary,
        height: 1.714,
      );

  TextStyle get body => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: labelPrimary,
        height: 1.25,
      );

  TextStyle get subhead => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: labelPrimary,
        height: 1.428,
      );
}

class DarkModeTheme implements AppTheme {
  @override
  Color primary = const Color(0xFF0A84FF);
  @override
  Color success = const Color(0xFF32D74B);
  @override
  Color error = const Color(0xFFFF453A);
  @override
  Color separator = const Color(0x33FFFFFF);
  @override
  Color overlay = const Color(0x52000000);
  @override
  Color labelPrimary = const Color(0xFFFFFFFF);
  @override
  Color labelSecondary = const Color(0x99FFFFFF);
  @override
  Color labelTertiary = const Color(0x66FFFFFF);
  @override
  Color labelDisabled = const Color(0x26FFFFFF);
  @override
  Color gray = const Color(0xFF8E8E93);
  @override
  Color lightGray = const Color(0xFF48484A);
  @override
  Color white = const Color(0xFFFFFFFF);
  @override
  Color backPrimary = const Color(0xFF161618);
  @override
  Color backSecondary = const Color(0xFF252528);
  @override
  Color backElevated = const Color(0xFF3C3C3F);

  @override
  TextStyle get largeTitle => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 32,
        color: labelPrimary,
        height: 1.1875,
      );

  @override
  TextStyle get title => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: labelPrimary,
        height: 1.6,
      );

  @override
  TextStyle get button => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: labelPrimary,
        height: 1.714,
      );

  @override
  TextStyle get body => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: labelPrimary,
        height: 1.25,
      );

  @override
  TextStyle get subhead => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: labelPrimary,
        height: 1.428,
      );
}

class LightModeTheme implements AppTheme {
  @override
  Color primary = const Color(0xFF007AFF);
  @override
  Color success = const Color(0xFF34C759);
  @override
  Color error = const Color(0xFFFF3B30);
  @override
  Color separator = const Color(0x33000000);
  @override
  Color overlay = const Color(0x0F000000);
  @override
  Color labelPrimary = const Color(0xFF000000);
  @override
  Color labelSecondary = const Color(0x99000000);
  @override
  Color labelTertiary = const Color(0x4D000000);
  @override
  Color labelDisabled = const Color(0x26000000);
  @override
  Color gray = const Color(0xFF8E8E93);
  @override
  Color lightGray = const Color(0xFFD1D1D6);
  @override
  Color white = const Color(0xFFFFFFFF);
  @override
  Color backPrimary = const Color(0xFFF7F6F2);
  @override
  Color backSecondary = const Color(0xFFFFFFFF);
  @override
  Color backElevated = const Color(0xFFFFFFFF);

  @override
  TextStyle get largeTitle => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 32,
        color: labelPrimary,
        height: 1.1875,
      );

  @override
  TextStyle get title => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: labelPrimary,
        height: 1.6,
      );

  @override
  TextStyle get button => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: labelPrimary,
        height: 1.714,
      );

  @override
  TextStyle get body => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: labelPrimary,
        height: 1.25,
      );

  @override
  TextStyle get subhead => TextStyle(
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

final appThemeLight = ThemeData(
  brightness: Brightness.light,
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
  fontFamily: 'Roboto',
);

final appThemeDark = ThemeData(
  brightness: Brightness.dark,
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
    onBackground: AppColorsDark.labelPrimary,
    surface: AppColorsDark.backSecondary,
    onSurface: AppColorsDark.labelPrimary,
  ),
  fontFamily: 'Roboto',
);
