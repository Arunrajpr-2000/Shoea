import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoea_app/Application/bloc/auth_bloc.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/core/constants/constants.dart';
import 'package:shoea_app/main.dart';
import 'package:shoea_app/presentation/screens/MainPage/mainpage.dart';
import 'package:shoea_app/presentation/screens/payment/widget/paymet_method_tile_widget.dart';
import 'package:shoea_app/presentation/screens/signIn/widget/auth_page.dart';
import 'package:shoea_app/presentation/screens/signUp/SingUp_Screen.dart';
import 'package:shoea_app/presentation/widgets/textfield_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final navKey = GlobalKey<NavigatorState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                      hinttext: 'Password',
                      leadingIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                        size: 20,
                      ),
                      TrailingIcon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 20,
                      )),
                  k20height,
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => LoginStream(),
                      // ));
                      // signIn();
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //   builder: (context) => MainScreen(),
                      // ));
                      BlocProvider.of<AuthBloc>(context).add(AuthLogin(
                          context: context,
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim()));
                    },
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) => MainScreen())),
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
                  Text(
                    "Forgotten password?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  k20height,
                  PaymentMethodsTile(
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