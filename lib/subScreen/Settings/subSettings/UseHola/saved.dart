import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Posts',style: textTheme.apptextTheme.headlineSmall,),
      ),
      body: Center(
        child: Text("All Saved post",style: textTheme.apptextTheme.headlineMedium,),
      ),
    );
  }
}