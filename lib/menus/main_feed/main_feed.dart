import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:clean_our_cities/menus/main_feed/main_feettape.dart';
import 'package:clean_our_cities/menus/main_feed/new_arrivals.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({Key? key}) : super(key: key);

  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  List<DocumentSnapshot> posts=[];
  @override
  Widget build(BuildContext context) {


    if(posts.isEmpty){Firestore.instance.collection("Posts").getDocuments().then((value) => setState((){posts=value.documents;})); return Center(child:Text("hold on..."));}
    return CustomScrollView(

      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Main Feed"),
            background: Container(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
        HorizontalList(posts: posts,headline: "Latest posts",),
        HorizontalList(posts: posts,headline: "Events near you",),
        MainFeettape(posts: posts),
      ],
    );
  }
}
