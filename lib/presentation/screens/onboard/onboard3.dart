import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/screens/onboard/onboard2.dart';
import 'package:shoea_app/presentation/screens/onboard/onboard4.dart';

import 'widget/onboard_widget.dart';

class onboard3 extends StatelessWidget {
  const onboard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Onboard_widget(
      imagePath: 'asset/onboard3.jpg',
      Text1: 'Your satisfaction is',
      Text2: 'our number one',
      Text3: 'priority',
      ButtonText: 'Next',
      onclick: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => onboard4())),
    );
  }
}
