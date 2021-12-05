import 'dart:developer';

import 'package:clean_our_cities/profil.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/scaffold_main.dart';
import 'package:clean_our_cities/menus/setari_user.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
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
      title: "Menu",
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed:()=> Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    ),
                    child: Text("Settings"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed:()=> Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profil()),
                    ),
                    child: Text("Profile"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
