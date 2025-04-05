import 'package:flutter/material.dart';

class ThemeShadows {
  final List<BoxShadow> small;
  final List<BoxShadow> defaultShadow;
  final List<BoxShadow> other;

  const ThemeShadows({
    required this.small,
    required this.defaultShadow,
    required this.other,
  });
}

class ThemeSpacing {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const ThemeSpacing({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  EdgeInsets all(double value) => EdgeInsets.all(value);

  EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  EdgeInsets vertical(double value) => EdgeInsets.symmetric(vertical: value);
}

class ThemeColorSet {
  final Color dark;
  final Color defaultColor;
  final Color background;
  final Color focused;
  final Color pressed;
  final Color outline;

  const ThemeColorSet({
    required this.dark,
    required this.defaultColor,
    required this.background,
    required this.focused,
    required this.pressed,
    required this.outline,
  });
}

class AppThemeColors {
  final ThemeColorSet brand;
  final ThemeColorSet neutral;
  final ThemeColorSet success;
  final ThemeColorSet error;
  final ThemeColorSet warning;

  const AppThemeColors({
    required this.brand,
    required this.neutral,
    required this.success,
    required this.error,
    required this.warning,
  });
}

class AppTheme {
  final ThemeData materialTheme;
  final AppThemeColors customColors;
  final ThemeShadows shadows;
  final ThemeSpacing spacing;

  const AppTheme(
      {required this.materialTheme,
      required this.customColors,
      required this.shadows,
      required this.spacing});
}
