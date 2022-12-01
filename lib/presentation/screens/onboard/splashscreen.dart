import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/screens/onboard/onboard1.dart';
import 'package:shoea_app/presentation/screens/onboard/onboard2.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Timer(
          Duration(seconds: 2),
          () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => onboard2())),
        );
      },
    );

    return Scaffold(
      backgroundColor: ScaffoldBgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/AppLogo.jpg',
                  width: 60,
                  height: 60,
                ),
                Text(
                  "H O E A",
                  style: const TextStyle(
                      fontFamily: "poppinz",
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            k10height,
            const CircularProgressIndicator(
              color: whiteColor,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
