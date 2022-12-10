import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/Application/Bloc/CartBloc/cart_bloc.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/function/cart_fun.dart';
import 'package:shoea_app/presentation/widgets/quantity_widget.dart';

class CartListView extends StatelessWidget {
  CartListView({
    Key? key,
    // required this.Cartimage,
    // required this.CartProductName,
    // required this.CartProductPrice,
  }) : super(key: key);

  int count = 1;

  // final List<String>? Cartimage;
  // final List<String>? CartProductName;
  // final List<int>? CartProductPrice;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(email)
                .collection('cart')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  separatorBuilder: (context, index) => k30height,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        k10width,
                        Container(
                          width: 100.w,
                          height: 100.h,

                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(documentSnapshot['image'][0]),
                                fit: BoxFit.contain,
                              ),
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20)),
                          // child: Image.network(
                          //   documentSnapshot['image'][0],
                          //   // Cartimage![index],
                          //   // width: 50.w,
                          //   // height: 50.h,
                          //   fit: BoxFit.contain,
                          // ),
                        ),
                        k10width,
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: 120.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  documentSnapshot['name'],
                                  // CartProductName![index],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  // "₹5,939",
                                  '₹ ${documentSnapshot['cartprice']}',
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
                                onPressed: () {
                                  DocumentReference documentReference =
                                      FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(email)
                                          .collection('cart')
                                          .doc(documentSnapshot['name']);
                                  documentReference.delete().whenComplete(() =>
                                      log("${documentSnapshot['name']} Deleted"));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: whiteColor,
                                )),
                            QuantityWidget(
                              OnPressAdd: () {
                                if (documentSnapshot['orderquantity'] > 0) {
                                  DocumentReference documentReference =
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(email)
                                          .collection('cart')
                                          .doc(documentSnapshot['docname']);

                                  // dynamic cartprice =
                                  //     documentSnapshot['price'] *
                                  //         documentSnapshot['orderquantity'];

                                  // var productsize;
                                  Map<String, dynamic> category = {
                                    'orderquantity':
                                        documentSnapshot['orderquantity'] + 1,
                                    "name": documentSnapshot['name'],
                                    'docname': documentSnapshot['docname'],
                                    'price': documentSnapshot['price'],
                                    'quantity': documentSnapshot['quantity'],
                                    'description':
                                        documentSnapshot['description'],
                                    'size': documentSnapshot['size'],
                                    'image': documentSnapshot['image'],
                                    'cartprice': (documentSnapshot['price']) *
                                        (documentSnapshot['orderquantity'] + 1)
                                  };

                                  log('message cate ');

                                  documentReference
                                      .update(category)
                                      .whenComplete(
                                          () => log(' quantity updated'));
                                }

                                //  log(count.toString());
                                //log(state.orderquantity.toString());

                                // log(documentSnapshot['price'].toString());

                                // BlocProvider.of<CartBloc>(context)
                                //     .add(IncrementCount(
                                //   // count,

                                //   documentSnapshot['orderquantity'],
                                // ));
                                // Product(
                                //     count: state.count,
                                //     size: documentSnapshot['size'],
                                //     id: documentSnapshot['docname'],
                                //     name: documentSnapshot['name'],
                                //     description:
                                //         documentSnapshot['description'],
                                //     price: documentSnapshot['price'],
                                //     quantity:
                                //         documentSnapshot['quantity'],
                                //     images:
                                //         documentSnapshot['image']))) as List<Product>;
                                // log(state.cartModel[index].id.toString());
                              },
                              Quantity:
                                  documentSnapshot['orderquantity'].toString(),
                              OnPressSub: () {
                                if (documentSnapshot['orderquantity'] > 1) {
                                  DocumentReference documentReference =
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(email)
                                          .collection('cart')
                                          .doc(documentSnapshot['docname']);

                                  // var productsize;
                                  Map<String, dynamic> category = {
                                    'orderquantity':
                                        documentSnapshot['orderquantity'] - 1,
                                    "name": documentSnapshot['name'],
                                    'docname': documentSnapshot['docname'],
                                    'price': documentSnapshot['price'],
                                    'quantity': documentSnapshot['quantity'],
                                    'description':
                                        documentSnapshot['description'],
                                    'size': documentSnapshot['size'],
                                    'image': documentSnapshot['image'],
                                    'cartprice': (documentSnapshot['price']) *
                                        (documentSnapshot['orderquantity'] - 1)
                                  };

                                  log('message cate ');

                                  documentReference
                                      .update(category)
                                      .whenComplete(
                                          () => log(' quantity updated'));
                                }

                                // BlocProvider.of<CartBloc>(context)
                                //     .add(DecrementCount(
                                //   // count,
                                //   // state.cartModel[index].orderquantity,
                                //   documentSnapshot['orderquantity'] - 1,
                                //   // state.cartModel
                                //   // Product(
                                //   //     count: state.count,
                                //   //     size: documentSnapshot['size'],
                                //   //     id: documentSnapshot['docname'],
                                //   //     name: documentSnapshot['name'],
                                //   //     description:
                                //   //         documentSnapshot['description'],
                                //   //     price: documentSnapshot['price'],
                                //   //     quantity:
                                //   //         documentSnapshot['quantity'],
                                //   //     images:
                                //   //         documentSnapshot['image'])
                                // ));
                              },
                            )
                          ],
                        )
                      ],
                    );
                  },
                  // itemCount: Cartimage!.length,
                  itemCount: snapshot.data!.docs.length,
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
      },
    );
  }
}
