import 'package:flutter/material.dart';
import 'package:hola_app/Screens/profile.dart';
import 'package:hola_app/loginScreens/components/customInput1.dart';
import 'package:hola_app/loginScreens/components/textData.dart';
import 'package:hola_app/loginScreens/components/validators.dart';
import 'package:hola_app/loginScreens/forgetPassword.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final currentPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change password',
          style: textTheme.apptextTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            passwordHeading(),
            const SizedBox(
              height: 20,
            ),
            inputField1(
                controller1: currentPass,
                hintText: 'Current password',
                read: false,
                validators: passwordValidator,
                keyInputType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  size: 35,
                ),
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            inputField1(
                controller1: newPass,
                hintText: 'New password',
                read: false,
                validators: passwordValidator,
                keyInputType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  size: 35,
                ),
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            inputField1(
                controller1: confirmPass,
                hintText: 'Confirm password',
                read: false,
                validators: passwordValidator,
                keyInputType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  size: 35,
                ),
                obscureText: false),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Forgetpassword(),
                      ));
                },
                child: Text(
                  'Forgotten your password?',
                  style: textTheme.apptextTheme.displaySmall,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const profileScreen()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 13, bottom: 13),
                      child: Text('SUBMIT'),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
