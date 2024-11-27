import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/components/background.dart';
import 'package:hola_app/loginScreens/components/customInput1.dart';
import 'package:hola_app/loginScreens/components/textData.dart';
import 'package:hola_app/loginScreens/components/validators.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final otpKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: background(
            provideChild: Form(
                child: Form(
                    key: otpKey,
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
                          otpHeading(),
                          const SizedBox(
                            height: 30,
                          ),
                          inputField1(
                              controller1: otpController,
                              hintText: 'Enter OTP',
                              //validators: ,
                              keyInputType: TextInputType.number,
                              obscureText: false),
                          const SizedBox(
                            height: 35,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 13, bottom: 13),
                                    child: Text('Submit'),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )))),
      ),
    );
    ;
  }
}
