import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/background.dart';
import 'package:hola_app/loginScreens/customInput1.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class registorScreen extends StatefulWidget {
  const registorScreen({super.key});

  @override
  State<registorScreen> createState() => _registorScreenState();
}

class _registorScreenState extends State<registorScreen> {
  @override
  Widget build(BuildContext context) {
    final fullName = TextEditingController();

    return SafeArea(
        child: Scaffold(
      body: background(
        provideChild: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/register.png'),
            Text(
              'Sign Up',
              style: textTheme.apptextTheme.headlineLarge,
            ),
            Text(
              'Use proper information to continue',
              style: textTheme.apptextTheme.bodyLarge,
            ),
            inputField1(
                controller1: fullName,
                hintText: 'Full Name',
                prefixIcon: const Icon(
                  Icons.person,
                  size: 35,
                ),
                obscureText: false),
            ElevatedButton(onPressed: () {}, child: Text('Create Account'))
          ],
        ),
      ),
    ));
  }
}
