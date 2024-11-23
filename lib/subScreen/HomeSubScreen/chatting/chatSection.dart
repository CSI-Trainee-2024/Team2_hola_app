import 'package:flutter/material.dart';
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
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: colors.chatAppBar,
        title: Row(
          children: [
            const CircleAvatar(
                backgroundImage: AssetImage('assets/images/userImage.png')),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Richard Wright",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  "Where should we go tomorrow?",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
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
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: message.isSentByUser
                          ? colors.mainColor
                          : colors.chatDark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: message.isSentByUser
                            ? Radius.circular(15)
                            : Radius.zero,
                        bottomRight: message.isSentByUser
                            ? Radius.zero
                            : Radius.circular(15),
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
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByUser;

  Message(this.text, this.isSentByUser);
}
