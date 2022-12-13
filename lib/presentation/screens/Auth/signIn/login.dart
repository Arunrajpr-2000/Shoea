import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoea_app/Application/Bloc/Authbloc/auth_bloc.dart';
import 'package:shoea_app/Application/Provider/google_signIn.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/function/user_auth.dart';
import 'package:shoea_app/presentation/screens/Auth/ForgotPassword/forgot_password.dart';
import 'package:shoea_app/presentation/screens/Auth/signUp/SingUp_Screen.dart';
import 'package:shoea_app/presentation/screens/payment/widget/paymet_method_tile_widget.dart';
import 'package:shoea_app/presentation/widgets/textfield_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final navKey = GlobalKey<NavigatorState>();
  bool _validate = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ScaffoldBgcolor,
        body: Form(
          key: formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'asset/AppLogo.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  k10height,
                  Text(
                    'Login to Your Account',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  k20height,
                  k20height,
                  TextfieldContainer(
                    Controller: emailController,
                    hinttext: 'Email',
                    //  errorText: _validate ? 'wrong password' : null,
                    // validator: (email) => email != null
                    //     // && EmailValidator.validate(email)
                    //     ? 'Enter a valid Email'
                    //     : null,
                    leadingIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                  k20height,
                  TextfieldContainer(
                      Controller: passwordController,
                      hinttext: 'Password',
                      validator: (passwrd) =>
                          passwrd != null && passwrd.length < 6
                              ? ' Enter Min 6 Letters'
                              : null,
                      leadingIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                        size: 20,
                      ),
                      TrailingIcon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 20,
                      )),
                  k20height,
                  GestureDetector(
                    onTap: () {
                      final isValid = formkey.currentState!.validate();
                      if (!isValid) return;
                      BlocProvider.of<AuthBloc>(context).add(AuthLogin(
                          context: context,
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  k20height,
                  GestureDetector(
                    onTap: () =>
                        BlocProvider.of<AuthBloc>(context).add(Toggle()),
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => SignUpScreen())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " SignUp",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  k10height,
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotScreen(),
                    )),
                    child: Text(
                      "Forgotten password?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  k20height,
                  PaymentMethodsTile(
                    onTap: () async {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);

                      provider.googleLogin();

                      //UserAuth.addUser();

                      // final email = FirebaseAuth.instance.currentUser!.email;

                      // // final passwords = FirebaseAuth.instance.currentUser!;

                      // log(email.toString());

                      // final docUser = FirebaseFirestore.instance
                      //     .collection('users')
                      //     .doc(email);

                      // Map<String, dynamic> map = {
                      //   'email': email,
                      // };
                      // await docUser.set(map);
                      // log('new user created n added to databse');
                    },
                    ImageUrl:
                        'https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1',
                    Title: 'Sign in With Google',
                  )
                ],
              ),
            ),
          ),
        ));
  }

  // Future signIn() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text.trim());
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  // }
}
