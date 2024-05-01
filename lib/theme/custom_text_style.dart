import '../core/app_export.dart';
import 'package:flutter/material.dart';

extension on TextStyle {}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Headline text style
  static get headlineLargeOnPrimary => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontSize: 21.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePrimaryContainerSemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallOnError => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onError,
        fontSize: 24.fSize,
      );
  static get labelLargePrimaryContainerSemiBold_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get headlineMediumOnPrimary =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get headlineMediumPrimaryContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get headlineSmallBlack => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w900,
      );
// Label text style
  static get labelLargeOnPrimary_1 => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
// Title text style
  static get titleLargeOnError => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onError,
        fontSize: 23.fSize,
      );
  static get titleLargeOnErrorExtraBold => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOnErrorSemiBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOnError_1 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallOnError => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w600,
      );
}
