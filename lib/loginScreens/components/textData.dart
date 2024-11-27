import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

// For register screen

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
      text: 'Already have an account?    ',
      style: textTheme.apptextTheme.bodyLarge,
      children: [
        TextSpan(text: 'Sign Up', style: textTheme.apptextTheme.bodyMedium)
      ]);
}

// For login screen

Text loginHeading() {
  return Text(
    'Enter valid user name & password to continue',
    style: textTheme.apptextTheme.bodySmall,
    textAlign: TextAlign.center,
  );
}

TextSpan notHaveAccount() {
  return TextSpan(
      text: "Don't have an account?  ",
      style: textTheme.apptextTheme.bodyLarge,
      children: [
        TextSpan(text: 'Sign In', style: textTheme.apptextTheme.bodyMedium)
      ]);
}

// For forgot password

Text forgotHeading() {
  return Text(
    "Don't worry it happens. Please enter the Email address associated with your account",
    style: textTheme.apptextTheme.bodySmall,
    textAlign: TextAlign.center,
  );
}

Text otpHeading() {
  return Text(
    "Please Enter the OTP send to your Email address",
    style: textTheme.apptextTheme.bodySmall,
    textAlign: TextAlign.center,
  );
}
