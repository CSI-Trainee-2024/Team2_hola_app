import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Closefriend extends StatefulWidget {
  const Closefriend({super.key});

  @override
  State<Closefriend> createState() => _ClosefriendState();
}

class _ClosefriendState extends State<Closefriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Close friends',style: textTheme.apptextTheme.headlineSmall,),
      ),
      body: Center(
        child: Text("Close Friends",style: textTheme.apptextTheme.headlineMedium,),
      ),
    );
  }
}