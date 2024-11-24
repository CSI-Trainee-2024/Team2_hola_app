import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/components/customInput1.dart';
import 'package:hola_app/subScreen/explore/community.dart';
import 'package:hola_app/subScreen/explore/trending.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class exploreScreen extends StatefulWidget {
  const exploreScreen({super.key});

  @override
  State<exploreScreen> createState() => _exploreScreenState();
}

class _exploreScreenState extends State<exploreScreen> {
  final SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            children: [
              SearchBar(
                controller: searchController,
                hintText: 'Search',
                leading: const Icon(
                  Icons.search,
                  color: colors.whiteColor,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                  indicatorColor: colors.chatDark,
                  indicatorWeight: 5,
                  labelStyle: textTheme.apptextTheme.bodyLarge,
                  dividerHeight: 5,
                  dividerColor: colors.whiteColor,
                  labelColor: colors.mainColor,
                  unselectedLabelColor: colors.whiteColor,
                  tabs: const [
                    Tab(
                      text: 'Trending',
                    ),
                    Tab(
                      text: 'Community',
                    ),
                  ]),
              const SizedBox(
                height: 20,
              ),
               const Expanded(
                child: TabBarView(
                  children: [
                    trendingPage(), 
                    communityPage()]))
            ],
          ),
        ),
      ),
    ));
  }
}
