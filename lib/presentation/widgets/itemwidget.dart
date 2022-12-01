import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/presentation/screens/product_details/product_View.dart';

import '../../core/color/colors.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({Key? key}) : super(key: key);

  final List<String>? Imageurl = [
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/k1i6ikw0/shoe/r/m/g/bq3204-002-7-nike-black-white-anthracite-original-imafh2hvnqttmhf9.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/9/l/i/-original-imagjuhyc8djsphg.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/k1i6ikw0/shoe/r/m/g/bq3204-002-7-nike-black-white-anthracite-original-imafh2hvnqttmhf9.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/9/l/i/-original-imagjuhyc8djsphg.jpeg?q=70',
    'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: Imageurl!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.80,
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 1.0,
      ),
      itemBuilder: (context, index) {
        //   for (int i = 0; i < 10; i++)
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProductView()));
          },
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ),
                    // Icon(
                    //   Icons.add_shopping_cart,
                    //   color: Colors.black,
                    // ),
                  ],
                ),
                Container(
                  //margin: EdgeInsets.all(10),
                  child: Image.network(
                    Imageurl![index].toString(),
                    width: 120.w,
                    height: 120.h,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nike Air Max",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "₹5,939",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      // childAspectRatio: 0.80,
      physics: NeverScrollableScrollPhysics(),
      // crossAxisCount: 2,
      shrinkWrap: true,
      // children: [],
    );
  }
}
