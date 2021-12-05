import 'package:clean_our_cities/comentariu.dart';
import 'package:clean_our_cities/going_button.dart';
import 'package:clean_our_cities/post/post_buttons.dart';
import 'package:clean_our_cities/post/post_user.dart';
import 'package:clean_our_cities/share_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:clean_our_cities/comentariu.dart';
import 'dart:developer' as developer;

class PostMenu extends StatefulWidget {
  DocumentSnapshot postId;
  var comentarii = [];
  var comentariu;
  PostMenu(DocumentSnapshot this.postId, var this.comentarii, {Key? key})
      : super(key: key);
  @override
  _PostMenuState createState() => _PostMenuState();
}

class _PostMenuState extends State<PostMenu> {
  void posteazaComentariu(String comentariu) {
    print (widget.postId.documentID);
    Firestore.instance.collection("Posts").document(widget.postId.documentID).updateData(
        {
          "comments": FieldValue.arrayUnion([comentariu]),
        }
    );
  }
  final _formKey = GlobalKey<FormState>();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.comentarii);
    if (widget.comentarii == null){
      widget.comentarii = [];
    }
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
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[800],
              child: Column(
                children: [
                  PostUser(widget.postId.data["uid"]),
                  Image(
                      image: NetworkImage(
                        widget.postId.data["path"],
                      )),
                  PostButtons(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Text(
                widget.postId.data["description"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                  return widget.comentarii[index];
              },
              childCount: widget.comentarii.length,
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
              ),
          ),
        ],
      ),
      bottomSheet: Form(
        key: _formKey,
        child: TextFormField(
          focusNode: myFocusNode,
          decoration: const InputDecoration(
            icon: Icon(Icons.comment),
            hintText: 'Enter comment',
            labelText: 'Enter a comment',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            developer.log("${myFocusNode.hasFocus}");
            widget.comentariu = value;
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
                                    myFocusNode.requestFocus();
                                    myFocusNode.unfocus();
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()){
                                        setState((){posteazaComentariu(widget.comentariu);});
                                      }
                                    Navigator.of(context).pop();

                                    developer.log("${myFocusNode.hasFocus}");
                                    myFocusNode.requestFocus();
                                    myFocusNode.unfocus();
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
