import 'package:flutter/material.dart';
import 'package:hola_app/Screens/navigationBar.dart';
import 'package:hola_app/loginScreens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkLogin(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? access = prefs.getString('accessToken');
  String? refresh = prefs.getString('refreshToken');

  if (access != null && refresh != null) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => navigationBar(),
        ));
  } else {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginScreen(),
        ));
  }
}
