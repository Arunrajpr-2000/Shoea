import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';

class TextfieldContainer extends StatelessWidget {
  TextfieldContainer(
      {Key? key,
      this.Controller,
      this.hinttext,
      this.TrailingIcon,
      this.validator,
      this.initialValue,
      this.errorText,
      this.keyboardType,
      this.leadingIcon,
      this.OnChange})
      : super(key: key);

  TextEditingController? Controller = TextEditingController();
  String? hinttext, errorText;
  Icon? leadingIcon;
  String? initialValue;
  TextInputType? keyboardType;
  Icon? TrailingIcon;
  void OnChange;

  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.sp,
      height: 55.sp,
      decoration: BoxDecoration(
          color: const Color(0xff1F222B),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: leadingIcon,
        title: TextFormField(
          initialValue: initialValue,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onChanged: (value) => OnChange,
          style: const TextStyle(color: whiteColor),
          cursorColor: whiteColor,
          controller: Controller,
          decoration: InputDecoration(
            errorText: errorText,
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
        ),
        trailing: TrailingIcon,
      ),
    );
  }
}
