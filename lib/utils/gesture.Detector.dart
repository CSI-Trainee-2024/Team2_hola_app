import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';

class gestureDetector extends StatelessWidget {
  final Function() onPressed;
  String? textData;
  TextStyle? textStyle;
  bool isColored;
  gestureDetector(
      {super.key,
      required this.onPressed,
      this.textData,
      this.textStyle,
      required this.isColored});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: colors.mainColor, width: 1),
            color: isColored ? colors.buttonColor : colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          textData.toString(),
          style: textStyle,
        ),
      ),
    );
  }
}
