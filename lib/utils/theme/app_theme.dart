import 'package:flutter/material.dart';

class ThemeShadows {
  const ThemeShadows({
    required this.small,
    required this.defaultShadow,
    required this.other,
  });
  
  final List<BoxShadow> small;
  final List<BoxShadow> defaultShadow;
  final List<BoxShadow> other;
}

class ThemeText {
  const ThemeText({
    required this.headline,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.caption,
    required this.small,
  });

  final TextStyle headline;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle body;
  final TextStyle caption;
  final TextStyle small;
}

class ThemeSpacing {
  const ThemeSpacing({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  EdgeInsets all(double value) => EdgeInsets.all(value);

  EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  EdgeInsets vertical(double value) => EdgeInsets.symmetric(vertical: value);
}

class ThemeColorSet {
  const ThemeColorSet({
    required this.dark,
    required this.defaultColor,
    required this.background,
    required this.focused,
    required this.pressed,
    required this.outline,
  });

  final Color dark;
  final Color defaultColor;
  final Color background;
  final Color focused;
  final Color pressed;
  final Color outline;
}

class AppThemeColors {
  const AppThemeColors({
    required this.brand,
    required this.neutral,
    required this.success,
    required this.error,
    required this.warning,
  });

  final ThemeColorSet brand;
  final ThemeColorSet neutral;
  final ThemeColorSet success;
  final ThemeColorSet error;
  final ThemeColorSet warning;
}

class AppTheme {
  const AppTheme({
    required this.materialTheme,
    required this.customColors,
    required this.shadows,
    required this.spacing,
    required this.text,
  });

  final ThemeData materialTheme;
  final AppThemeColors customColors;
  final ThemeShadows shadows;
  final ThemeSpacing spacing;
  final ThemeText text;
}
