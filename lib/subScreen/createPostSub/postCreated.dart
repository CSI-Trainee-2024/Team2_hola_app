import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

final List<Map<String, dynamic>> posts = [];

class postCreated extends StatefulWidget {
  const postCreated({super.key});

  @override
  State<postCreated> createState() => _postCreatedState();
}

class _postCreatedState extends State<postCreated> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Posts',
            style: textTheme.apptextTheme.headlineMedium,
          ),
          centerTitle: true,
        ),
        body: Expanded(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: colors.greyColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (posts[index]['image'] != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            posts[index]['image'],
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(height: 8),
                      if (posts[index]['caption'] != null &&
                          posts[index]['caption'].isNotEmpty)
                        Text(posts[index]['caption'],
                            style: textTheme.apptextTheme.headlineMedium),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            posts[index]['text'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: colors.whiteColor,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: colors.redColor),
                            onPressed: () {
                              setState(() {
                                posts.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
