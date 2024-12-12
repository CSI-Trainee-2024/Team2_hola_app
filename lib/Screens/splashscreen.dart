import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/components/background.dart';
import 'package:hola_app/loginScreens/loginStatus/checkLogin.dart';
import 'package:hola_app/loginScreens/register.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    checkLogin(context);
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const registorScreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return background(
        provideChild: Center(
      child: Image.asset('assets/images/hola.png'),
    ));
  }
}
