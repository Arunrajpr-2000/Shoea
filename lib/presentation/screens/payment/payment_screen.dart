import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';

import '../../widgets/Payment_stack_widget.dart';
import 'widget/paymet_method_tile_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldBgcolor,
      appBar: AppBar(
        backgroundColor: ScaffoldBgcolor,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
            )),
        title: const Text(
          'Payment Method',
          style: TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                k10height,
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff35383F)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        k20height,
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Delivery Address',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        k10height,
                        ListTile(
                          leading: const Icon(
                            Icons.location_pin,
                            color: whiteColor,
                          ),
                          title: const Text(
                            'Brototype ,InfoPark, Kochi 678508',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: whiteColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                k20height,
                Text(
                  'Select the payment method you want to use.',
                  style: TextStyle(
                      color: whiteColor.withOpacity(0.9),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                k20height,
                // Container(
                //   height: 70,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Color(0xff35383F)),
                // )
                PaymentMethodsTile(
                  ImageUrl:
                      'https://yt3.ggpht.com/ytc/AMLnZu8hEuwIDjx39XqXih5os_s6PVzgsptnGb8Q1tkKvw=s900-c-k-c0x00ffffff-no-rj',
                  Title: 'RazorPay',
                  Radiobutton: Radio(
                      activeColor: whiteColor,
                      // fillColor:,
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {
                        //selected value
                      }),
                ),
                k20height,
                PaymentMethodsTile(
                  ImageUrl:
                      'https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1',
                  Title: 'GooglePay',
                  Radiobutton: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return whiteColor;
                      }),
                      activeColor: whiteColor,
                      value: 1,
                      groupValue: 0,
                      onChanged: (value) {
                        //selected value
                      }),
                ),
                k20height,
                PaymentMethodsTile(
                  ImageUrl:
                      'https://img.freepik.com/premium-vector/cash-delivery_569841-162.jpg?w=2000',
                  Title: 'Cash on Delivery',
                  Radiobutton: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return whiteColor;
                      }),
                      activeColor: whiteColor,
                      // fillColor:,
                      value: 1,
                      groupValue: 2,
                      onChanged: (value) {
                        //selected value
                      }),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: TotalPriceBottomWidget(
              Title: 'Total cost',
              totalPrice: '5939',
              selectPayments: 'Confirm Payment',
            ),
          )
        ],
      ),
    );
  }
}
