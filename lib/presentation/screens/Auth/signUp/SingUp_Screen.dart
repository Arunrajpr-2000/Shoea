import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/Application/Bloc/Authbloc/auth_bloc.dart';

import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/presentation/screens/Auth/signIn/login.dart';

import 'package:shoea_app/presentation/widgets/textfield_container.dart';

class SignUpScreen extends StatelessWidget {
  final navkey = GlobalKey<NavigatorState>();
  SignUpScreen({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();
  bool _validate = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _namecontroller = TextEditingController();
  final _phonenumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldBgcolor,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Form(
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
                      'Create An Account',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    k20height,
                    k20height,
                    // TextfieldContainer(
                    //   // validator: (email) =>
                    //   //     email != null && EmailValidator.validate(email)
                    //   //         ? 'Enter a valid Email'
                    //   //         : null,
                    //   Controller: _namecontroller,
                    //   hinttext: 'Enter your Name',
                    //   leadingIcon: Icon(
                    //     Icons.person,
                    //     color: Colors.grey,
                    //     size: 20,
                    //   ),
                    // ),
                    // TextfieldContainer(
                    //   // validator: (email) =>
                    //   //     email != null && EmailValidator.validate(email)
                    //   //         ? 'Enter a valid Email'
                    //   //         : null,
                    //   Controller: _phonenumController,
                    //   hinttext: 'Enter your Mobile No.',
                    //   leadingIcon: Icon(
                    //     Icons.person,
                    //     color: Colors.grey,
                    //     size: 20,
                    //   ),
                    // ),
                    TextfieldContainer(
                      // validator: (email) =>
                      //     email != null && EmailValidator.validate(email)
                      //         ? 'Enter a valid Email'
                      //         : null,
                      Controller: _emailController,
                      hinttext: 'Email',
                      leadingIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    k20height,
                    TextfieldContainer(
                        Controller: _passwordController,
                        validator: (value) => value != null && value.length < 6
                            ? 'Minimum 6 letters'
                            : null,
                        hinttext: 'Password',
                        leadingIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                          size: 20,
                        ),
                        TrailingIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            ))),
                    k20height,
                    TextfieldContainer(
                        validator: (value) {
                          value != null &&
                                  value.length <= 6 &&
                                  _passwordController.text !=
                                      _confirmpasswordController.text
                              ? "PassWord didn't Match"
                              : null;
                        },
                        Controller: _confirmpasswordController,
                        hinttext: 'Confirm Password',
                        leadingIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                          size: 20,
                        ),
                        TrailingIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            ))),
                    k20height,
                    GestureDetector(
                      onTap: () async {
                        log('calling SignUp Bloc');
                        // final emailuser =
                        //     FirebaseAuth.instance.currentUser!.email;

                        // final passwords = FirebaseAuth.instance.currentUser!
                        //     .updatePassword(_passwordController.text);

                        // log(emailuser.toString());

                        // final docUser = FirebaseFirestore.instance
                        //     .collection('users')
                        //     .doc(emailuser);
                        // List<String> Cart = [];
                        // Map<String, dynamic> map = {
                        //   'email': emailuser,
                        //   'passsword': passwords,
                        // };
                        // await docUser.set(map);

                        final isValid = formkey.currentState!.validate();
                        if (!isValid) {
                          log('invaied inputs');
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context).add(AuthSignUp(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                            context: context));

                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //   builder: (context) => LoginScreen(),
                        // ));
                        // final emailuser =
                        //     FirebaseAuth.instance.currentUser!.email;

                        // final passwords = FirebaseAuth.instance.currentUser!
                        //     .updatePassword(_passwordController.text);

                        // log(emailuser.toString());

                        // final docUser = FirebaseFirestore.instance
                        //     .collection('users')
                        //     .doc(emailuser);
                        // List<String> Cart = [];
                        // Map<String, dynamic> map = {
                        //   'email': emailuser,
                        //   'passsword': _passwordController.text,
                        // };
                        // await docUser.set(map);

                        // log('new user created n added to databse');
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Sign Up',
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
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {
                          // context.read<AuthBloc>().add(Toggle());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) => LoginScreen(),
                          //   ),
                          // );

                          BlocProvider.of<AuthBloc>(context).add(Toggle());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " Sign In",
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
