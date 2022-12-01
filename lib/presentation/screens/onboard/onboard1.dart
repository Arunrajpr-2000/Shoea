// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:shoea_app/core/color/colors.dart';
// import 'package:shoea_app/presentation/screens/onboard/onboard2.dart';

// class onboard1 extends StatelessWidget {
//   const onboard1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) {
//         Timer(
//           Duration(seconds: 2),
//           () => Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => onboard2())),
//         );
//       },
//     );
//     return Scaffold(
//       backgroundColor: ScaffoldBgcolor,
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Image.asset(
//           "asset/OnboardWelcome.jpg",
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }
