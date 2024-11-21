import 'package:flutter/material.dart';

class inputField1 extends StatelessWidget {
  final TextEditingController controller1;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? Function(String?)? validators;
  final TextInputType? keyInputType;
  const inputField1(
      {super.key,
      required this.controller1,
      this.hintText,
      this.labelText,
      required this.obscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.validators,
      this.keyInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      obscureText: obscureText,
      validator: validators,
      keyboardType: keyInputType,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText),
    );
  }
}
