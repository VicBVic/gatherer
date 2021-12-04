import 'package:clean_our_cities/main.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/postare.dart';
import 'package:clean_our_cities/menus/creeaza_postare.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter post name',
              labelText: 'Name'
            ),
            validator: (value){
              if (value!.isEmpty){
                return 'Please enter a valid name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.place),
              hintText: 'Enter description of event',
              labelText: 'Description',
            ),
            validator: (value){
              if (value!.isEmpty){
                return 'Please enter a valid description';
              }
              return null;
            },
          ),
          new Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            child: new FloatingActionButton(
              child: const Text('Submit'),
              onPressed: (){
                if (_formKey.currentState!.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Data is processing.')));
                }
              },
            ),
          ),
        ],
      )
    );
  }
}
