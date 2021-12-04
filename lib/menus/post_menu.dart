import 'package:clean_our_cities/comentariu.dart';
import 'package:clean_our_cities/like_button.dart';
import 'package:clean_our_cities/post/post_user.dart';
import 'package:clean_our_cities/share_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';


class PostMenu extends StatefulWidget {
  DocumentSnapshot postId;
  var comentarii;
  PostMenu(DocumentSnapshot this.postId,var this.comentarii,{Key? key}) : super(key: key);

  @override
  _PostMenuState createState() => _PostMenuState();
}

class _PostMenuState extends State<PostMenu> {
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
              title: Text("Post Menu"),
              background: Container(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                      if(index == 0)
                        return Container(
                          color: Colors.grey[800],
                          child: Column(
                            children: [
                              PostUser(),
                              Image(image: NetworkImage(
                                widget.postId.data["path"],
                              )),
                              Row(
                                children: [
                                  LikeButton(),
                                  ShareButton(),
                                ],
                              ),
                            ],
                          ),
                        );
                      else if (index == 1)
                        return Text(
                            widget.postId.data["description"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                        );
                      else return widget.comentarii[index-2];
                      //else return Comentariu(comment:'comentarr $index',author: "auth",);
                },
                childCount: widget.comentarii.length+2,
                ),

          ),
        ],
      ),
      bottomSheet: TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.comment),
          hintText: 'Enter comment',
          labelText: 'Enter a comment',
        ),
        onSaved: (String? value) {

        },
      ),
    );
  }
}
