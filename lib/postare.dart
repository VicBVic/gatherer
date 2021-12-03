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

      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            //color: Theme.of(context).colorScheme.primaryVariant,
            child: Center(
              child: Text(
                widget.postTitle,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Container(
            //color: Theme.of(context).colorScheme.primaryVariant,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Image.network(
                "https://www.kindpng.com/picc/m/503-5036977_trollface-png-transparent-images-troll-face-front-view.png",
            ),
          ),
          Row(

            children: [
              LikeButton(),
              CommentsButton(),
              ShareButton(),
            ],
          ),
        ],
      ),
    );
  }
}
