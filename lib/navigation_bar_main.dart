import 'package:flutter/material.dart';

class NavigationBarMain extends StatefulWidget {
  NavigationBarMain({Key? key}) : super(key: key);

  @override
  _NavigationBarMainState createState() => _NavigationBarMainState();
}

class _NavigationBarMainState extends State<NavigationBarMain> {

  int currentIndex=0;
  void changeIndex(int newIndex){
    setState((){
      currentIndex=newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.list),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            label:"Feed",

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
          label:"User",
        ),
      ],
      currentIndex: currentIndex,
      onTap: changeIndex,
    );

  }
}
