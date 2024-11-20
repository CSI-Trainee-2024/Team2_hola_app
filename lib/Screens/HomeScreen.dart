// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/allPost.dart';
import 'package:hola_app/subScreen/HomeSubScreen/following.dart';
import 'package:hola_app/subScreen/HomeSubScreen/notification.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const notificationScreen()));
              },
            ),
            const SizedBox(
              width: 30,
            ),
            const Icon(Icons.message_outlined),
            const SizedBox(
              width: 15,
            )
          ],
          title: Image.asset('assets/images/hola.png'),
          bottom: TabBar(
              indicatorColor: colors.mainColor,
              indicatorWeight: 5,
              labelColor: colors.mainColor,
              unselectedLabelColor: colors.whiteColor,
              tabs: [
                Tab(
                  child: Text(
                    'All',
                    style: textTheme.apptextTheme.headlineMedium,
                  ),
                ),
                Tab(
                  child: Text(
                    'Following',
                    style: textTheme.apptextTheme.headlineMedium,
                  ),
                )
              ]),
        ),
        body: TabBarView(children: [
          alluserPost(),
          followingPost()
        ]),
      ),
    ));
  }
}
