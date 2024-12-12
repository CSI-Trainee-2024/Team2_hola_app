import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help Centre",
          style: textTheme.apptextTheme.headlineSmall,
        ),
      ),
      body: Center(
        child: Text(
          "Help Centre",
          style: textTheme.apptextTheme.headlineMedium,
        ),
      ),
    );
  }
}
