import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Blocked extends StatefulWidget {
  const Blocked({super.key});

  @override
  State<Blocked> createState() => _BlockedState();
}

class _BlockedState extends State<Blocked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blocked users",style: textTheme.apptextTheme.headlineSmall,),
      ),
      body: Center(
        child: Text("All Blocked users",style: textTheme.apptextTheme.headlineMedium,),
      ),
    );
  }
}