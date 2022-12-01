import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';

class Onboard_widget extends StatelessWidget {
  const Onboard_widget(
      {Key? key,
      this.imagePath,
      this.onclick,
      this.Text1,
      this.Text2,
      this.Text3,
      this.ButtonText})
      : super(key: key);

  final String? imagePath;
  final String? Text1;
  final String? Text2;
  final String? Text3;
  final String? ButtonText;
  final Function()? onclick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldBgcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 400.sp,
            child: Image.asset(
              '$imagePath',
              fit: BoxFit.fill,
            ),
          ),
          k20height,
          Text(
            '$Text1',
            //'We provide high',
            style: TextStyle(
                color: whiteColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold),
          ),
          k10height,
          Text(
            '$Text2',
            //'quality products just',
            style: TextStyle(
                color: whiteColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold),
          ),
          k10height,
          Text(
            '$Text3',
            //'for you',
            style: TextStyle(
                color: whiteColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold),
          ),
          k20height,
          GestureDetector(
            onTap: onclick,
            child: Container(
              width: 300.sp,
              height: 50.sp,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  '$ButtonText',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
