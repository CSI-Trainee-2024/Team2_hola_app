import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class reelScreen extends StatefulWidget {
  const reelScreen({super.key});

  @override
  State<reelScreen> createState() => _reelScreenState();
}

class _reelScreenState extends State<reelScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Explore Reels',style: textTheme.apptextTheme.headlineLarge,),
        ),
      )
    );
  }
}