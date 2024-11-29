import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/api/exploreApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class TrendingNotLoad extends StatefulWidget {
  const TrendingNotLoad({super.key});

  @override
  State<TrendingNotLoad> createState() => _TrendingNotLoadState();
}

class _TrendingNotLoadState extends State<TrendingNotLoad>
    with AutomaticKeepAliveClientMixin<TrendingNotLoad> {
  List<String> items = [];
  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListner);
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    List<String> newItems =
        List.generate(20, (index) => 'Item ${items.length + index + 1}');
    setState(() {
      items.addAll(newItems);
      isLoading = false;
    });
  }

  void scrollListner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        loadData();
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListner);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
          future: getExploreApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: colors.mainColor,
                  ),
                  SizedBox(
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
                controller: scrollController,
                  itemCount: exploreList.length + (isLoading ? 1:0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    if (index == exploreList.length && isLoading) {
                      return const Center(child: CircularProgressIndicator(color: colors.mainColor));
                    }
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

