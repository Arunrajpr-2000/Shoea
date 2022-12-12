import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/screens/MainPage/mainpage.dart';

import '../../widgets/Payment_stack_widget.dart';
import 'widget/paymet_method_tile_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.price}) : super(key: key);

  final String price;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Razorpay razorpay = Razorpay();
  int _value = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log(response.toString());
    // verifyS
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.toString())));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log(response.toString());
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.toString())));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log(response.toString());
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.toString())));
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var options = {
      'key': 'rzp_test_mkzSidhb6RgmDG',
      'amount': 500,
      'name': 'Arun Corp.',
      'description': 'Demo',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

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
                  onTap: () {
                    //razorpay.open(options);
                  },
                  ImageUrl:
                      'https://yt3.ggpht.com/ytc/AMLnZu8hEuwIDjx39XqXih5os_s6PVzgsptnGb8Q1tkKvw=s900-c-k-c0x00ffffff-no-rj',
                  Title: 'RazorPay',
                  Radiobutton: Radio<int>(
                      activeColor: whiteColor,
                      // fillColor:,
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                ),
                // k20height,
                // PaymentMethodsTile(
                //   ImageUrl:
                //       'https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1',
                //   Title: 'GooglePay',
                //   Radiobutton: Radio(
                //       fillColor: MaterialStateProperty.resolveWith<Color>(
                //           (Set<MaterialState> states) {
                //         return whiteColor;
                //       }),
                //       activeColor: whiteColor,
                //       value: 1,
                //       groupValue: 0,
                //       onChanged: (value) {
                //         //selected value
                //       }),
                // ),
                k20height,
                PaymentMethodsTile(
                  onTap: () {},
                  ImageUrl:
                      'https://img.freepik.com/premium-vector/cash-delivery_569841-162.jpg?w=2000',
                  Title: 'Cash on Delivery',
                  Radiobutton: Radio<int>(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return whiteColor;
                      }),
                      activeColor: whiteColor,
                      // fillColor:,
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                        //selected value
                      }),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TotalPriceBottomWidget(
              onTap: () {
                //  Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => PaymentScreen(
                //           price: '100',
                //         )));
                if (_value == 1) {
                  razorpay.open(options);
                } else {
                  Navigator.of(context).pop();
                  // MaterialPageRoute(builder: (context) => MainScreen()));
                }
              },
              Title: 'Total cost',
              totalPrice: widget.price,
              selectPayments: 'Confirm Payment',
            ),
          )
        ],
      ),
    );
  }
}
