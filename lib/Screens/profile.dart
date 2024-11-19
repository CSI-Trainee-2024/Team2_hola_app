import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          'Manage your profile',
          style: textTheme.apptextTheme.headlineLarge,
        ),
      ),
    ));
  }
}
