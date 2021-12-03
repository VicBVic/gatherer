import 'package:flutter/material.dart';
import 'package:clean_our_cities/postare.dart';
import 'package:clean_our_cities/themes/themes.dart';

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
        textTheme: ThemeData.dark().textTheme
      ),
      darkTheme: ThemeData.dark(),
      home: Postare(title:"We do alittle bit of a little bit of a little bit"),
    );
  }
}
