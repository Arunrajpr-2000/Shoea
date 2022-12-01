import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({Key? key, this.Imagepath, this.Ontap})
      : super(key: key);

  final Image? Imagepath;
  final Function()? Ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: CircleAvatar(
        backgroundColor: Color(0xff393A3F),
        radius: 30.r,
        child: Imagepath,
      ),
    );
  }
}
