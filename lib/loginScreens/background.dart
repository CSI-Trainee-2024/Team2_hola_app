import 'package:flutter/material.dart';

class background extends StatelessWidget {
  final Widget provideChild;
  const background({super.key,required this.provideChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: provideChild,
    );
  }
}
