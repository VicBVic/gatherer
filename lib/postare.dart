import 'package:flutter/material.dart';

class Postare extends StatefulWidget {
  const Postare({Key? key}) : super(key: key);

  @override
  _PostareState createState() => _PostareState();
}

class _PostareState extends State<Postare> {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Theme.of(context).colorScheme.background,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: const Center(
              child: Text(
                "Look at this",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Image.network(
                "https://clipart-best.com/img/trollface/trollface-clip-art-7.png",

            ),
          ),
        ],
      ),
    );
  }
}
