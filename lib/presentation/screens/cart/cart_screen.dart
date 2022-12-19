import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/function/cart_fun.dart';
import 'package:shoea_app/model/cart_model.dart';
import 'package:shoea_app/model/product_model.dart';
import 'package:shoea_app/presentation/screens/cart/cart_listview.dart';
import 'package:shoea_app/presentation/screens/payment/payment_screen.dart';
import 'package:shoea_app/presentation/widgets/Payment_stack_widget.dart';
import 'package:shoea_app/presentation/widgets/headerTile.dart';
import 'package:shoea_app/presentation/widgets/quantity_widget.dart';

class ScreenCart extends StatelessWidget {
  ScreenCart({
    Key? key,
  }) : super(key: key);

  // final List<String>? Cartimage = [
  //   'https://rukminim1.flixcart.com/image/832/832/l58iaa80/shoe/9/y/q/-original-imagfyaseenuzn6d.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/4/j/1/6-nikefecion-6-nnikhe-blue-original-imaggxz9wf5s7q3d.jpeg?q=70',
  // ];

  // final List<String>? CartProductName = [
  //   'Nike Air Max',
  //   "Nike Jordan",
  //   'Nike shoe',
  // ];
  // final List<int>? CartProductPrice = [
  //   2000,
  //   2300,
  //   700,
  // ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              HeaderTile(
                  Title: Text(
                    'Cart',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TrailingButton: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: whiteColor,
                      ),
                    ),
                  ]),
              CartListView(),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: StreamBuilder<List<CartModel>>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(email)
                    .collection('cart')
                    .snapshots()
                    .map((e) => e.docs
                        .map((docs) => CartModel.fromJson(docs.data()))
                        .toList()),
                builder: (context, snapshot) {
                  // List<CartModel> documentsnapshot = snapshot.data!;
                  if (snapshot.hasData) {
                    final cartlist = snapshot.data!;
                    double total = 0;
                    for (var e in cartlist) {
                      total = total + e.cartprice;

                      log(total.toString());
                    }
                    final list = snapshot.data;
                    return TotalPriceBottomWidget(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => PaymentScreen(
                        //           price: total.toString(),
                        //         )));
                      },
                      Title: 'Total Cost',
                      selectPayments: 'Checkout',
                      totalPrice: total.toString(),
                    );
                  } else {
                    return const Align(
                      alignment: FractionalOffset.center,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                }))
      ],
    );
  }
}
