import 'dart:developer';

import 'package:clean_our_cities/menus/main_feed/main_feed.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/scaffold_main.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:clean_our_cities/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:clean_our_cities/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.from(
        colorScheme:getMainColorScheme(),
        textTheme: ThemeData.dark().textTheme,
      ),
      darkTheme: ThemeData(),
      home:  ScaffoldMain(),
    );
  }
}
