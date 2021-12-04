import 'package:clean_our_cities/main.dart';
import 'package:flutter/material.dart';
import 'package:clean_our_cities/post/postare.dart';
import 'package:clean_our_cities/menus/creeaza_postare.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as developer;

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool enableName = false;
  bool enablePassword = false;
  bool enableEmail = false;
  bool enableAge = false;
  bool enablePhone = false;
  bool enableFirstName = false;
  bool enableLastName = false;

  void enableButtonName(){
    setState((){
      enableName = !enableName;
    });
  }

  void enableButtonPassword(){
    setState((){
      enablePassword = !enablePassword;
    });
  }

  void enableButtonEmail(){
    setState((){
      enableEmail = !enableEmail;
    });
  }

  void enableButtonAge(){
    setState((){
      enableAge = !enableAge;
    });
  }

  void enableButtonPhone(){
    setState((){
      enablePhone = !enablePhone;
    });
  }

  void enableButtonFirstName(){
    setState((){
      enableFirstName = !enableFirstName;
    });
  }

  void enableButtonLastName(){
    setState((){
      enableLastName = !enableLastName;
    });
  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Settings'),
          ),
          body: Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  TextFormField(
                    initialValue: "Placeholder name",
                    enabled: enableName,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change name'),
                      onPressed: () => {
                        enableButtonName()
                      },
                    ),
                  ),
                  TextFormField(
                    initialValue: "Placeholder password",
                    obscureText: true,
                    enabled: enablePassword,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change password'),
                      onPressed: () => {
                        enableButtonPassword()
                      },
                    ),
                  ),
                  TextFormField(
                    initialValue: "Placeholder Email",
                    enabled: enableEmail,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.mail),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change email'),
                      onPressed: () => {
                        enableButtonEmail()
                      },
                    ),
                  ),
                  TextFormField(
                    initialValue: "Placeholder Age",
                    enabled: enableAge,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.child_care),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change age'),
                      onPressed: () => {
                        enableButtonAge()
                      },
                    ),
                  ),
                  TextFormField(
                    initialValue: "Placeholder Phone Number",
                    enabled: enablePhone,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.contact_phone_rounded),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change phone number'),
                      onPressed: () => {
                        enableButtonPhone()
                      },
                    ),
                  ),
                  TextFormField(
                    initialValue: "Placeholder First Name",
                    enabled: enableFirstName,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.contact_page_rounded ),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change first name'),
                      onPressed: () => {
                        enableButtonFirstName()
                      },
                    ),
                  ),
                  TextFormField(
                    initialValue: "Placeholder Last Name",
                    enabled: enableLastName,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.contact_page_rounded ),
                    ),
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.circle_rounded),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                      ),
                      label: Text('Press to change last name'),
                      onPressed: () => {
                        enableButtonLastName()
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
