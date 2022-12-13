import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoea_app/Application/Bloc/Authbloc/auth_bloc.dart';
import 'package:shoea_app/Application/Bloc/CartBloc/cart_bloc.dart';
import 'package:shoea_app/Application/Provider/google_signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoea_app/presentation/screens/Auth/auth_page.dart';

// import 'package:http/http.dart' as http;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, _) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => GoogleSignInProvider(),
              ),
              BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(),
              ),
              BlocProvider<CartBloc>(
                create: (context) => CartBloc(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter E-Commerce',
              theme: ThemeData(
                unselectedWidgetColor: Colors.white,
                // disabledColor: Colors.blue,
                primarySwatch: Colors.blue,
              ),
              home: LoginStream(),
            ));
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
