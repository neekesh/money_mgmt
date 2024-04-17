import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primaryContainer.withOpacity(1),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        headlineLarge: TextStyle(
          color: appTheme.blueGray700,
          fontSize: 30.fSize,
          fontFamily: 'Roboto Serif',
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onError,
          fontSize: 27.fSize,
          fontFamily: 'Roboto Serif',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 25.fSize,
          fontFamily: 'Roboto Serif',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primaryContainer.withOpacity(1),
          fontSize: 12.fSize,
          fontFamily: 'Roboto Serif',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 20.fSize,
          fontFamily: 'Roboto Serif',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onError,
          fontSize: 18.fSize,
          fontFamily: 'Roboto Serif',
          fontWeight: FontWeight.w800,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primaryContainer.withOpacity(1),
          fontSize: 15.fSize,
          fontFamily: 'Roboto Serif',
          fontWeight: FontWeight.w800,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    primary: Color(0X3F000000),
    primaryContainer: Color(0X66000000),
    onError: Color(0XFFFFFFFF),
    onPrimary: Color(0XFF0F5323),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray700 => Color(0XFF40734F);
// Graye
  Color get gray1009e => Color(0X9EF2FFF3);
// Gray
  Color get gray500 => Color(0XFFA1A9A2);
// Green
  Color get green600 => Color(0XFF4B984D);
// Lime
  Color get lime300 => Color(0XFFD8E989);
  Color get lime400 => Color(0XFFC9C55E);
  Color get lime900 => Color(0XFF63681B);
// Yellow
  Color get yellow900 => Color(0XFFCC7B29);
}
