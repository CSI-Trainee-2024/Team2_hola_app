import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/components/customInput1.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final nameController = TextEditingController(text: 'Paul Jarvis');
  final userController = TextEditingController(text: 'Allen003');
  final bioController =
      TextEditingController(text: 'Trust the process of nature');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: textTheme.apptextTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/userImage.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Edit picture',
              style: textTheme.apptextTheme.bodyMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            inputField1(
              controller1: nameController,
              obscureText: false,
              labelText: 'Name',
            ),
            const SizedBox(
              height: 20,
            ),
            inputField1(
              controller1: userController,
              obscureText: false,
              labelText: 'Username',
            ),
            const SizedBox(
              height: 20,
            ),
            inputField1(
                controller1: bioController,
                labelText: 'Bio',
                obscureText: false)
          ],
        ),
      ),
    );
  }
}
