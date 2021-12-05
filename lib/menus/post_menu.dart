import 'package:clean_our_cities/comentariu.dart';
import 'package:clean_our_cities/like_button.dart';
import 'package:clean_our_cities/post/post_user.dart';
import 'package:clean_our_cities/share_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'dart:developer' as developer;

class PostMenu extends StatefulWidget {
  DocumentSnapshot postId;
  var comentarii;
  PostMenu(DocumentSnapshot this.postId, var this.comentarii, {Key? key})
      : super(key: key);

  List<String> comments = [];
  int comment_number = 0;

  void posteazaComentariu(String comentariu) {
    developer.log(comentariu);
  }

  @override
  _PostMenuState createState() => _PostMenuState();
}

class _PostMenuState extends State<PostMenu> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
              (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    color: Colors.grey[800],
                    child: Column(
                      children: [
                        PostUser(),
                        Image(
                            image: NetworkImage(
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
                } else if (index == 1) {
                  return Text(
                    widget.postId.data["description"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  );
                }
                if (index == widget.comentarii.length + 2)
                  return Container(
                    height: 50,
                  );
                else
                  return widget.comentarii[index - 2];
                //else return Comentariu(comment:'comentarr $index',author: "auth",);
              },
              childCount: widget.comentarii.length + 3,
            ),
          ),
        ],
      ),
      bottomSheet: Form(
        child: TextFormField(
          key: _formKey,
          decoration: const InputDecoration(
            icon: Icon(Icons.comment),
            hintText: 'Enter comment',
            labelText: 'Enter a comment',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            widget.comments.add(value);
            return null;
          },
          onEditingComplete: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Are you sure you want to post this comment?',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    widget.posteazaComentariu(widget
                                        .comments[widget.comments.length - 1]);
                                  },
                                  child: Text('Post'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
