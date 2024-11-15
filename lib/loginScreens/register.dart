import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/background.dart';
import 'package:hola_app/loginScreens/customInput1.dart';
import 'package:hola_app/loginScreens/validators.dart';
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
                    controller1: fullNameController,
                    validators: nameValidator,
                    hintText: 'Full Name',
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 35,
                    ),
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                inputField1(
                    controller1: emailController,
                    validators: emailValidator,
                    hintText: 'Email Address',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 35,
                    ),
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                inputField1(
                    controller1: passwordController,
                    validators: passwordValidator,
                    hintText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      size: 35,
                    ),
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Registration Successful')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                                'Please resolve the error in the form')));
                      }
                    },
                    child: Text('Create Account'))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
