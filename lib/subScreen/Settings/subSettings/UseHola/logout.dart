import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/components/sharedPref.dart';
import 'package:hola_app/loginScreens/login.dart';
import 'package:hola_app/subScreen/Settings/mainSettings.dart';
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
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => mainSettings(),
                              ));
                        },
                        textData: "Cancel",
                        textStyle: textTheme.apptextTheme.headlineMedium,
                        isColored: false,
                      ),
                      gestureDetector(
                          onPressed: () {
                            removeToken();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => loginScreen(),
                              ),
                              (route) => false,
                            );
                          },
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
