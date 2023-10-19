import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Screens/option.dart';
import 'package:helloworld/check.dart';
import 'package:helloworld/homePage.dart';
import 'package:helloworld/services/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final Future<FirebaseApp> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(child: Text("There is an error")),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const Check();
          }

          return const Scaffold(
            body: Center(child: Text("Loading...")),
          );
        }));
  }
}
