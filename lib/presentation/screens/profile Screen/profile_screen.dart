import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/function/cart_fun.dart';
import 'package:shoea_app/function/profile_fun.dart';
import 'package:shoea_app/model/profile_model.dart';
import 'package:shoea_app/presentation/widgets/headerTile.dart';
import 'package:shoea_app/presentation/widgets/textfield_container.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _nameController.text = user.displayName.toString();
        // _emailController.text = user.email.toString();
        _phoneController.text = user.phoneNumber.toString();
      },
    );
    return SingleChildScrollView(
      child: StreamBuilder<List<ProfileModel>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(email)
              .collection('userdetails')
              .snapshots()
              .map((snapshot) => snapshot.docs
                  .map((e) => ProfileModel.fromJson(e.data()))
                  .toList()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProfileModel> profilelist = snapshot.data!;
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeaderTile(
                    Title: const Text(
                      'Profile',
                      style: TextStyle(color: whiteColor, fontSize: 17),
                    ),
                    TrailingButton: [
                      IconButton(
                        onPressed: () {
                          editprofileMethod(context);
                        },
                        icon: Icon(Icons.edit),
                      )
                    ],
                  ),
                  k20height,
                  k20height,
                  CircleAvatar(
                    backgroundColor: ScaffoldBgcolor,
                    backgroundImage: user.photoURL != null
                        ? NetworkImage(user.photoURL!)
                        : NetworkImage(
                            'https://i.pinimg.com/564x/ef/90/8e/ef908e5a83305dcaaf5106e1e4269997.jpg'), //'https://images.unsplash.com/photo-1584670747417-594a9412fba5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHw%3D&w=1000&q=80'),
                    radius: 70,
                  ),
                  k20height,
                  Container(
                    width: 300.sp,
                    height: 55.sp,
                    decoration: BoxDecoration(
                        color: const Color(0xff1F222B),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(
                        profilelist[0].username.toString(),
                        // user.displayName.toString(),
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                  Container(
                    width: 300.sp,
                    height: 55.sp,
                    decoration: BoxDecoration(
                        color: const Color(0xff1F222B),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(
                        profilelist[0].useremail.toString(),
                        //user.email.toString(),
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                  Container(
                    width: 300.sp,
                    height: 55.sp,
                    decoration: BoxDecoration(
                        color: const Color(0xff1F222B),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(
                        profilelist[0].userphoneNo.toString(),
                        //user.phoneNumber.toString(),
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                  // TextfieldContainer(
                  //   // initialValue: user.displayName.toString(),
                  //   Controller: _nameController,
                  //   hinttext: 'Enter Name',
                  //   // TrailingIcon: const Icon(
                  //   //   Icons.edit,
                  //   //   color: whiteColor,
                  //   // ),
                  // ),
                  // k20height,
                  // TextfieldContainer(
                  //     Controller: _emailController, hinttext: 'Enter Email'
                  //     // TrailingIcon: const Icon(
                  //     //   Icons.edit,
                  //     //   color: whiteColor,
                  //     // ),
                  //     ),
                  // k20height,
                  // TextfieldContainer(
                  //     Controller: _phoneController,
                  //     hinttext: 'Add Mobile Number'
                  //     //user.phoneNumber ?? '8129526855',
                  //     // TrailingIcon: const Icon(
                  //     //   Icons.edit,
                  //     //   color: whiteColor,
                  //     // ),
                  //     ),
                ],
              );
            } else {
              return const Align(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          }),
    );
  }

  Future<dynamic> editprofileMethod(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: whiteColor,
            scrollable: true,
            title: const Text(
              'Edit Profile',
              textAlign: TextAlign.center,
              style: TextStyle(color: ScaffoldBgcolor),
            ),
            content: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextfieldContainer(
                      // initialValue: ,
                      Controller: _nameController,
                      hinttext: 'Enter Name',
                      leadingIcon: const Icon(
                        Icons.person,
                        color: whiteColor,
                      ),
                    ),
                    // k20height,
                    // TextfieldContainer(
                    //   Controller: _emailController,
                    //   hinttext: 'Enter Email',
                    //   leadingIcon: const Icon(
                    //     Icons.email,
                    //     color: whiteColor,
                    //   ),
                    // ),
                    k20height,
                    TextfieldContainer(
                      keyboardType: TextInputType.number,
                      Controller: _phoneController,
                      hinttext: 'Enter Phone number',
                      leadingIcon: const Icon(
                        Icons.call,
                        color: whiteColor,
                      ),
                    ),
                    k20height,
                  ],
                ),
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ScaffoldBgcolor)),
                    onPressed: () {
                      addProfileFun(
                          profileModel: ProfileModel(
                              useremail: email.toString(),
                              username: _nameController.text,
                              userphoneNo: _phoneController.text));
                      Navigator.of(context).pop();
                    },
                    child: Text("Submit")),
              ),
            ],
          );
        });
  }
}
