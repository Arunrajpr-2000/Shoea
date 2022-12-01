import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/widgets/headerTile.dart';

import '../../../core/color/colors.dart';
import 'widget/order_listTile.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  final List<String>? Imageurl = [
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/k1i6ikw0/shoe/r/m/g/bq3204-002-7-nike-black-white-anthracite-original-imafh2hvnqttmhf9.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/9/l/i/-original-imagjuhyc8djsphg.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  ];

  final List<String>? OrderTitle = [
    'Nike Jordan',
    'Nike Air Max',
    'Puma',
    'Reebook',
  ];

  final List<String>? DeliveryStatus = [
    'In Delivery',
    'Delivered',
    'Order Rejected',
    'iIn delivery',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderTile(
            Title: Text(
              'My Orders',
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            TrailingButton: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: whiteColor,
                ),
              ),
            ]),
        k20height,
        Expanded(
          child: SizedBox(
            width: 300.w,
            child: OrderListTile(
                OrderTitle: OrderTitle,
                Imageurl: Imageurl,
                DeliveryStatus: DeliveryStatus),
          ),
        ),
      ],
    );
  }
}
