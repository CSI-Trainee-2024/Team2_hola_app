import 'package:flutter/material.dart';

class commentScreen extends StatefulWidget {
  const commentScreen({super.key});

  @override
  State<commentScreen> createState() => _commentScreenState();
}

class _commentScreenState extends State<commentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Comments',),
      ),
    );
  }
}