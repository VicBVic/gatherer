import 'package:flutter/material.dart';

class NavigationBarMain extends StatefulWidget {

  Function getIndexMain=(){};
  Function(int) changeIndexMain=(int){};

  NavigationBarMain({Key? key, required Function(int) changeIndex,required Function getIndex}) : super(key: key){
    changeIndexMain=changeIndex;
    getIndexMain=getIndex;
  }

  @override
  _NavigationBarMainState createState() => _NavigationBarMainState();
}

class _NavigationBarMainState extends State<NavigationBarMain> {

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
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          label:"Make Post",
        ),
      ],
      currentIndex: widget.getIndexMain(),
      onTap: widget.changeIndexMain,
    );

  }
}
