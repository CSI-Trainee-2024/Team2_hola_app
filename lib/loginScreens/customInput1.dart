import 'package:flutter/material.dart';

class inputField1 extends StatelessWidget {
  final TextEditingController controller1;
  final String hintText;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  const inputField1(
      {super.key,
      required this.controller1,
      required this.hintText,
      required this.obscureText,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the Username';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
