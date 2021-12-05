import 'package:flutter/material.dart';
import 'package:clean_our_cities/share_button.dart';
import 'package:clean_our_cities/going_button.dart';

class Comentariu extends StatefulWidget {
  String commentContent='';
  String commentAuthor='';
  int likeCount=0;
  int dislikeCount=0;
  bool hasLiked = false;
  bool hasDisliked = false;
  Comentariu({int likes=0, disklikes=0,String author ='', String comment = '',Key? key}) : super(key: key){
    commentContent=comment;
    commentAuthor=author;
    likeCount=likes;
    dislikeCount=disklikes;
  }

  @override
  _ComentariuState createState() => _ComentariuState();
}

class _ComentariuState extends State<Comentariu> {

  void dislike() {
    setState(() {
      if (widget.hasDisliked){
        widget.hasDisliked = false;
        widget.dislikeCount --;
        return;
      }
      widget.hasDisliked = true;
      if (widget.hasLiked) widget.likeCount --;
      widget.hasLiked = false;
      widget.dislikeCount ++;
    });
  }
  void like(){
    setState(() {
      if (widget.hasLiked){
        widget.hasLiked = false;
        widget.likeCount --;
        return;
      }
      widget.hasLiked = true;
      if (widget.hasDisliked) widget.dislikeCount --;
      widget.hasDisliked = false;
      widget.likeCount ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      margin: EdgeInsets.all(8),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image(
                image: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')
            ),
            height: 50,
            width: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.commentAuthor,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                widget.commentContent,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Row(
                children: [
                  IconButton(
                    color: (widget.hasLiked) ? Colors.blueAccent : Colors.white,
                    onPressed: () => {
                      like()
                    },
                    icon: const Icon(Icons.thumb_up),
                  ),
                  Text(widget.likeCount.toString()),
                  IconButton( // Dislike button
                    color: (widget.hasDisliked) ? Colors.redAccent : Colors.white,
                    onPressed: () => {
                      dislike()
                    },
                    icon: const Icon(Icons.thumb_down),
                  ),
                  Text(widget.dislikeCount.toString()),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}