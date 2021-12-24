import 'package:clean_our_cities/menus/post_menu.dart';
import 'package:clean_our_cities/post/post_buttons.dart';
import 'package:clean_our_cities/post/post_image.dart';
import 'package:clean_our_cities/profilAlt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:clean_our_cities/post/post_title.dart';
import 'package:clean_our_cities/post/post_user.dart';

import '../comentariu.dart';
import '../going_button.dart';
import '../share_button.dart';

class Postare extends StatefulWidget {
  DocumentSnapshot postId;

  var comentarii = [];
  
  Postare({required this.postId,Key? key}) : super(key: key);
  @override
  _PostareState createState() => _PostareState(postId.data["user"]);
}

class _PostareState extends State<Postare> {
  String uid;
  _PostareState(String this.uid);

  _toProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilAlt(uid)));
  }
  
  Widget build(BuildContext context) {
    if(widget.postId.data["comments"]!=null)
      {
        for(int i=0; i<widget.postId.data["comments"].length; i++)
        {
          widget.comentarii.add(Comentariu(
            author: widget.postId.data["comments"][i],
            comment: widget.postId.data["comments"][i],
          ));
        }
      }
    //print(widget.comentarii);
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
              child: GestureDetector(
                onTap: _toProfile,
                child: PostUser(widget.postId.data["uid"]),
              )
          ),
          PostTitle(widget.postId.data["title"]),
          Flexible(
              fit:FlexFit.tight,
              flex: 6,
              child:PostImage(document:widget.postId,comments:widget.comentarii),
              ),
          PostButtons(),
        ],
      ),
    );
  }
}
