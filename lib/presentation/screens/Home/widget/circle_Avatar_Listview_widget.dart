import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({Key? key, this.BrandName, this.Ontap})
      : super(key: key);

  // final Image? Imagepath;
  final String? BrandName;
  final Function()? Ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: CircleAvatar(
        backgroundColor: const Color(0xff393A3F),
        radius: 35.r,
        child: Text(
          BrandName.toString(),
          maxLines: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: whiteColor, overflow: TextOverflow.ellipsis, fontSize: 14),
        ),
      ),
    );
  }
}
