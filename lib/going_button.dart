import 'package:flutter/material.dart';
import 'dart:math';

class GoingButton extends StatefulWidget {
  const GoingButton({Key? key}) : super(key: key);

  @override
  _GoingButtonState createState() => _GoingButtonState();
}

class _GoingButtonState extends State<GoingButton> {
  IconData currentIcon=Icons.notifications_rounded;
  int going = 10;
  bool userGoing=false;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit:FlexFit.tight,
      child: ElevatedButton(
        onPressed: (){
          if(userGoing==false)
            {
              setState(() {
                currentIcon=Icons.notifications_on_rounded;
                userGoing=true;
              });
            } else {
            setState(() {
              currentIcon=Icons.notifications_rounded;
              userGoing=false;
            });
          }
        },
        child: Row(
          children: [
            Icon(
              currentIcon,
            ),
            Text("Going: ${going + (userGoing?1:0)}",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        style:Theme.of(context).elevatedButtonTheme.style,
      ),
    );
  }
}
