import 'package:clean_our_cities/main.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:clean_our_cities/menus/creeaza_postare.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as developer;

class PostareTemp{
  String title = "";
  String description = "";
  File? image = null;
}

PostareTemp post = PostareTemp();

void main(){
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
    final titluAplicatie = "Create Post";
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark(),
      title: titluAplicatie,
      home: Scaffold(
        appBar: AppBar(
          title: Text(titluAplicatie),
        ),
        body: FormDeCreeare(),
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

  Future getImage() async{
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter post title',
              labelText: 'Title'
            ),
            validator: (value){
              if (value!.isEmpty){
                return 'Please enter a valid title';
              }
              post.title = value;
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.place),
              hintText: 'Enter description of event',
              labelText: 'Description',
            ),
            validator: (value){
              if (value!.isEmpty){
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
            child:
              _image == null ? Text('No Image Selected') : Image.file(_image!),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 10.0),
            child: FloatingActionButton(
              child: const Text('Submit'),
              onPressed: (){
                if (_formKey.currentState!.validate() && _image != null){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Data is processing.')));
                  post.image = _image;
                  developer.log(post.title);
                  developer.log(post.description);
                }
              },
            ),
          ),
        ],
      )
    );
  }
}

