import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/screens/onboard/onboard2.dart';
import 'package:shoea_app/presentation/screens/onboard/widget/onboard_widget.dart';
import 'package:shoea_app/presentation/screens/Auth/signIn/login.dart';

class onboard4 extends StatelessWidget {
  const onboard4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Onboard_widget(
      imagePath: 'asset/onboard4.jpg',
      Text1: "Let's fulfill your",
      Text2: 'fashion needs with',
      Text3: 'Shoea right now',
      ButtonText: 'Get Started',
      onclick: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginScreen())),
    );
  }
}
