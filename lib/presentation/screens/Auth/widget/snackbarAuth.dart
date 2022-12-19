import 'package:flutter/material.dart';

class Utils {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(
      {String? text, Color color = Colors.white, required context}) {
    if (text == null) return;
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
