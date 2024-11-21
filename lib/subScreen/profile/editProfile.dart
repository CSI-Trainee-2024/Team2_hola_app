import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: textTheme.apptextTheme.bodyLarge,
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Edit profile',
            style: textTheme.apptextTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
