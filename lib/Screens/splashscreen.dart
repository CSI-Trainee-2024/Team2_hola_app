import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/components/background.dart';
import 'package:hola_app/loginScreens/loginStatus/checkLogin.dart';

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
      const Duration(seconds: 4),
      () {
        checkLogin(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(
          provideChild: Center(
        child: Image.asset('assets/images/hola.png'),
      )),
    );
  }
}
