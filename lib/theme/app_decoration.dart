import '../core/app_export.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green600,
      );
  static BoxDecoration get gradientGreenToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.green600, appTheme.blueGray100.withOpacity(0)],
        ),
      );
  static BoxDecoration get gradientLimeToErrorContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.lime900,
            theme.colorScheme.errorContainer.withOpacity(0)
          ],
        ),
      );
  static BoxDecoration get gradientGreenToErrorContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.green600,
            theme.colorScheme.errorContainer.withOpacity(0)
          ],
        ),
      );
  static BoxDecoration get fillLime => BoxDecoration(
        color: appTheme.lime900,
      );
  static BoxDecoration get fillLime400 => BoxDecoration(
        color: appTheme.lime400,
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );

// Gradient decorations
  static BoxDecoration get gradientBlueGrayToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.blueGray100, appTheme.blueGray100.withOpacity(0)],
        ),
      );
  static BoxDecoration get gradientErrorContainerToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [theme.colorScheme.errorContainer, appTheme.blueGray10000],
        ),
      );

  static BoxDecoration get gradientYellowToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.yellow900, appTheme.blueGray10000],
        ),
      );
  static BoxDecoration get gradientOnPrimaryToErrorContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimary,
            theme.colorScheme.errorContainer.withOpacity(0)
          ],
        ),
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: appTheme.green600,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              6,
              6,
            ),
          )
        ],
      );
  static BoxDecoration get gradientGrayEToGray1009e => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.gray1009e, appTheme.gray1009e],
        ),
      );
  static BoxDecoration get gradientGrayEToGrayE => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.gray1009e, appTheme.gray1009e],
        ),
      );
  static BoxDecoration get gradientLimeToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.lime300, appTheme.blueGray100.withOpacity(0)],
        ),
      );
  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: appTheme.lime900,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              6,
              6,
            ),
          )
        ],
      );
// Outline decorations
  static BoxDecoration get outlinePrimary => BoxDecoration();
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder50 => BorderRadius.circular(
        50.h,
      );
  static BorderRadius get roundedBorder80 => BorderRadius.circular(
        80.h,
      );
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
}
