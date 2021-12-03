import 'package:flutter/material.dart';

class CommentsButton extends StatefulWidget {
  const CommentsButton({Key? key}) : super(key: key);

  @override
  _CommentsButtonState createState() => _CommentsButtonState();
}

class _CommentsButtonState extends State<CommentsButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      child: const Icon(
        Icons.comment,
      ),
    );
  }
}
