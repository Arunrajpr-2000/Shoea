import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/widgets/quantity_widget.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    Key? key,
    required this.Cartimage,
    required this.CartProductName,
    required this.CartProductPrice,
  }) : super(key: key);

  final List<String>? Cartimage;
  final List<String>? CartProductName;
  final List<int>? CartProductPrice;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => k30height,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            k10width,
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Image.network(
                Cartimage![index],
                // width: 50.w,
                // height: 50.h,
                fit: BoxFit.contain,
              ),
            ),
            k10width,
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CartProductName![index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      // "₹5,939",
                      '₹ ${CartProductPrice![index]}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: whiteColor,
                    )),
                QuantityWidget(
                  OnPressAdd: () {},
                  Quantity: '100',
                  OnPressSub: () {},
                )
              ],
            )
          ],
        );
      },
      itemCount: Cartimage!.length,
    );
  }
}
