// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class accountCenter extends StatefulWidget {
  const accountCenter({super.key});

  @override
  State<accountCenter> createState() => _accountCenterState();
}

class _accountCenterState extends State<accountCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Center',
          style: textTheme.apptextTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/userImage.png'),
                radius: 30,
              ),
              title: Text(
                'Profiles',
                style: textTheme.apptextTheme.labelMedium,
              ),
              subtitle: Text(
                'Allen003',
                style: textTheme.apptextTheme.displayMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: colors.whiteColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: colors.mainColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account setting',
                    style: textTheme.apptextTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.lock_outline,
                      color: colors.whiteColor,
                    ),
                    title: Text(
                      'Password and Security',
                      style: textTheme.apptextTheme.bodySmall,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: colors.whiteColor,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: colors.whiteColor,
                    ),
                    title: Text(
                      'Personal details',
                      style: textTheme.apptextTheme.bodySmall,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: colors.whiteColor,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: colors.mainColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: colors.whiteColor,
                    ),
                    title: Text(
                      'Accounts',
                      style: textTheme.apptextTheme.bodySmall,
                    ),
                    subtitle: Text(
                      'Preview the account that you have in the account section',
                      style: textTheme.apptextTheme.displayMedium,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: colors.whiteColor,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Add more accounts',
              style: textTheme.apptextTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
