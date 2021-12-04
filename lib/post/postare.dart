import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/post_image.dart';
import 'package:clean_our_cities/post/post_buttons.dart';
import 'package:clean_our_cities/post/post_title.dart';
import 'package:clean_our_cities/post/post_user.dart';

class Postare extends StatefulWidget {
  String postTitle="";
  Postare({String title = "",Key? key}) : super(key: key){
    postTitle=title;
  }

  @override
  _PostareState createState() => _PostareState();
}

class _PostareState extends State<Postare> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PostUser(),
          PostTitle(widget.postTitle),
          PostImage(),
          PostButtons(),
        ],
      ),
    );
  }
}
