import '../core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillGreen => ElevatedButton.styleFrom(
        backgroundColor: appTheme.green600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.h),
        ),
      );
  static ButtonStyle get fillGreenTL19 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.green600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.h),
        ),
      );
// text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
  static ButtonStyle get outlinePrimaryTL14 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.green600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
        shadowColor: theme.colorScheme.primary,
        elevation: 6,
      );
}
