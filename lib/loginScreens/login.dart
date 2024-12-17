// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hola_app/Screens/navigationBar.dart';
import 'package:hola_app/loginScreens/components/apiFunctions.dart';
import 'package:hola_app/loginScreens/components/background.dart';
import 'package:hola_app/loginScreens/components/customInput1.dart';
import 'package:hola_app/loginScreens/components/loginWithGoogle.dart';
import 'package:hola_app/loginScreens/components/sharedPref.dart';
import 'package:hola_app/loginScreens/components/textData.dart';
import 'package:hola_app/loginScreens/components/validators.dart';
import 'package:hola_app/loginScreens/forgetPassword.dart';
import 'package:hola_app/loginScreens/register.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final loginKey = GlobalKey<FormState>();
  final loginMail = TextEditingController();
  final loginPassword = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: background(
          provideChild: Form(
              key: loginKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/login.png'),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Sign In',
                      style: textTheme.apptextTheme.headlineLarge,
                    ),
                    loginHeading(),
                    const SizedBox(
                      height: 30,
                    ),
                    inputField1(
                      controller1: loginMail,
                      hintText: 'Email Address',
                      read: false,
                      obscureText: false,
                      validators: emailValidator,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 35,
                      ),
                      keyInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    inputField1(
                      controller1: loginPassword,
                      hintText: 'Password',
                      read: false,
                      obscureText: true,
                      validators: passwordValidator,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        size: 35,
                      ),
                      keyInputType: TextInputType.visiblePassword,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('Forgot Password?',
                              style: textTheme.apptextTheme.bodyMedium),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Forgetpassword(),
                                ));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (loginKey.currentState?.validate() ?? false) {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await login(
                              loginMail.text.toString(),
                              loginPassword.text.toString(),
                            );

                            setState(() {
                              isLoading = false;
                            });

                            if (data != null &&
                                data['access'] != null &&
                                data['refresh'] != null) {
                              String accessToken = data['access'];
                              String refreshToken = data['refresh'];
                              await saveTokens(accessToken, refreshToken);
                              await getTokens();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login Successful!'),
                                ),
                              );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => navigationBar(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Incorrect username or password'),
                                ),
                              );
                            }
                          } catch (e) {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('An error occurred: $e'),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorResolve())),
                          );
                        }
                      },
                      child: isLoading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 13, bottom: 13),
                                  child: CircularProgressIndicator(
                                    color: colors.whiteColor,
                                  ),
                                ),
                              ],
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 13, bottom: 13),
                                  child: Text('Login'),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      orData(),
                      style: textTheme.apptextTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const googleLogin(),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        //Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const registorScreen()));
                      },
                      child: RichText(
                        text: notHaveAccount(),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ))),
    ));
  }
}
