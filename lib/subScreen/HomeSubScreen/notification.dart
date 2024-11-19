import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class notificationScreen extends StatelessWidget {
  const notificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: colors.greyColor,
      ),
      body: Center(
        child: Text(
          'No new Notification',
          style: textTheme.apptextTheme.headlineLarge,
        ),
      ),
    ));
  }
}
