
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostUser extends StatefulWidget {
  String uid;
  PostUser(String this.uid,{Key? key}) : super(key: key);

  @override
  _PostUserState createState() => _PostUserState(uid);
}

class _PostUserState extends State<PostUser> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String uid;
  _PostUserState(String this.uid);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  bool flag = false;

  String path="";
  String user="";

  _getPath()async{
    if(flag)return;
    flag=true;
    await Firestore.instance.collection("profiles").document(uid).get().then((value) => {
      setState((){
        path=value.data["image"];
      })
    });
    await Firestore.instance.collection("users").document(uid).get().then((value) => {
      setState((){
        user=value.data["user"];
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    _getPath();
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        height: 50.0,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical:5.0,horizontal:5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(180.0), //make it nice and round
                child:Image(image: NetworkImage(path)),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
              child: Text(
                user.toString(),
                style:Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


