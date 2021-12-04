import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({Key? key}) : super(key: key);

  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Main Feed"),
            background: Container(
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                return Postare(title:"Post $index");
              }),
        ),
      ],
    );
  }
}
