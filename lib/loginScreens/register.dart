// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hola_app/Screens/navigationBar.dart';
import 'package:hola_app/loginScreens/components/apiFunctions.dart';
import 'package:hola_app/loginScreens/components/background.dart';
import 'package:hola_app/loginScreens/components/customInput1.dart';
import 'package:hola_app/loginScreens/components/loginWithGoogle.dart';
import 'package:hola_app/loginScreens/components/textData.dart';
import 'package:hola_app/loginScreens/components/validators.dart';
import 'package:hola_app/loginScreens/login.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class registorScreen extends StatefulWidget {
  const registorScreen({super.key});

  @override
  State<registorScreen> createState() => _registorScreenState();
}

class _registorScreenState extends State<registorScreen> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: background(
        provideChild: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/register.png',
                          ))),
                ),
                Text(
                  'Sign Up',
                  style: textTheme.apptextTheme.headlineLarge,
                ),
                signUpHeading(),
                const SizedBox(
                  height: 25,
                ),
                inputField1(
                  controller1: fullNameController,
                  validators: nameValidator,
                  hintText: 'Full Name',
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 35,
                  ),
                  obscureText: false,
                  keyInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 12,
                ),
                inputField1(
                  controller1: emailController,
                  validators: emailValidator,
                  hintText: 'Email Address',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 35,
                  ),
                  obscureText: false,
                  keyInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 12,
                ),
                inputField1(
                  controller1: passwordController,
                  validators: passwordValidator,
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    size: 35,
                  ),
                  obscureText: true,
                  keyInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text('success'
                                    //data['message']
                                    )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorResolve())));
                      }
                      register(
                          fullNameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString());

                      if (data['success']! == true) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => navigationBar()));
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create'),
                        SizedBox(
                          width: 10,
                          height: 60,
                        ),
                        Text('Account')
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: privacySpan(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  orData(),
                  style: textTheme.apptextTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                const googleLogin(),
                // const SizedBox(
                //   height: 15,
                // ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const loginScreen()));
                  },
                  child: RichText(
                    text: haveAccount(),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
