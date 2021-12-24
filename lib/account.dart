import 'dart:developer';

import 'package:clean_our_cities/profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/scaffold_main.dart';
import 'package:clean_our_cities/menus/setari_user.dart';
import 'package:image_picker/image_picker.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Widget wii = Text("No image selected");

  _getimage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    String p= '';
    Firestore.instance.collection("profiles").document("${(await FirebaseAuth.instance.currentUser()).uid}").updateData({
      "image": p,
    });
    setState(() {
      wii=Image(image: NetworkImage(p));
    });
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Your Account",
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Your Account"),
        ),
        body:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                        image: NetworkImage('https://previews.123rf.com/images/thodoristibilis/thodoristibilis1505/thodoristibilis150500007/39757443-happy-cartoon-smiling-garbage-bin-character-reuse-recycling-and-keep-clean-concept-isolated-in-white.jpg'),
                        width: 60,
                    ),
                    Text(
                        'OctaVianu',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed:()=> Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profil()),
                          ),
                          child: Text("Profile"),
                        ),
                        ElevatedButton(
                          onPressed:()=> Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Settings()),
                          ),
                          child: Text("Settings"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'You don\'t take part in any events yet!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
