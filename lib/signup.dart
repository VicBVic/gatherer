import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final email=TextEditingController();
final pass=TextEditingController();

void _createUser(){
  FirebaseAuth auth= FirebaseAuth.instance;
  auth.createUserWithEmailAndPassword(email: email.text, password: pass.text);
}

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {

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
        title: "Clean our city",
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Clean our city"),
          ),
          body: Center(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          border: UnderlineInputBorder(),
                          labelText: "Email",
                        ),
                      ),
                      TextFormField(
                        controller: pass,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          border: UnderlineInputBorder(),
                          labelText: "Password",
                        ),
                      ),
                      const TextButton(
                        onPressed: _createUser,
                        child: Text("Inregistreaza-te"),
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
