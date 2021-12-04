import 'package:clean_our_cities/menus/post_menu.dart';
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  String link="";
  PostImage({required this.link,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  PostMenu(
                link
              ))
          );
        },
        child: Image(
          image: NetworkImage(link),
        ),
      ),
    );
  }
}
