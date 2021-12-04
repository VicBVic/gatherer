import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Image.network(
        "https://lp-cms-production.imgix.net/image_browser/GettyImages-1096103184.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850",
      ),
    );
  }
}
