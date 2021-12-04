import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  String link="";
  PostImage({required this.link,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Image.network(link),
    );
  }
}
