import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HorizontalList extends StatelessWidget {
  List<DocumentSnapshot> posts=[];
  String headline="";
  HorizontalList({required this.headline,required this.posts,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              headline,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SizedBox(
            height: 250.0,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                  return Container(
                    width: 250.0,
                    height: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Stack(

                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            posts[index].data["path"]==null? "https://esquilo.io/png/thumb/KoRirtV657T6PHB-Trollface-PNG-Image.png":posts[index].data["path"],
                            //width:250.0,
                            height: 250.0,
                          fit: BoxFit.cover,
                          ),
                        ),

                      Container(
                         padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                               colors: <Color>[
                                Colors.black.withAlpha(0),
                                Colors.black12,
                                Colors.black45
                                  ],
                            ),
                          ),

                        child: Text(
                          posts[index].data["title"],
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      ],
                    ),
                  );
              },
              itemCount: posts.length,
              ),
          ),
        ],
      ),
    );
  }
}
