import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    Key? key,
    required this.OrderTitle,
    required this.Imageurl,
    required this.DeliveryStatus,
  }) : super(key: key);

  final List<String>? OrderTitle;
  final List<String>? Imageurl;
  final List<String>? DeliveryStatus;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: OrderTitle!.length,
      separatorBuilder: (context, index) => k20height,
      itemBuilder: (context, index) {
        return Container(
            // width: 100.w,
            // height: 150.h,
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30)),
                  // width: 200,
                  // height: 200,
                  child: Image.network(
                    Imageurl![index],
                    fit: BoxFit.contain,
                    width: 70,
                    height: 70,
                  )),
              title: Text(
                "${OrderTitle![index]}",
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(30)),
                child: Text('${DeliveryStatus![index]}'),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ));
      },
    );
  }
}
