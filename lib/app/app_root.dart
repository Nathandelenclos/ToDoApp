import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/constants/routes.dart';
import 'package:todo/providers/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final current = themeProvider.currentTheme;
    return MaterialApp.router(
      theme: current.materialTheme,
      routerConfig: GoRouter(routes: listRoute),
    );
  }
}
