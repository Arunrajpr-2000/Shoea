import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/widgets/itemwidget.dart';
import 'widget/Home_header_widget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeScreenHeaderWidget(searchController: searchController),
        ItemWidget(),
      ],
    );
  }
}

class AllCircleAvatar extends StatelessWidget {
  const AllCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: const Color(0xff393A3F),
        radius: 30.r,
        child: const Text(
          'All',
          style: TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
