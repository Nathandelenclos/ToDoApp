import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/app_root.dart';
import 'package:todo/providers/theme_provider.dart';
import 'package:todo/services/DatabaseHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DatabaseHelper();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
