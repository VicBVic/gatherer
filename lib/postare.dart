import 'package:flutter/material.dart';
import 'package:clean_our_cities/comments_button.dart';
import 'package:clean_our_cities/share_button.dart';
import 'package:clean_our_cities/like_button.dart';

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
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: Center(
              child: Text(
                widget.postTitle,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Image.network(
                "https://www.kindpng.com/picc/m/503-5036977_trollface-png-transparent-images-troll-face-front-view.png",
            ),
          ),
          Container(
            color:Theme.of(context).colorScheme.secondary,
            child: Row(

              children: [
                LikeButton(),
                CommentsButton(),
                ShareButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
