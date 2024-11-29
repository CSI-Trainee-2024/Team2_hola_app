import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Following',
          style: textTheme.apptextTheme.headlineSmall),
        ),
      ));
  }
}