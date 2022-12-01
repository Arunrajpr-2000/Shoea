import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/screens/payment/payment_screen.dart';

import '../../core/color/colors.dart';

class TotalPriceBottomWidget extends StatelessWidget {
  const TotalPriceBottomWidget(
      {Key? key, this.Title, this.totalPrice, this.selectPayments})
      : super(key: key);

  final String? Title;
  final String? totalPrice;
  final String? selectPayments;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 360.w,
      decoration: const BoxDecoration(
          // Color(0xff35383F)
          color: Color(0xff35383F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: Column(
        children: [
          k20height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '$Title',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '₹ $totalPrice',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          k20height,
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PaymentScreen())),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  '$selectPayments',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
