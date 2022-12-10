import 'package:flutter/material.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/widgets/headerTile.dart';
import 'package:shoea_app/presentation/screens/Home/widget/itemwidget.dart';

class ScreenWishlist extends StatelessWidget {
  const ScreenWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeaderTile(
            Title: Text(
              'Wishlist',
              style: TextStyle(color: whiteColor),
            ),
            TrailingButton: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: whiteColor,
                ),
              ),
            ]),
        ItemWidget()
      ],
    );
  }
}
