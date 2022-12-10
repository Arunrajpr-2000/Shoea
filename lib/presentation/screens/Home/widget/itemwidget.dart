import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/presentation/screens/product_details/product_View.dart';

import '../../../../core/color/colors.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key}) : super(key: key);

  // final List<String>? Imageurl = [
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/k1i6ikw0/shoe/r/m/g/bq3204-002-7-nike-black-white-anthracite-original-imafh2hvnqttmhf9.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/9/l/i/-original-imagjuhyc8djsphg.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/k1i6ikw0/shoe/r/m/g/bq3204-002-7-nike-black-white-anthracite-original-imafh2hvnqttmhf9.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/9/l/i/-original-imagjuhyc8djsphg.jpeg?q=70',
  //   'https://rukminim1.flixcart.com/image/832/832/xif0q/shoe/u/s/3/-original-imaggcyckpkgqvfp.jpeg?q=70',
  // ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('categories')
            .doc('popular')
            .collection('popular')
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

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductView(
                              productname: documentSnapshot['name'].toString(),
                              productdescription:
                                  documentSnapshot['description'].toString(),
                              productprice:
                                  documentSnapshot['price'].toString(),
                              productquantiy:
                                  documentSnapshot['quantity'].toString(),
                              productsize: documentSnapshot['size'].toList(),
                              productid: documentSnapshot['docname'],
                              productimage: documentSnapshot['image'],
                            )));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
                              child: const Icon(
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
                        SizedBox(
                          //margin: EdgeInsets.all(10),
                          child: Image.network(
                            documentSnapshot['image'][0],
                            width: 120.w,
                            height: 120.h,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            documentSnapshot['name'],
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "₹ ${documentSnapshot['price']}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              // childAspectRatio: 0.80,
              physics: const NeverScrollableScrollPhysics(),
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
        });
  }
}