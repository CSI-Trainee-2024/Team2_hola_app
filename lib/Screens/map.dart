import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          'Locate others',
          style: textTheme.apptextTheme.headlineLarge,
        ),
      ),
    ));
  }
}
