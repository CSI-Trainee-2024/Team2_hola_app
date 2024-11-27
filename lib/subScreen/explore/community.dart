import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class communityPage extends StatefulWidget {
  const communityPage({super.key});

  @override
  State<communityPage> createState() => _communityPageState();
}

class _communityPageState extends State<communityPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No User available',style: textTheme.apptextTheme.headlineMedium,),
    );
  }
}