import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/chatting/allchats.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class ChatScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(
        "Hey, did you watch that new sci-fi movie that came out last weekend?",
        false),
    Message(
        "Yeah, I did! I went with a few friends. It was pretty good.", true),
    Message("I get what you mean.", false),
    Message(
        "The special effects were amazing though. I couldn’t stop staring at the scenes with the spaceships.",
        true),
    Message("Totally! The space battles were definitely the highlight.", true),
    Message("Yeah, it’s hard to be original these days with sci-fi.", false),
    Message("True! The setting was cool.", true),
    Message(
        "I love how they mixed in those little touches from different cultures.",
        false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: AppBar(
          toolbarHeight: 100,
          backgroundColor: colors.chatAppBar,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          leading: IconButton(
              color: colors.blackColor,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              )),
          title: ListTile(
            leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/userImage.png')),
            title: Text(
              'Richard Wright',
              style: textTheme.apptextTheme.displayLarge,
            ),
            subtitle: Text(
              'How was the day?',
              style: textTheme.apptextTheme.titleSmall,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/chatback.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.isSentByUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75),
                      decoration: BoxDecoration(
                        color: message.isSentByUser
                            ? colors.mainColor
                            : colors.chatDark,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(15),
                          topRight: const Radius.circular(15),
                          bottomLeft: message.isSentByUser
                              ? const Radius.circular(15)
                              : Radius.zero,
                          bottomRight: message.isSentByUser
                              ? Radius.zero
                              : const Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        message.text,
                        style: message.isSentByUser
                            ? textTheme.apptextTheme.titleSmall
                            : textTheme.apptextTheme.labelLarge,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade800,
                        hintText: "Type a message",
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByUser;

  Message(this.text, this.isSentByUser);
}
