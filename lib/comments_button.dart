import 'package:clean_our_cities/menus/post_menu.dart';
import 'package:flutter/material.dart';

class CommentsButton extends StatefulWidget {
  const CommentsButton({Key? key}) : super(key: key);

  @override
  _CommentsButtonState createState() => _CommentsButtonState();
}

class _CommentsButtonState extends State<CommentsButton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit:FlexFit.tight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostMenu())
          );
        },
        child: const Icon(
          Icons.comment,
        ),
        style:Theme.of(context).elevatedButtonTheme.style,
      ),
    );
  }
}
