import 'dart:developer';
import 'dart:io';

import 'package:clean_our_cities/scaffold_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();

}

class _ProfilState extends State<Profil> with SingleTickerProviderStateMixin {
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

  final prof= TextEditingController();
  final loc=TextEditingController() ;
  final desc =TextEditingController();

  Widget wii = Text("No image selected");

  Future<String> uploadImage(File img) async {
    StorageReference ref = FirebaseStorage().ref().child(
        img.hashCode.toString());
    StorageUploadTask uploadTask = ref.putFile(img);

    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();

    return dowurl.toString();
  }

  _getimage() async {
    _getData();
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    Firestore.instance.collection("profiles").document("${(await FirebaseAuth.instance.currentUser()).uid}").updateData({
      "image": await uploadImage(File(image!.path)),
    });
}

  _getData()async{
    await Firestore.instance.collection("profiles").document("${(await FirebaseAuth.instance.currentUser()).uid}").get().then((value) =>{
      for(var v in value.data.entries){
        if(v.key=="image"&&v.value!=""){
          setState((){
            wii=Image(image: NetworkImage(v.value));
          })
        },
        if(v.key=="descriere"){
          desc.text=v.value,
        },
        if(v.key=="profesie"){
          prof.text=v.value,
        },
        if(v.key=="locatie"){
          loc.text=v.value,
        },
      }
    });
  }

  _save()async{
    await Firestore.instance.collection("profiles").document("${(await FirebaseAuth.instance.currentUser()).uid}").updateData({
      "descriere": desc.text,
      "locatie": loc.text,
      "profesie": prof.text,
    });
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=>ScaffoldMain()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    _getData();
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
                      TextButton(
                          onPressed: _getimage,
                          child: wii,
                      ),
                      TextField(
                        controller: prof,
                        decoration: InputDecoration(
                          labelText: "Profession",
                        ),
                      ),
                      TextField(
                        controller: loc,
                        decoration: InputDecoration(
                          labelText: "Location",
                        ),
                      ),
                      TextField(
                        controller: desc,
                        decoration: InputDecoration(
                          labelText: "Description",
                        ),
                      ),
                      ElevatedButton(
                          onPressed: _save,
                          child: Text("Save"),
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
