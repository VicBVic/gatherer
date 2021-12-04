import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  runApp(const SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {

  final email=TextEditingController();
  final pass=TextEditingController();
  final user=TextEditingController();
  final fname=TextEditingController();
  final lname=TextEditingController();
  final phone=TextEditingController();
  final age=TextEditingController();

  String emailError = "";
  String passError = "";
  String userError = "";
  String fnameError = "";
  String lnameError = "";
  String ageError = "";

  bool disable=false;

  FirebaseAuth auth = FirebaseAuth.instance;

  void _createUser() async{
    setState(() {
      disable=true;
    });
    bool valid=true;
      setState(() {

        String tmp="This field is required";

        if(email.text==""){emailError=tmp;valid=false;}
        else {emailError="";}
        if(pass.text==""){passError=tmp;valid=false;}
        else {passError="";}
        if(user.text==""){userError=tmp;valid=false;}
        else {userError="";}
        if(fname.text==""){fnameError=tmp;valid=false;}
        else {fnameError="";}
        if(lname.text==""){lnameError=tmp;valid=false;}
        else {lnameError="";}
        if(age.text == ""){ageError=tmp;valid=false;}
        else {ageError="";}

        Firestore.instance.collection("users").where("user",isEqualTo: "${user.text}")
      });

    if(valid){
      try {
        await auth.createUserWithEmailAndPassword(
          email: email.text,
          password: pass.text
        );
        FirebaseUser use= await auth.currentUser();
        Firestore.instance.collection("users").document("${use.uid}").setData(
          {
            "email" : email.text,
            "user": user.text,
            "firstName" : fname.text,
            "lastName" : lname.text,
            "age" : age.text,
            "phoneNumber" : phone.text,
          }
        );
    } catch(error){
      if(error is PlatformException){
        setState(() {
          switch (error.code){
            case "ERROR_INVALID_EMAIL":
              emailError="The email is invalid";
              break;
            case "ERROR_EMAIL_ALREADY_IN_USE":
              emailError="The email is already in use";
              break;
          }
        });
      }
    }
  }
    setState(() {
      disable=false;
    });
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Clean our city",
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Clean our city"),
          ),
          body: Center(
            child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        enabled: !disable,
                        controller: email,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.email_outlined),
                          border: const UnderlineInputBorder(),
                          labelText: "Email",
                          errorText: (emailError!=""?emailError:null),
                        ),
                      ),
                      TextField(
                        enabled: !disable,
                        obscureText: true,
                        controller: pass,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: const UnderlineInputBorder(),
                          labelText: "Password",
                          errorText: (passError!=""?passError:null),
                        ),
                      ),
                      TextField(
                        enabled: !disable,
                        controller: user,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          border: const UnderlineInputBorder(),
                          labelText: "Username",
                          errorText: (userError!=""?userError:null),
                        ),
                      ),
                      TextField(
                        enabled: !disable,
                        controller: fname,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.contact_page_rounded),
                          border: const UnderlineInputBorder(),
                          labelText: "First name",
                          errorText: (fnameError!=""?fnameError:null),
                        ),
                      ),
                      TextField(
                        enabled: !disable,
                        controller: lname,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.contact_page_rounded),
                          border: const UnderlineInputBorder(),
                          labelText: "Last name",
                          errorText: (lnameError!=""?lnameError:null),
                        ),
                      ),
                      TextField(
                        enabled: !disable,
                        controller: age,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.child_care),
                          border: const UnderlineInputBorder(),
                          labelText: "Age",
                          errorText: (ageError!=""?ageError:null),
                        ),
                      ),
                      TextField(
                        enabled: !disable,
                        controller: phone,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.contact_phone_rounded),
                          border: UnderlineInputBorder(),
                          labelText: "Phone number(optional)",
                        ),
                      ),
                      TextButton(
                        onPressed: disable?null:_createUser,
                        child: Text(disable?"Hold on":"Sign Up"),
                      ),
                    ],
                  ),
                ),
            ),
          ),
        )
    );
  }
}
