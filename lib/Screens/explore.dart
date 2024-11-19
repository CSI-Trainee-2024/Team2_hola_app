import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class exploreScreen extends StatefulWidget {
  const exploreScreen({super.key});

  @override
  State<exploreScreen> createState() => _exploreScreenState();
}

class _exploreScreenState extends State<exploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Center(
        child: Text('Explore',style: textTheme.apptextTheme.headlineLarge,),
      ),
    ));
  }
}