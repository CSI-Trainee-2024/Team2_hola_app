import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/login.dart';
import 'package:hola_app/loginScreens/register.dart';
import 'package:hola_app/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home:const registorScreen(),
    );
  }
}
