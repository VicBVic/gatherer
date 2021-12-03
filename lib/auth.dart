import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main(){
  runApp(const SignUp());
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void create(){
    FirebaseAuth auth = FirebaseAuth.instance;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [

        ],
      ),
    );
  }
}
