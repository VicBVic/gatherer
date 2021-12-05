import 'dart:core';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Settings> {

  bool enableName = false;
  bool enablePassword = false;
  bool enableEmail = false;
  bool enableAge = false;
  bool enablePhone = false;
  bool enableFirstName = false;
  bool enableLastName = false;

  final TextEditingController email= TextEditingController();
  final TextEditingController user=TextEditingController();
  final TextEditingController fname=TextEditingController();
  final TextEditingController lname=TextEditingController();
  final TextEditingController age=TextEditingController();
  final TextEditingController phone=TextEditingController();

  void enableButtonName()  {
    setState((){
      enableName = !enableName;
    });
  }

  void enableButtonAge(){
    setState((){
      enableAge = !enableAge;
    });
  }

  void enableButtonPhone(){
    setState((){
      enablePhone = !enablePhone;
    });
  }

  void enableButtonFirstName(){
    setState((){
      enableFirstName = !enableFirstName;
    });
  }

  void enableButtonLastName(){
    setState((){
      enableLastName = !enableLastName;
    });
  }

  TextEditingController _controller = TextEditingController();

  _getText()async{

    Firestore.instance.collection("users").document("${(await FirebaseAuth.instance.currentUser()).uid}").get().then((value) => {
      for(var v in value.data.entries){

        if(v.key=="user"){
          user.text=v.value,
        },

        if(v.key=="email"){
          email.text=v.value,
        },

        if(v.key=="firstName"){
          fname.text=v.value,
        },

        if(v.key=="lastName"){
          lname.text=v.value,
        },

        if(v.key=="age"){
          age.text=v.value,
        },

        if(v.key=="phoneNumber"){
          phone.text=v.value,
        },

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getText();
    return MaterialApp(
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Settings'),
          ),
          body: Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  TextFormField(
                    controller: user,
                    enabled: enableName,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'The username cannot be empty';
                      }
                      return null;
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change name'),
                      onPressed: () => {
                        enableButtonName()
                      },
                    ),
                  ),
                  TextFormField(
                    controller: age,
                    enabled: enableAge,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.child_care),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'The age cannot be empty';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change age'),
                      onPressed: () => {
                        enableButtonAge()
                      },
                    ),
                  ),
                  TextFormField(
                    controller: phone,
                    enabled: enablePhone,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.contact_phone_rounded),
                    ),
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change phone number'),
                      onPressed: () => {
                        enableButtonPhone()
                      },
                    ),
                  ),
                  TextFormField(
                    controller: fname,
                    enabled: enableFirstName,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.contact_page_rounded ),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change first name'),
                      onPressed: () => {
                        enableButtonFirstName()
                      },
                    ),
                  ),
                  TextFormField(
                    controller: lname,
                    enabled: enableLastName,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.contact_page_rounded ),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change last name'),
                      onPressed: () => {
                        enableButtonLastName()
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
