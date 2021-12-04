import 'package:clean_our_cities/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/signup.dart';
import 'package:clean_our_cities/login.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
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
                  ElevatedButton(
                      onPressed:()=> Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                      ),
                      child: Text("Sign Up"),
                  ),
                  ElevatedButton(
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> LogIn()),
                      ),
                      child: Text("Log In"),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

