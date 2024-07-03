import 'package:flower_store/screens/cart/checkout.screen.dart';
import 'package:flower_store/screens/welcome/login.screen.dart';
import 'package:flower_store/screens/welcome/register.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}