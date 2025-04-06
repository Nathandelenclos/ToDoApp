import 'package:flutter/material.dart';
import 'package:todo/utils/theme/app_theme.dart';

const AppThemeColors lightThemeColors = AppThemeColors(
  brand: ThemeColorSet(
    dark: Color(0xFF11594B),
    defaultColor: Color(0xFF24A19C),
    background: Color(0xFFF2F9F9),
    focused: Color(0xFFA9CEC7),
    pressed: Color(0xFF0F4D40),
    outline: Color(0xFFF2F9F9),
  ),
  neutral: ThemeColorSet(
    dark: Color(0xFF1B1C1F),
    defaultColor: Color(0xFF737FA0),
    background: Color(0xFFA9B0C5),
    focused: Color(0xFFE3E6EC),
    pressed: Color(0xFFF6F7F9),
    outline: Color(0xFFFFFFFF),
  ),
  success: ThemeColorSet(
    dark: Color(0xFF117A7A),
    defaultColor: Color(0xFF17A1A1),
    background: Color(0xFFE3F3F3),
    focused: Color(0xFFB8D7D7),
    pressed: Color(0xFF0F6666),
    outline: Color(0xFF8BD0D0),
  ),
  error: ThemeColorSet(
    dark: Color(0xFFCC3A55),
    defaultColor: Color(0xFFFF486A),
    background: Color(0xFFFFE9ED),
    focused: Color(0xFFF0C4CC),
    pressed: Color(0xFFB2324A),
    outline: Color(0xFFFFA3B4),
  ),
  warning: ThemeColorSet(
    dark: Color(0xFFE0740F),
    defaultColor: Color(0xFFFD8311),
    background: Color(0xFFFEF0E2),
    focused: Color(0xFFF6D5B7),
    pressed: Color(0xFFCC6A0E),
    outline: Color(0xFFFEC188),
  ),
);

const ThemeText lightText = ThemeText(
  headline:
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
  title: TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
  subtitle: TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
  body: TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87),
  caption: TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54),
  small: TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black45),
);

const ThemeText darkText = ThemeText(
  headline:
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
  title: TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white70),
  subtitle: TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white70),
  body: TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white70),
  caption: TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white60),
  small: TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white54),
);

const ThemeShadows lightShadows = ThemeShadows(
  small: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ],
  defaultShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ],
  other: [
    BoxShadow(
      color: Colors.black38,
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ],
);

const ThemeSpacing defaultSpacing = ThemeSpacing(
  xs: 4.0,
  sm: 8.0,
  md: 16.0,
  lg: 24.0,
  xl: 32.0,
);

const ThemeShadows darkShadows = ThemeShadows(
  small: [
    BoxShadow(
      color: Colors.white12,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ],
  defaultShadow: [
    BoxShadow(
      color: Colors.white24,
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ],
  other: [
    BoxShadow(
      color: Colors.white30,
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ],
);

final AppTheme lightAppTheme = AppTheme(
  materialTheme: ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightThemeColors.brand.background,
    primaryColor: lightThemeColors.brand.defaultColor,
    colorScheme: ColorScheme.light(
      primary: lightThemeColors.brand.defaultColor,
      error: lightThemeColors.error.defaultColor,
    ),
  ),
  customColors: lightThemeColors,
  shadows: lightShadows,
  spacing: defaultSpacing,
  text: lightText,
);

final AppTheme darkAppTheme = AppTheme(
  materialTheme: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: lightThemeColors.brand.dark,
    colorScheme: ColorScheme.dark(
      primary: lightThemeColors.brand.dark,
      error: lightThemeColors.error.dark,
    ),
  ),
  customColors: lightThemeColors,
  shadows: darkShadows,
  spacing: defaultSpacing,
  text: darkText,
);
