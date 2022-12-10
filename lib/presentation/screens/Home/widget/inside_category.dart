import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';

import '../../product_details/product_View.dart';

// ignore: must_be_immutable
class InSideCategory extends StatelessWidget {
  InSideCategory({required this.brandName, super.key});

  String brandName;

  // final List<String>? Cartimage = [
  //   'https://rukminim1.flixcart.com/image/832/832/l58iaa80/shoe/9/y/q/-original-imagfyaseenuzn6d.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/4/j/1/6-nikefecion-6-nnikhe-blue-original-imaggxz9wf5s7q3d.jpeg?q=70',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(brandName.toString()),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('categories')
              .doc(brandName)
              .collection(brandName)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.80,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 1.0,
                ),
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  String id = snapshot.data!.docs[index].id;
                  log(id);
                  if (id == documentSnapshot['name']) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductView(
                                  productname:
                                      documentSnapshot['name'].toString(),
                                  productdescription:
                                      documentSnapshot['description']
                                          .toString(),
                                  productprice:
                                      documentSnapshot['price'].toString(),
                                  productquantiy:
                                      documentSnapshot['quantity'].toString(),
                                  productsize:
                                      documentSnapshot['size'].toList(),
                                  productid: documentSnapshot['docname'],
                                  productimage: documentSnapshot['image'],
                                )));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20)),
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
                                documentSnapshot['image'][0],
                                width: 120.w,
                                height: 120.h,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                documentSnapshot['name'],
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "₹ ${documentSnapshot['price']}",
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
                  } else {
                    return Text('');
                  }
                },
                // childAspectRatio: 0.80,
                physics: NeverScrollableScrollPhysics(),
                // crossAxisCount: 2,
                shrinkWrap: true,
                // children: [],
              );
            } else {
              return const Align(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          }),
    );
  }
}
