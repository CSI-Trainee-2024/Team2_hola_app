// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/components/background.dart';
import 'package:hola_app/loginScreens/components/customInput1.dart';
import 'package:hola_app/loginScreens/components/textData.dart';
import 'package:hola_app/loginScreens/components/validators.dart';
import 'package:hola_app/loginScreens/otp.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final forgetKey = GlobalKey<FormState>();
  final forgetMail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: background(
            provideChild: Form(
                child: Form(
                    key: forgetKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/forget.png'),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Forgot Password',
                            style: textTheme.apptextTheme.headlineLarge,
                          ),
                          forgotHeading(),
                          const SizedBox(
                            height: 30,
                          ),
                          inputField1(
                              controller1: forgetMail,
                              hintText: 'Email Address',
                              validators: emailValidator,
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                size: 35,
                              ),
                              keyInputType: TextInputType.emailAddress,
                              obscureText: false),
                          const SizedBox(
                            height: 35,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OtpPage(),
                                    ));
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 13, bottom: 13),
                                    child: Text('Get OTP'),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )))),
      ),
    );
  }
}
