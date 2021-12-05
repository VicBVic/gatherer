import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';

class MainFeettape extends StatelessWidget {
  List<DocumentSnapshot> posts=[];
  MainFeettape({required this.posts,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index){
          return Postare(postId:posts[index]);
        },
        childCount: posts.length,
      ),
    );
  }
}
