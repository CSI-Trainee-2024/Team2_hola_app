import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Messaagebutton extends StatelessWidget {
  final Function() onButtonPressed;
  final String textData;
  final EdgeInsetsDirectional? buttonPadding;
  const Messaagebutton(
      {super.key, required this.onButtonPressed, required this.textData,this.buttonPadding});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onButtonPressed,
      child: Container(
        padding: buttonPadding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: colors.mainColor),
        child: Text(
          textData.toString(),
          style: textTheme.apptextTheme.titleSmall,
        ),
      ),
    );
  }
}
