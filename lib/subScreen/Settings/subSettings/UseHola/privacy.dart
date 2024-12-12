import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Privacy',style: textTheme.apptextTheme.headlineSmall,),
      ),
      body: Center(
        child: Text("Account Privacy",style: textTheme.apptextTheme.headlineMedium,),
      ),
    );
  }
}