//hide customLightTheme, customDarkTheme;
import 'package:flower_store/screens/mainpage/mainpage.screen.dart';
import 'package:flower_store/screens/store.main.screen.dart';
import 'package:flower_store/screens/welcome/login.screen.dart';
import 'package:flower_store/shared/components/custom.theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        theme: customLightTheme,
        darkTheme: customDarkTheme,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const LoginScreen());
  }
}
