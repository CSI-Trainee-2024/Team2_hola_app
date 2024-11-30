import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class googleLogin extends StatelessWidget {
  const googleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: WidgetStateColor.transparent,
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(width: 2, color: colors.whiteColor)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.07,
                height: MediaQuery.sizeOf(context).height * 0.07,
                child: Image.asset('assets/images/google.png')),
            // const FaIcon(
            //   FontAwesomeIcons.google,
            //   color: Color.fromARGB(255, 249, 144, 109),
            // ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Continue with Google',
              style: textTheme.apptextTheme.bodyLarge,
            )
          ],
        ));
  }
}
