import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/screens/Home/home_screen.dart';
import 'package:shoea_app/presentation/screens/Productcategorie/nike/nike_screen.dart';
import 'package:shoea_app/presentation/screens/settings/setting_screen.dart';
import 'package:shoea_app/presentation/widgets/headerTile.dart';
import 'package:shoea_app/presentation/widgets/textfield_container.dart';

import '../../../../core/constants/constants.dart';
import 'circle_Avatar_Listview_widget.dart';

class HomeScreenHeaderWidget extends StatelessWidget {
  const HomeScreenHeaderWidget({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTile(
            Title: Text(
              'Shoea',
              style: TextStyle(color: whiteColor),
            ),
            TrailingButton: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
                },
                icon: const Icon(
                  Icons.settings_suggest,
                  color: whiteColor,
                ),
              )
            ]),
        k20height,
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            width: double.infinity,
            child: TextfieldContainer(
              // OnChange: () {
              //   return Text('data');
              // },
              Controller: searchController,
              leadingIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),

              hinttext: 'Looking For shoes',
              // TrailingIcon: const Icon(
              //   Icons.tune,
              //   color: Colors.grey,
              // ),
            ),
          ),
        ),
        k20height,
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Popular Shoes',
                style: TextStyle(color: whiteColor),
              ),
              Text(
                'See All',
                style: TextStyle(color: whiteColor),
              ),
            ],
          ),
        ),
        // k10height,
        // CircleAvatarListView(),
        k10height,
        SizedBox(
          height: 100.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              k10width,
              const AllCircleAvatar(),
              k10width,
              CircleAvatarWidget(
                Imagepath: Image.asset(
                  'asset/BrandImages/NikeLogo.png',
                  // 'asset/BrandImages/NikeLogo.png',
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.contain,
                ),
                Ontap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NikeScreen(),
                )),
              ),
              k10width,
              CircleAvatarWidget(
                Imagepath: Image.asset(
                  'asset/BrandImages/pumaLogo.png',
                  // 'asset/BrandImages/NikeLogo.png',
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.contain,
                ),
                Ontap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NikeScreen(),
                )),
              ),
              k10width,
              CircleAvatarWidget(
                Imagepath: Image.asset(
                  'asset/BrandImages/Reebook.png',
                  width: 35.w,
                  height: 35.h,
                  fit: BoxFit.contain,
                ),
                Ontap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NikeScreen(),
                )),
              ),
              k10width,
              CircleAvatarWidget(
                Imagepath: Image.asset(
                  'asset/BrandImages/1689-removebg-preview (1).png',
                  width: 35.w,
                  height: 35.h,
                  fit: BoxFit.contain,
                ),
                Ontap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NikeScreen(),
                )),
              ),
              k10width,
              CircleAvatarWidget(
                Imagepath: Image.asset(
                  'asset/BrandImages/Under-Armour-Logo-White-RED-removebg-preview.png',
                  width: 35.w,
                  height: 35.h,
                  fit: BoxFit.contain,
                ),
                Ontap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NikeScreen(),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}