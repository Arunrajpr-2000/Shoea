import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuth {
  static Future signUp(
      {required context, required password, required email}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  static Future login(
      {required password, required email, required context}) async {
    UserCredential user;

    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  static Future addUser() async {
    final email = FirebaseAuth.instance.currentUser!.email;
    log(email.toString());

    final docUser = FirebaseFirestore.instance.collection('users').doc(email);
    List<String> Cart = [];
    Map<String, dynamic> map = {
      'email': email,
    };
    await docUser.set(map);
    log('new user created n added to databse');
  }
}
