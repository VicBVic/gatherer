import 'package:flutter/material.dart';
import 'package:clean_our_cities/comments_button.dart';
import 'package:clean_our_cities/share_button.dart';
import 'package:clean_our_cities/like_button.dart';


class PostButtons extends StatelessWidget {
  const PostButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          LikeButton(),
          CommentsButton(),
          ShareButton(),
        ],
      ),
    );
  }
}
