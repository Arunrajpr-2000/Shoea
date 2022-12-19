import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/function/order_fun.dart';
import 'package:shoea_app/model/order_product_model.dart';
import 'package:shoea_app/presentation/screens/order%20History/order_history.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    Key? key,
    // required this.OrderTitle,
    // required this.Imageurl,
    // required this.DeliveryStatus,
  }) : super(key: key);

  // final List<String>? OrderTitle;
  // final List<String>? Imageurl;
  // final List<String>? DeliveryStatus;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .collection('order')
            .snapshots(),
        // .map((e) => e.docs
        //     .map((docs) => OrderedProduct.fromJson(docs.data()))
        //     .toList()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final orderList = snapshot.data!;

            //DocumentReference documentReference = snapshot.data.docs;
            return ListView.separated(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              separatorBuilder: (context, index) => k20height,
              itemBuilder: (context, index) {
                // log(orderList[index].images[0].toString());
                QueryDocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return Container(
                    // width: 100.w,
                    // height: 150.h,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(30)),
                          // width: 200,
                          // height: 200,
                          child: Image.network(
                            documentSnapshot['images'][0],
                            fit: BoxFit.contain,
                            width: 70,
                            height: 70,
                          )),
                      title: Text(
                        documentSnapshot['name'],
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: documentSnapshot['isCanceled'] == false
                          ? Container(
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: documentSnapshot['isDeliverd'] == false
                                  ? Text('Order Placed')
                                  : Text('Shipped'),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text('Order Cancelled'),
                            ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ));
              },
            );
          } else {
            return const Align(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        });
  }
}
