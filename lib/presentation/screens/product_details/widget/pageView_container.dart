import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.sp,
      decoration: BoxDecoration(
        color: whiteColor,
        //borderRadius: BorderRadius.circular(20)
      ),
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.network(
            'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
            fit: BoxFit.contain,
          ),
          Image.network(
            'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/d/u/v/-original-imaggcyc5tzhrsej.jpeg?q=70',
            fit: BoxFit.contain,
          ),
          Image.network(
            'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/i/h/z/-original-imaggcycbbxxhkup.jpeg?q=70',
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
