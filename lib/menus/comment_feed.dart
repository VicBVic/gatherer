import 'package:clean_our_cities/comentariu.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';

class CommentFeed extends StatefulWidget {
  const CommentFeed({Key? key}) : super(key: key);

  @override
  _CommentFeedState createState() => _CommentFeedState();
}

class _CommentFeedState extends State<CommentFeed> {
  @override
  Widget build(BuildContext context) {
    return Material(
       child: CustomScrollView(

        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Comment Feed"),
              background: Container(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                      return Comentariu(comment:"Comment $index", author: "Author $index",);
                }),
          ),
        ],
      ),
    );
  }
}
