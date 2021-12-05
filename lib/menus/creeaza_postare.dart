import 'package:clean_our_cities/main.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:clean_our_cities/menus/creeaza_postare.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';

import 'dart:developer' as developer;

FirebaseAuth mAuth = FirebaseAuth.instance;

class PostareTemp {
  String title = "";
  String description = "";
  File? image = null;
}

class Tag {
  late final int id;
  late final String name;

  Tag({required this.id, required this.name});
}

PostareTemp post = PostareTemp();
String postLink = "";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreearePostare();
  }
}

class CreearePostare extends StatefulWidget {
  const CreearePostare({Key? key}) : super(key: key);

  @override
  _CreearePostareState createState() => _CreearePostareState();
}

class _CreearePostareState extends State<CreearePostare> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark(),
      title: "Make Post",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Make Post"),
        ),
        body: FormDeCreeare(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class FormDeCreeare extends StatefulWidget {
  const FormDeCreeare({Key? key}) : super(key: key);

  @override
  _FormDeCreeareState createState() => _FormDeCreeareState();
}

class _FormDeCreeareState extends State<FormDeCreeare> {
  final _formKey = GlobalKey<FormState>();
  File? _image = null;
  final imagePicker = ImagePicker();
  static List<Tag> _tags = [
    Tag(id: 1, name: "Charity"),
    Tag(id: 2, name: "Social"),
    Tag(id: 3, name: "Fund-Raiser"),
    Tag(id: 4, name: "Garbage-Collection"),
    Tag(id: 5, name: "Outdoor"),
    Tag(id: 6, name: "Indoor"),
    Tag(id: 7, name: "Fun")
  ];

  final _items =
      _tags.map((tag) => MultiSelectItem<Tag>(tag, tag.name)).toList();
  List<String> _selectedTags = [];
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context, String document) async {
    String fileName = _image!.path;
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => {
            Firestore.instance
                .collection("Posts")
                .document(document)
                .updateData({"path": value}),
            print(value)
          },
        );
  }

  String getUnusedName(String start) {
    Random r = new Random();
    int val = r.nextInt(99999999);
    return start + "$val";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter post title',
                  labelText: 'Title'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a valid title';
                }
                post.title = value;
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            MultiSelectDialogField(
              items: _items,
              searchable: true,
              searchHint: 'Tag',
              searchIcon: Icon(Icons.search),
              title: Text("Tags"),
              selectedColor: Colors.blue,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              buttonIcon: Icon(
                Icons.tag_rounded ,
                color: Colors.blue,
              ),
              buttonText: Text(
                "Pick Your Tags",
                style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 16,
                ),
              ),
              onConfirm: (List <Tag> results) {
                List<String> tagNames=[];
                for(int i=0;i<results.length;i++){
                  tagNames.add(results[i].name);
                }
                _selectedTags = tagNames;
              },
              validator: (results){
                if (results == null || results.isEmpty){
                  return 'Please pick at least one tag';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.place),
                hintText: 'Enter description of event',
                labelText: 'Description',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a valid description';
                }
                post.description = value;
                return null;
              },
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                ),
                child: const Icon(Icons.camera_alt),
                onPressed: getImage,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10.0),
              width: 300,
              height: 200,
              child: _image == null
                  ? Text('No Image Selected')
                  : Image.file(_image!),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10.0),
              child: FloatingActionButton(
                child: const Text('Submit'),
                onPressed: () {

                  if (_formKey.currentState!.validate() && _image != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Post Saved!')));
                    post.image = _image;
                    String token = getUnusedName(post.title);
                    print("here" + token);
                    FirebaseAuth.instance.currentUser().then((value) => Firestore.instance
                        .collection("Posts")
                        .document(token)
                        .setData(
                      {
                        "title": post.title,
                        "description": post.description,
                        "uid":value.uid,
                        "tags":_selectedTags,
                      },
                    ),);
                    uploadImageToFirebase(context, token);
                  }
                },
              ),
            ),
          ],
        ));
  }
}
