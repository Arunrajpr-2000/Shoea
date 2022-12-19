import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';

class Textcontainer extends StatelessWidget {
  Textcontainer({Key? key, required this.text, required this.icon})
      : super(key: key);

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.sp,
      height: 55.sp,
      decoration: BoxDecoration(
          color: const Color(0xff1F222B),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          icon,
          color: whiteColor,
        ),
        title: Text(
          text,
          //profilelist[0].username.toString(),
          // user.displayName.toString(),
          style: TextStyle(color: whiteColor),
        ),
      ),
    );
  }
}
