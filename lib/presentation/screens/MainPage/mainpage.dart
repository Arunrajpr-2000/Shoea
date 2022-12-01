import 'package:flutter/material.dart';

import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/screens/Home/home_screen.dart';
import 'package:shoea_app/presentation/screens/cart/cart_screen.dart';
import 'package:shoea_app/presentation/screens/notification%20Screen/Notification_screen.dart';
import 'package:shoea_app/presentation/screens/order%20History/order_history.dart';
import 'package:shoea_app/presentation/screens/profile%20Screen/profile_screen.dart';
import 'package:shoea_app/presentation/screens/wishlist/wishlist_screen.dart';
import 'package:shoea_app/presentation/widgets/bottomNavbar_widget.dart';
import 'package:shoea_app/presentation/widgets/drawer_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenWishlist(),
    ScreenCart(),
    OrderPage(),
    ScreenProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
