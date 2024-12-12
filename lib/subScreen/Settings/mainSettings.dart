import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/Settings/subSettings/accountCenter.dart';
import 'package:hola_app/subScreen/Settings/subSettings/time%20management/appTime.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class mainSettings extends StatefulWidget {
  const mainSettings({super.key});

  @override
  State<mainSettings> createState() => _mainSettingsState();
}

class _mainSettingsState extends State<mainSettings> {
  final List<Map> arrdata = [
    {'data': 'Saved', 'icon': Icons.save_alt_rounded},
    {'data': 'Archieve', 'icon': Icons.archive_outlined},
    {'data': 'Time Management', 'icon': Icons.timer_outlined},
    {'data': 'Close friends', 'icon': Icons.stars},
    {'data': 'Blocked', 'icon': Icons.block},
    {'data': 'Account privacy', 'icon': Icons.lock_outline},
    {'data': 'Language', 'icon': Icons.language_sharp},
    {'data': 'Help', 'icon': Icons.help_outline},
    {'data': 'Logout', 'icon': Icons.logout_rounded}
  ];
  final List arrScreens = [
    
  ]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings and activity',
          style: textTheme.apptextTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              hintText: 'Search',
              hintStyle:
                  WidgetStatePropertyAll(textTheme.apptextTheme.headlineSmall),
              leading: const Icon(
                Icons.search,
                color: colors.mainColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Account',
                  style: textTheme.apptextTheme.bodyLarge,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const accountCenter(),
                        ));
                  },
                  leading: const Icon(
                    Icons.person,
                    color: colors.mainColor,
                    size: 30,
                  ),
                  title: Text(
                    'Account Center',
                    style: textTheme.apptextTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    'Password security, Personal Details, Add preferneces',
                    style: textTheme.apptextTheme.displayMedium,
                  ),
                ),
                const Divider(
                  thickness: 2,
                )
              ],
            ),
            Text(
              'How you use hola',
              style: textTheme.apptextTheme.bodyLarge,
            ),
            Expanded(
              child: ListView.builder(
                  //itemExtent: 100,
                  itemCount: arrdata.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Apptime(),
                            ));
                      },
                      leading: Icon(
                        arrdata[index]['icon'],
                        color: colors.whiteColor,
                      ),
                      title: Text(
                        arrdata[index]['data'],
                        style: textTheme.apptextTheme.bodyLarge,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: colors.whiteColor,
                        size: 20,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
