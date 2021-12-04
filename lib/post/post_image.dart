import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Image.network(
        "https://www.kindpng.com/picc/m/503-5036977_trollface-png-transparent-images-troll-face-front-view.png",
      ),
    );
  }
}
