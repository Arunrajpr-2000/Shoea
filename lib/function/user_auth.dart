import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoea_app/presentation/screens/Auth/widget/snackbarAuth.dart';

class UserAuth {
  static Future signUp(
      {required context, required password, required email}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      Utils.showSnackBar(context: context, text: e.message);
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
      log(e.toString());
      Utils.showSnackBar(context: context, text: e.message);
    }
  }

  static Future addUser() async {
    final email = FirebaseAuth.instance.currentUser!.email;

    final passwords = FirebaseAuth.instance.currentUser!;

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
