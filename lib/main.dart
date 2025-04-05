import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/app_root.dart';
import 'package:todo/providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
