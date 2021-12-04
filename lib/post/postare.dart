import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:clean_our_cities/post/post_image.dart';
import 'package:clean_our_cities/post/post_buttons.dart';
import 'package:clean_our_cities/post/post_title.dart';
import 'package:clean_our_cities/post/post_user.dart';

class Postare extends StatefulWidget {
  DocumentSnapshot postId;
  Postare({required this.postId,Key? key}) : super(key: key);
  @override
  _PostareState createState() => _PostareState();
}

class _PostareState extends State<Postare> {
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.5,
      color: Theme.of(context).colorScheme.background,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              fit:FlexFit.tight,
              flex: 1,
              child: PostUser(),
          ),
          PostTitle(widget.postId.data["title"]),
          Flexible(
              fit:FlexFit.tight,
              flex: 6,
              child: PostImage(link:widget.postId.data["path"]),
          ),
          PostButtons(),
        ],
      ),
    );
  }
}
