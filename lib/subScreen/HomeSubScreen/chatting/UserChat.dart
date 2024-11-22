import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class userChats extends StatefulWidget {
  const userChats({super.key});

  @override
  State<userChats> createState() => _userChatsState();
}

class _userChatsState extends State<userChats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Allen003',
                style: textTheme.apptextTheme.headlineSmall,
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.person_add))
              ],
              bottom: const TabBar(
                isScrollable: true,
                indicatorColor: colors.mainColor,
                indicatorWeight: 4,
                /*indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors.mainColor),*/
                unselectedLabelColor: colors.whiteColor,
                labelColor: colors.mainColor,
                tabs: [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Unread",
                  ),
                  Tab(
                    text: "Unreplied",
                  ),
                  Tab(
                    text: "Group",
                  ),
                  Tab(
                    text: "Close friends",
                  )
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Center(
                  child: Text('All users'),
                ),
                Center(
                  child: Text('Unread Chats'),
                ),
                Center(
                  child: Text('Unreplied Chats'),
                ),
                Center(
                  child: Text('Group Chats'),
                ),
                Center(
                  child: Text('Close friends'),
                )
              ],
            )),
      ),
    );
  }
}
