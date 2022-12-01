import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/widgets/quantity_widget.dart';

import '../../widgets/Payment_stack_widget.dart';
import 'widget/Product_Name_Price_Cart.dart';
import 'widget/Product_discription_widget.dart';
import 'widget/pageView_container.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);

  final List<String>? ShoeSizes = ['38', '40', '42'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        actions: const [
          Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
          k20width,
        ],
      ),
      body: Stack(
        children: [
          ProductFulldetails(),
          const Align(
            alignment: Alignment.bottomCenter,
            child: TotalPriceBottomWidget(
              Title: 'Total cost',
              totalPrice: '5939',
              selectPayments: 'Payment',
            ),
          )
        ],
      ),
    );
  }

  SingleChildScrollView ProductFulldetails() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageViewWidget(),
          k20height,
          ProductNamePriceCart(),
          k20height,
          ProductDiscription(),
          k20height,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'SIZE',
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizeAndQuantity(),
        ],
      ),
    );
  }

  Padding SizeAndQuantity() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 230,
            height: 50,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ShoeSizes!.length,
                separatorBuilder: (context, index) => k10width,
                itemBuilder: (context, index) {
                  return CircleAvatar(
                      backgroundColor: Color(0xff393A3F),
                      radius: 25.r,
                      child: Text(
                        ShoeSizes![index].toString(),
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ));
                }),
          ),
          QuantityWidget(
            OnPressAdd: () {},
            OnPressSub: () {},
            Quantity: '1',
          )
        ],
      ),
    );
  }
}
