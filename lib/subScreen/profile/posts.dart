import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class ProfilePost extends StatefulWidget {
  const ProfilePost({super.key});

  @override
  State<ProfilePost> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Posts',
          style: textTheme.apptextTheme.headlineSmall,),
        ),
      ),
    );
  }
}