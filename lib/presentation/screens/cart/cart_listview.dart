import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/Application/Bloc/CartBloc/cart_bloc.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/function/cart_fun.dart';
import 'package:shoea_app/model/cart_model.dart';
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
  double total = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return StreamBuilder<List<CartModel>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(email)
                .collection('cart')
                .snapshots()
                .map((snapshot) => snapshot.docs
                    .map((e) => CartModel.fromJson(e.data()))
                    .toList()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  separatorBuilder: (context, index) => k30height,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // QueryDocumentSnapshot documentSnapshot =
                    //     snapshot.data!.docs[index];

                    List<CartModel> documentsnapshot = snapshot.data!;

                    final cartlist = snapshot.data;
                    total = 0;
                    for (var e in cartlist!) {
                      total = total + e.cartprice;

                      log(total.toString());
                    }
                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        k10width,
                        Container(
                          width: 100.w,
                          height: 100.h,

                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    documentsnapshot[index].images[0]),
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
                                  documentsnapshot[index].name,
                                  // CartProductName![index],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  // "₹5,939",
                                  '₹ ${documentsnapshot[index].cartprice}',
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
                                  // DocumentReference documentReference =
                                  //     FirebaseFirestore.instance
                                  //         .collection('users')
                                  //         .doc(email)
                                  //         .collection('cart')
                                  //         .doc(documentsnapshot[index].name);
                                  // documentReference.delete().whenComplete(() {}
                                  // log(
                                  //     "${documentSnapshot['name']} Deleted"),
                                  // );

                                  removeFromCart(
                                      id: documentsnapshot[index].name);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: whiteColor,
                                )),
                            QuantityWidget(
                              OnPressAdd: () {
                                if (documentsnapshot[index].orderquantity > 0) {
                                  DocumentReference documentReference =
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(email)
                                          .collection('cart')
                                          .doc(documentsnapshot[index].id);

                                  // dynamic cartprice =
                                  //     documentSnapshot['price'] *
                                  //         documentSnapshot['orderquantity'];

                                  // var productsize;
                                  Map<String, dynamic> category = {
                                    'orderquantity':
                                        documentsnapshot[index].orderquantity +
                                            1,
                                    // documentSnapshot['orderquantity'] + 1,
                                    "name": documentsnapshot[index].name,
                                    //documentSnapshot['name'],
                                    'docname': documentsnapshot[index].id,
                                    'price': documentsnapshot[index].price,
                                    'quantity':
                                        documentsnapshot[index].quantity,
                                    'description':
                                        documentsnapshot[index].description,
                                    'size': documentsnapshot[index].size,
                                    'image': documentsnapshot[index].images,
                                    'cartprice': (documentsnapshot[index]
                                            .price) *
                                        (documentsnapshot[index].orderquantity +
                                            1),
                                  };

                                  log('message cate ');

                                  documentReference
                                      .update(category)
                                      .whenComplete(() {
                                    log(' quantity updated');
                                  });
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
                              Quantity: documentsnapshot[index]
                                  .orderquantity
                                  .toString(),
                              // documentSnapshot['orderquantity'].toString(),
                              OnPressSub: () {
                                if (documentsnapshot[index].orderquantity > 1) {
                                  DocumentReference documentReference =
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(email)
                                          .collection('cart')
                                          .doc(documentsnapshot[index].id);

                                  // var productsize;
                                  Map<String, dynamic> category = {
                                    'orderquantity':
                                        documentsnapshot[index].orderquantity -
                                            1,
                                    // documentSnapshot['orderquantity'] + 1,
                                    "name": documentsnapshot[index].name,
                                    //documentSnapshot['name'],
                                    'docname': documentsnapshot[index].id,
                                    'price': documentsnapshot[index].price,
                                    'quantity':
                                        documentsnapshot[index].quantity,
                                    'description':
                                        documentsnapshot[index].description,
                                    'size': documentsnapshot[index].size,
                                    'image': documentsnapshot[index].images,
                                    'cartprice': (documentsnapshot[index]
                                            .price) *
                                        (documentsnapshot[index].orderquantity -
                                            1)
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
                  itemCount: snapshot.data!.length,
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
