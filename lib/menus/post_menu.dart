import 'package:clean_our_cities/comentariu.dart';
import 'package:clean_our_cities/like_button.dart';
import 'package:clean_our_cities/share_button.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:clean_our_cities/post/post_buttons.dart';

var comentarii = [Comentariu(author: 'aibr', comment: 'acn',),
  Comentariu(author: 'aibr', comment: 'acn',)];

class PostMenu extends StatefulWidget {
  const PostMenu({Key? key}) : super(key: key);


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
                              Text(
                                'titul',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                              Image(image: NetworkImage(
                                'https://lp-cms-production.imgix.net/image_browser/GettyImages-1096103184.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850',
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
                            'this is the post\n description.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                        );
                      else return comentarii[index-2];
                      //else return Comentariu(comment:'comentarr $index',author: "auth",);
                },
                childCount: comentarii.length+2,
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
