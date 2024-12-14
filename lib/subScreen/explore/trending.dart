import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/api/exploreApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/themes/models/allpost.dart';

class trendingPage extends StatefulWidget {
  const trendingPage({super.key});

  @override
  State<trendingPage> createState() => _trendingPageState();
}

class _trendingPageState extends State<trendingPage>
    with AutomaticKeepAliveClientMixin<trendingPage> {
  late Future<List<allpost>> exploreListFuture;
  @override
  void initState() {
    super.initState();
    exploreListFuture = getExploreApi();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
          future: exploreListFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: colors.mainColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Loading...',
                    style: textTheme.apptextTheme.bodyLarge,
                  )
                ],
              );
            } else {
              return GridView.builder(
                  itemCount: exploreList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          fit: BoxFit.cover,
                          exploreList[index].downloadUrl.toString()),
                    );
                  });
            }
          },
        ))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
