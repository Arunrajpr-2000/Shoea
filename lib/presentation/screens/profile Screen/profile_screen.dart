import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/widgets/headerTile.dart';
import 'package:shoea_app/presentation/widgets/textfield_container.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController(
      //text:   'LiyaFrans@gmail.com'
      );
  final TextEditingController _phoneController = TextEditingController(
      // text: '8129526855'
      );
  final TextEditingController _nameController = TextEditingController(
      // text: 'Liya Fransis'
      );
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderTile(
            Title: const Text(
              'Profile',
              style: TextStyle(color: whiteColor, fontSize: 17),
            ),
            TrailingButton: [Icon(Icons.edit)],
          ),
          k20height,
          k20height,
          CircleAvatar(
            backgroundColor: ScaffoldBgcolor,
            backgroundImage: user.photoURL != null
                ? NetworkImage(user.photoURL!)
                : NetworkImage(
                    'https://images.unsplash.com/photo-1584670747417-594a9412fba5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHw%3D&w=1000&q=80'),
            radius: 70,
          ),
          k20height,
          TextfieldContainer(
            Controller: _nameController,
            hinttext: user.displayName ?? 'Liya Fransis',
            TrailingIcon: const Icon(
              Icons.edit,
              color: whiteColor,
            ),
          ),
          k20height,
          TextfieldContainer(
            Controller: _emailController,
            hinttext: user.email ?? 'LiyaFrans@gmail.com',
            TrailingIcon: const Icon(
              Icons.edit,
              color: whiteColor,
            ),
          ),
          k20height,
          TextfieldContainer(
            Controller: _phoneController,
            hinttext: user.phoneNumber ?? '8129526855',
            TrailingIcon: const Icon(
              Icons.edit,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
