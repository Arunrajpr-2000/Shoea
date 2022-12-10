import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';

class PageViewWidget extends StatelessWidget {
  PageViewWidget({
    Key? key,
    required this.productimage,
  }) : super(key: key);

  List<dynamic>? productimage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.sp,
      decoration: BoxDecoration(
        color: whiteColor,
        //borderRadius: BorderRadius.circular(20)
      ),
      child: PageView.builder(
        itemCount: productimage!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return productimage![index] == null
              ? Text("Unable to Load")
              : Image.network(productimage![index]);
        },
      ),
    );
  }
}


  // Image.network(
  //           'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  //           fit: BoxFit.contain,
  //         ),
