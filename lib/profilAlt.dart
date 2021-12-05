import 'dart:developer';
import 'dart:io';

import 'package:clean_our_cities/scaffold_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class ProfilAlt extends StatefulWidget {
  String uid;

  ProfilAlt(String this.uid);

  @override
  _ProfilAltState createState() => _ProfilAltState(uid);
}

class _ProfilAltState extends State<ProfilAlt> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String uid;

  _ProfilAltState(String this.uid );

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
  Widget wii=Text("");

  bool flag=false;

  _getData(){
    if(flag)return;
    flag=true;
    Firestore.instance.collection("profiles").document(uid).get().then((value) =>{
      for(var v in value.data.values){
        if(v.key=="image"&&v.value!=""){
          setState((){
            wii=Image(image: NetworkImage(v.value));
          })
        },
        if(v.key=="descriere"){
          setState((){
            desc=v.value;
          })
        },
        if(v.key=="profesie"){
          setState((){
            prof=v.value;
          })
        },
        if(v.key=="locatie"){
          setState((){
            loc=v.value;
          })
        },
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return MaterialApp(
        title: "Profile",
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
          ),
          body: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    wii,
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
