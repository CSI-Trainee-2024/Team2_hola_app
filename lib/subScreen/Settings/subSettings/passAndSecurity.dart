import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/Settings/subSettings/changePassword.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class Passandsecurity extends StatefulWidget {
  const Passandsecurity({super.key});

  @override
  State<Passandsecurity> createState() => _PassandsecurityState();
}

class _PassandsecurityState extends State<Passandsecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Password and Security',
          style: textTheme.apptextTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login and recovery',
              style: textTheme.apptextTheme.bodyLarge,
            ),
            Text(
              'Manage your password,login preference and recovery methods',
              style: textTheme.apptextTheme.displayMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: colors.greyColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Changepassword(),
                          ));
                    },
                    title: Text(
                      'Change password',
                      style: textTheme.apptextTheme.bodySmall,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: colors.whiteColor,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Saved login',
                      style: textTheme.apptextTheme.bodySmall,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: colors.whiteColor,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Security checks',
              style: textTheme.apptextTheme.bodyLarge,
            ),
            Text(
              'Review security issues by running checks across apps, device and email sent.',
              style: textTheme.apptextTheme.displayMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: colors.greyColor,
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                title: Text(
                  'Where you were logged in',
                  style: textTheme.apptextTheme.bodySmall,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: colors.whiteColor,
                  size: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
