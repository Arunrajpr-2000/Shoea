import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/color/colors.dart';

class ProductNamePriceCart extends StatelessWidget {
  const ProductNamePriceCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Nike Air Jordan\n ₹5,939',
            style: TextStyle(
                color: whiteColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                size: 25,
                color: whiteColor,
              )),
        ),
      ],
    );
  }
}
