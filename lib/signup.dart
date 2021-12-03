import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Clean our city!",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Clean our city!"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Email",
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      )
    )
  );
}