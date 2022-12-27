import 'package:flutter/material.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/screens/search/search_screen.dart';
import 'package:shoea_app/presentation/screens/wishlist/widgets/wishlist_item.dart';
import 'package:shoea_app/presentation/widgets/headerTile.dart';

class ScreenWishlist extends StatelessWidget {
  const ScreenWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeaderTile(
            Title: const Text(
              'Wishlist',
              style: TextStyle(color: whiteColor),
            ),
            TrailingButton: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ScreenSearch()));
                },
                icon: const Icon(
                  Icons.search,
                  color: whiteColor,
                ),
              ),
            ]),
        k10height,
        const WishlistItem()
      ],
    );
  }
}
