import 'package:flutter/material.dart';

class PostUser extends StatelessWidget {
  const PostUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        height: 50.0,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical:5.0,horizontal:5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(180.0), //make it nice and round
                child:Image.network(
                  "https://c.tenor.com/gnWdA_N3VOAAAAAC/bop-bop-bop-cat.gif",
                ),
                ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
              child: Text(
                "User",
                style:Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

