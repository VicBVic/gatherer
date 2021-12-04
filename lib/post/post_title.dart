import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  String postTitle="default title";
  PostTitle(this.postTitle,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Text(
          postTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
