import 'package:flutter/material.dart';

class Utils {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(
      {String? text, Color color = Colors.white, required context}) {
    if (text == null) return;
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}