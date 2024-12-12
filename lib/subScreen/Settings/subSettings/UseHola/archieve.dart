import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Archieve extends StatefulWidget {
  const Archieve({super.key});

  @override
  State<Archieve> createState() => _ArchieveState();
}

class _ArchieveState extends State<Archieve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Archieve",style: textTheme.apptextTheme.headlineSmall,),
    ),
    body: Center(
      child: Text('Archieve Posts',style: textTheme.apptextTheme.headlineMedium,),
    ),
    );
  }
}