import 'dart:developer';
import 'dart:io';

import 'package:clean_our_cities/scaffold_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class ProfilAlt extends StatefulWidget {
  String? uid;

  ProfilAlt(String _uid){
    uid=_uid;
  }

  @override
  _ProfilAltState createState() => _ProfilAltState(uid!);
}

class _ProfilAltState extends State<ProfilAlt> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String? uid;

  _ProfilAltState(String _uid ){
    uid=_uid;
  }

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

  String desc="";
  String prof="";
  String loc="";
  Widget? wii;

  _getData(){
    Firestore.instance.collection("profiles").document(uid).get().then((value) =>{
      for(var v in value.data.values){
        if(v.key=="image"&&v.value!=""){
          setState((){
            wii=Image(image: NetworkImage(v.value));
          })
        },
        if(v.key=="descriere"){
          desc=v.value,
        },
        if(v.key=="profesie"){
          prof=v.value,
        },
        if(v.key=="locatie"){
          loc=v.value,
        },
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sign Up",
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Sign Up"),
          ),
          body: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    wii!,
                    Text(prof),
                    Text(loc),
                    Text(desc),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
