import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';

final List<Map<String, dynamic>> posts = [];

class postCreated extends StatefulWidget {
  const postCreated({super.key});

  @override
  State<postCreated> createState() => _postCreatedState();
}

class _postCreatedState extends State<postCreated> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: colors.greyColor,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (posts[index]['image'] != null)
                    Image.file(
                      posts[index]['image'],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 8),
                  if (posts[index]['caption'] != null &&
                      posts[index]['caption'].isNotEmpty)
                    Text(
                      posts[index]['caption'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    posts[index]['text'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    posts.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
