import 'package:flower_store/screens/favorite.screen.dart';
import 'package:flower_store/screens/store.main.screen.dart';
import 'package:flower_store/screens/welcome/login.screen.dart';
import 'package:flower_store/screens/welcome/register.screen.dart';
import 'package:flower_store/shared/components/custom_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customLightTheme,
      darkTheme: customDarkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const LoginScreen(),
    );
  }
}