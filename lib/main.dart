import 'package:flutter/material.dart';
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
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List <Postare> listaCuPostari=[Postare(),Postare()];

  void _adaugaPostare()
  {
    listaCuPostari.add(Postare());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                  listaCuPostari
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Octavian e jmek'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adaugaPostare,
      ),
    );
  }
}

