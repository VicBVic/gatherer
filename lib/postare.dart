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

      color: Colors.white,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Look at this"
          ),
          Image.network(
              "https://clipart-best.com/img/trollface/trollface-clip-art-7.png",

          ),
        ],
      ),
    );
  }
}
