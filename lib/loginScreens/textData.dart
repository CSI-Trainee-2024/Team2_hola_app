import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

Text signUpHeading() {
  return Text(
    'Use proper information to continue',
    style: textTheme.apptextTheme.bodySmall,
  );
}

String errorResolve() {
  return 'Please resolve the error in the form';
}

String orData() {
  return '____________ Or ____________';
}

TextSpan privacySpan() {
  return TextSpan(
      text: 'By signing up, agree to our',
      style: textTheme.apptextTheme.bodyLarge,
      children: <TextSpan>[
        TextSpan(
            text: ' Terms & Conditions',
            style: textTheme.apptextTheme.bodyMedium),
        TextSpan(text: ' and ', style: textTheme.apptextTheme.bodyLarge),
        TextSpan(
            text: 'Privacy Policy', style: textTheme.apptextTheme.bodyMedium)
      ]);
}

TextSpan haveAccount() {
  return TextSpan(
      text: 'Already have an account?',
      style: textTheme.apptextTheme.bodyLarge,
      children: [
        TextSpan(text: '    Sign Up', style: textTheme.apptextTheme.bodyMedium)
      ]);
}
