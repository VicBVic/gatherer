import 'package:clean_our_cities/navigation_bar_main.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/postare.dart';

class ScaffoldMain extends StatefulWidget {
  const ScaffoldMain({Key? key}) : super(key: key);

  @override
  _ScaffoldMainState createState() => _ScaffoldMainState();
}

class _ScaffoldMainState extends State<ScaffoldMain> {

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
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
           floating: true,
            pinned: false,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("BRUH"),
             background: Container(
               height: 250.0,
               color: Theme.of(context).colorScheme.secondaryVariant,
             ),
           ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                  return Postare(title:"Trol $index");
                }),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarMain(
        getIndex: getIndex,
        changeIndex: changeIndex,
      ),
    );
  }
}
