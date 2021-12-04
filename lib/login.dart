import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:clean_our_cities/scaffold_main.dart';
import 'dart:developer';

void main(){
  runApp(LogIn());
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  final email=TextEditingController();
  final pass=TextEditingController();

  String emailError="";
  String passError="";

  bool disable=false;

  void _LogIn() async{

    setState(() {
      disable=true;
    });
    bool valid=true;

    String tmp="This field is required";

    setState(() {
      if(email.text==""){emailError=tmp;valid=false;}
      else {emailError="";}
      if(pass.text==""){passError=tmp;valid=false;}
      else {passError="";}
    });

    if(valid){

      try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: pass.text);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context)=>ScaffoldMain()),
              (route) => false,
          );

      } catch(error){
        log(error.toString());
         if(error is PlatformException){
           setState(() {
             switch(error.code){
               case "ERROR_INVALID_EMAIL":
                 emailError="The email is invalid";
                 break;
               case "ERROR_WRONG_PASSWORD":
                 passError="The password is wrong";
                 break;
               case "ERROR_USER_NOT_FOUND":
                 emailError="The email doesn't exist";
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
        title: "Log In",
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Log In"),
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
                    ElevatedButton(
                      onPressed: disable?null:_LogIn,
                      child: Text(disable?"Hold on":"Log in"),
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
