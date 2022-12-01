import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';

class PaymentMethodsTile extends StatelessWidget {
  const PaymentMethodsTile(
      {Key? key, this.Title, this.ImageUrl, this.Radiobutton})
      : super(key: key);
  final String? Title;
  final String? ImageUrl;
  final Widget? Radiobutton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        width: 300.w,
        child: ListTile(
            contentPadding: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: NetworkImage(ImageUrl.toString())),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff35383F)),
            ),
            tileColor: Color(0xff35383F),
            title: Text(
              '$Title',
              style: TextStyle(
                  color: whiteColor, fontWeight: FontWeight.bold, fontSize: 17),
            ),
            trailing: Radiobutton),
      ),
    );
  }
}
