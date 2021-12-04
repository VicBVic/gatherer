import 'package:clean_our_cities/navigation_bar_main.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:clean_our_cities/menus/creeaza_postare.dart';
import 'package:clean_our_cities/menus/main_feed.dart';

class ScaffoldMain extends StatefulWidget {
  const ScaffoldMain({Key? key}) : super(key: key);

  @override
  _ScaffoldMainState createState() => _ScaffoldMainState();
}

class _ScaffoldMainState extends State<ScaffoldMain> {

  var menus=[MainFeed(),MainFeed(),CreearePostare()];

  int currentIndex=0;
  int getIndex(){
    return currentIndex;
  }
  void changeIndex(int newInd){
    setState(() {
      currentIndex=newInd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: menus[currentIndex],
      ),
      bottomNavigationBar: NavigationBarMain(
        getIndex: getIndex,
        changeIndex: changeIndex,
      ),
    );
  }
}
