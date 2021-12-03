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
            child: Center(
              child: Text(
                "Look at this",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Image.network(
                "https://www.kindpng.com/picc/m/503-5036977_trollface-png-transparent-images-troll-face-front-view.png",
            ),
          ),
          Row(
            children: [
            ],
          ),
        ],
      ),
    );
  }
}
