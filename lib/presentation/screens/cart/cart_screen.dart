import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/model/product_model.dart';
import 'package:shoea_app/presentation/screens/cart/cart_listview.dart';
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
        const Align(
            alignment: Alignment.bottomCenter,
            child: TotalPriceBottomWidget(
              Title: 'Total Cost',
              selectPayments: 'Checkout',
              totalPrice: '5000',
            ))
      ],
    );
  }
}
