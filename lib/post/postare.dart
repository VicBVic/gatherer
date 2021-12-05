import 'package:clean_our_cities/menus/post_menu.dart';
import 'package:clean_our_cities/post/post_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:clean_our_cities/post/post_title.dart';
import 'package:clean_our_cities/post/post_user.dart';

import '../comentariu.dart';
import '../like_button.dart';
import '../share_button.dart';

class Postare extends StatefulWidget {
  DocumentSnapshot postId;

  var comentarii = [Comentariu()];
  
  Postare({required this.postId,Key? key}) : super(key: key);
  @override
  _PostareState createState() => _PostareState();
}

class _PostareState extends State<Postare> {
  Widget build(BuildContext context) {
    for(int i=0; i<widget.postId.data["comments"].length; i++)
      {
        widget.comentarii.add(Comentariu(
          author: widget.postId.data["comments"][0],
          comment: widget.postId.data["comments"][0],
        ));
      }
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
              child:PostImage(document:widget.postId,comments:widget.comentarii),
              ),
          Container(
            color:Theme.of(context).colorScheme.background,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                GoingButton(),
                ShareButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
