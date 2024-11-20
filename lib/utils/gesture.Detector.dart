import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class gestureDetector extends StatelessWidget {
  final Function() onPressed;
  String? textData;
  gestureDetector({super.key, required this.onPressed, this.textData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: colors.mainColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          textData.toString(),
          style: textTheme.apptextTheme.labelLarge,
        ),
      ),
    );
  }
}
