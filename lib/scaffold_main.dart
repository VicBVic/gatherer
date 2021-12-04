import 'package:flutter/material.dart';
import 'package:clean_our_cities/postare.dart';

class ScaffoldMain extends StatefulWidget {
  const ScaffoldMain({Key? key}) : super(key: key);

  @override
  _ScaffoldMainState createState() => _ScaffoldMainState();
}

class _ScaffoldMainState extends State<ScaffoldMain> {
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.checklist),label: "Feed"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
          
        ],
      ),
    );
  }
}
