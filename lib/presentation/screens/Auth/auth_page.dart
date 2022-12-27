import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoea_app/Application/Bloc/Authbloc/auth_bloc.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/screens/MainPage/mainpage.dart';
import 'package:shoea_app/presentation/screens/Auth/signIn/login.dart';
import 'package:shoea_app/presentation/screens/Auth/signUp/SingUp_Screen.dart';

class LoginStream extends StatelessWidget {
  const LoginStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: whiteColor,
              backgroundColor: Colors.black,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Somthing went wrong',
                style: TextStyle(color: whiteColor),
              ),
            );
          } else if (snapshot.hasData) {
            return MainScreen();
          } else {
            return const LoginOrNot();
          }
        });
  }
}

class LoginOrNot extends StatelessWidget {
  const LoginOrNot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: ((context, state) {
        return state.isLogin ? LoginScreen() : SignUpScreen();
      }),
    );
  }
}
