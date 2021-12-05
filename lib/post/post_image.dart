import 'package:clean_our_cities/menus/post_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  DocumentSnapshot document;
  List comments=[];
  PostImage({required this.document, required this.comments,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  PostMenu(
                document,comments,
              ))
          );
        },
        child: Image(
          image: NetworkImage(document.data["path"]),
        ),
      ),
    );
  }
}
