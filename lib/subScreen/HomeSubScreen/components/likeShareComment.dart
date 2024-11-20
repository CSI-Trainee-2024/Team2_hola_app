// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hola_app/subScreen/HomeSubScreen/comment/comment.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class likecommentShare extends StatefulWidget {
  const likecommentShare({super.key});

  @override
  State<likecommentShare> createState() => _likecommentShareState();
}

class _likecommentShareState extends State<likecommentShare> {
  int like = 120;
  int comment = 50;
  int share = 10;
  bool isLike = false;

  void toggleLike() {
    setState(() {
      if (isLike) {
        like--;
        isLike = false;
      } else {
        like++;
        isLike = true;
      }
    });
  }

  void incrementComment() {
    setState(() {
      comment++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: toggleLike,
                icon: Icon(
                  Icons.favorite,
                  color: isLike ? colors.redColor : colors.whiteColor,
                  size: 22,
                )),
            Text(
              '$like',
              style: textTheme.apptextTheme.labelLarge,
            )
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  incrementComment();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => commentScreen()));
                },
                icon: const Icon(
                  Icons.comment_outlined,
                  color: colors.whiteColor,
                  size: 22,
                )),
            Text(
              '$comment',
              style: textTheme.apptextTheme.labelLarge,
            )
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Row(
          children: [
            Image.asset('assets/images/Share.png')
            /*IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.share,
                  size: 25,
                ))*/
            ,
            const SizedBox(
              width: 10,
            ),
            Text(
              '$share',
              style: textTheme.apptextTheme.labelLarge,
            )
          ],
        )
      ],
    );
  }
}
