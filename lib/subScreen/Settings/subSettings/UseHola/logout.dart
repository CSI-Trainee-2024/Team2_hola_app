import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/utils/gesture.Detector.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Logout",
            style: textTheme.apptextTheme.headlineSmall,
          ),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: colors.greyColor,
              border: Border.all(color: colors.mainColor, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Are you sure you want to logout from this device ?",
                    style: textTheme.apptextTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      gestureDetector(
                        onPressed: () {},
                        textData: "Cancel",
                        textStyle: textTheme.apptextTheme.headlineMedium,
                        isColored: false,
                      ),
                      gestureDetector(
                          onPressed: () {},
                          textData: "Yes",
                          isColored: true,
                          textStyle: textTheme.apptextTheme.headlineMedium)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
