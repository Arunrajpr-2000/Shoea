import 'package:flutter/material.dart';
import 'package:shoea_app/core/color/colors.dart';

import 'package:shoea_app/presentation/screens/onboard/onboard3.dart';
import 'package:shoea_app/presentation/screens/onboard/widget/onboard_widget.dart';
import 'package:shoea_app/presentation/screens/signIn/login.dart';

class onboard2 extends StatelessWidget {
  const onboard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) {
    //     Timer(
    //       Duration(seconds: 2),
    //       () => Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (context) => onboard3())),
    //     );
    //   },
    // );

    return SafeArea(
      child: Stack(
        children: [
          Onboard_widget(
            imagePath: 'asset/onboard2.jpg',
            Text1: 'We provide high',
            Text2: 'quality products just',
            Text3: 'for you',
            ButtonText: 'NEXT',
            onclick: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => onboard3())),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        )),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    )),
              ))
        ],
      ),
    );
  }
}
