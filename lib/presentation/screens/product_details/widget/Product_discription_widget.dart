import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';

class ProductDiscription extends StatelessWidget {
  const ProductDiscription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
        style: TextStyle(
            color: whiteColor.withOpacity(0.9),
            fontSize: 15.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
