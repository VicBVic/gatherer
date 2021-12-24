import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoingTo extends StatefulWidget {
  const GoingTo({Key? key}) : super(key: key);

  @override
  _GoingToState createState() => _GoingToState();
}

class _GoingToState extends State<GoingTo> {
  List<String> p=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Going to"),
      ),
      body: ListView(
          children: [
            Container(
                child:Text("Local concert", style:Theme.of(context).textTheme.headline4),
                color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.symmetric(vertical: 15.0),
            ),
            Container(
              child:Text("Charity event", style:Theme.of(context).textTheme.headline4),
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.symmetric(vertical: 15.0),
            ),
            Container(
              child:Text("Forest cleaning event", style:Theme.of(context).textTheme.headline4),
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.symmetric(vertical: 5.0),
            ),
            Container(
              child:Text("Online hackathon Unihack", style:Theme.of(context).textTheme.headline4),
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.symmetric(vertical: 15.0),
            ),
          ],
      ),

    );
  }
}
