import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/model/product_model.dart';
import 'package:shoea_app/presentation/screens/product_details/product_View.dart';

class ListedItem extends StatelessWidget {
  ListedItem({
    required this.title,
    required this.product,
    required this.image,
    Key? key,
  }) : super(key: key);
  String title;
  String image;

  Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => ProductView(
                        productdescription: product.description,
                        productname: product.name.toString(),
                        productid: product.id,
                        productprice: product.price.toString(),
                        productquantiy: product.quantity.toString(),
                        productsize: product.size.toList(),
                        productimage: product.images,
                      )),
            );
          },
          child: SizedBox(
            // color: Colors.white12,
            height: 270.h,
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    //  width_5,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image.isEmpty
                                    ? 'https://img.freepik.com/premium-photo/spacious-modern-minimalis-living-room-empty-room-plant-wood-flooor-3d-rendering_33739-490.jpg?w=2000'
                                    : image)),
                            borderRadius: BorderRadius.circular(5),
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    //width_5,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          // Spacer(),
                          // Text(
                          //   'ID : ${product.name}',
                          //   style: TextStyle(
                          //       overflow: TextOverflow.ellipsis,
                          //       fontSize: 10,
                          //       color: Colors.white60),
                          //   overflow: TextOverflow.clip,
                          // ),
                        ),
                        //  height_5,
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            maxLines: 5,
                            ' ${product.description}',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white70),
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Column(
                    //   children: [
                    GestureDetector(
                      onTap: () {
                        // itemCount(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ' ₹  ${product.price}  ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                    // Text(
                    //   '\$ ${product.price}',
                    //   style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.amberAccent),
                    // )
                    //   ],
                    // ),
                    //const Spacer(),
                    // RatingBarIndicator(
                    //   rating: product.rating.toDouble(),
                    //   itemBuilder: (context, index) => Icon(
                    //     Icons.star,
                    //     color: Colors.amber,
                    //   ),
                    //   itemCount: 5,
                    //   itemSize: 30.0,
                    //   direction: Axis.horizontal,
                    // ),
                    // width_10,
                    // width_10,
                  ],
                ),
                //sconst Divider(),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Divider(color: whiteColor),
        ),
        //height_10,
      ],
    );
  }

  // itemCount(BuildContext context) {
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: const Text(
  //       "Cancel",
  //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //     ),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );
  //   Widget continueButton = TextButton(
  //     child: const Text(
  //       "Save",
  //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //     ),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     backgroundColor: Colors.black,
  //     content: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         // height_20,
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             countTile(lang: '1', isSelected: true),
  //             // width_20,
  //             Column(
  //               children: [
  //                 Container(
  //                   height: 30,
  //                   width: 30,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(5),
  //                     border: Border.all(color: Colors.white70),
  //                   ),
  //                   child: Icon(
  //                     Icons.add,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //                 // height_5,
  //                 // height_5,
  //                 Container(
  //                   height: 30,
  //                   width: 30,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(5),
  //                     border: Border.all(color: Colors.white70),
  //                   ),
  //                   child: Icon(
  //                     Icons.remove,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         //  height_10,
  //       ],
  //     ),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

//   Row countTile({required String lang, bool isSelected = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // width_10,
//         Container(
//           height: 70,
//           width: 50,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             border: Border.all(color: Colors.white70),
//           ),
//           child: Center(
//             child: Text(
//               lang,
//               style: const TextStyle(
//                   fontSize: 26,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
}

// class CustomButton extends StatelessWidget {
//   CustomButton({
//     required this.text,
//     Key? key,
//   }) : super(key: key);
//   String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(border: Border.all(color: Colors.white38)),
//       child: Center(
//         child: Text(
//           text,
//           style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
