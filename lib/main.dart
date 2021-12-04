import 'package:flutter/material.dart';
import 'package:clean_our_cities/scaffold_main.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:clean_our_cities/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: ScaffoldMain(),
    );
  }
}
