import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language',style: textTheme.apptextTheme.headlineSmall,),
      ),
      body: Center(
        child: Text('Language settings',style: textTheme.apptextTheme.headlineMedium,),
      ),
    );
  }
}