import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/widgets/headerTile.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderTile(
            // leadingIconbutton: IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.menu,
            //     color: whiteColor,
            //   ),
            // ),
            Title: Text(
              'Notifications',
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
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
        k20height,
        Expanded(
          child: SizedBox(
            width: 300.w,
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => k20height,
              itemBuilder: (context, index) {
                return Container(
                    // width: 100.w,
                    //height: 60.h,
                    decoration: BoxDecoration(
                        color: Color(0xff35383F),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(30)),
                        width: 35.sp,
                        height: 35.sp,
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        " Your order is delivered",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
