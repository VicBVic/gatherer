import 'package:clean_our_cities/main.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/postare.dart';

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
    final titluAplicatie = "Creeaza postare";
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name'
            ),
          ),
          new Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            child: new FloatingActionButton(
              child: const Text('Submit'),
              onPressed: null,
            ),
          ),
        ],
      )
    );
  }
}
