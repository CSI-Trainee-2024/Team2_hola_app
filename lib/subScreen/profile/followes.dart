import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Followes extends StatefulWidget {
  const Followes({super.key});

  @override
  State<Followes> createState() => _FollowesState();
}

class _FollowesState extends State<Followes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Followes',style: textTheme.apptextTheme.headlineSmall,),
        ),
      ));
  }
}