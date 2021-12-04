import 'package:flutter/material.dart';
import 'package:clean_our_cities/scaffold_main.dart';
import 'package:clean_our_cities/themes/themes.dart';
import 'package:clean_our_cities/postare.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List <Postare> listaCuPostari = [Postare(),Postare(), Postare()];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _adaugaPostare()
  {
    listaCuPostari.add(Postare());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                centerTitle: true,
                backgroundColor: Colors.amber,
                title: Text('Postari'),
                expandedHeight: 30,
                collapsedHeight: 150,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return listaCuPostari[index];
                  },
                  childCount: listaCuPostari.length, // 1000 list items
                ),
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(_adaugaPostare),
      ),

    );
  }
}
