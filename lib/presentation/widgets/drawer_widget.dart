import 'package:flutter/material.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/screens/MainPage/mainpage.dart';
import 'package:shoea_app/presentation/screens/settings/setting_screen.dart';
import 'package:shoea_app/presentation/screens/signIn/login.dart';
import 'package:shoea_app/presentation/widgets/list_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: whiteColor,
        child: Container(
            child: Column(children: [
          DrawerHeader(
              decoration: BoxDecoration(color: ScaffoldBgcolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/AppLogo.jpg',
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    "H O E A",
                    style: const TextStyle(
                        fontFamily: "poppinz",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              )),
          ListTileWidget(
            IconColor: Color(0xff2b2b29),
            Title: 'Home',
            LeadIcon: Icons.home,
            Ontap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MainScreen(),
            )),
          ),
          ListTileWidget(
            IconColor: Color(0xff2b2b29),
            Title: 'Settings',
            LeadIcon: Icons.settings,
            Ontap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SettingScreen(),
            )),
          ),
          ListTileWidget(
            IconColor: Color(0xff2b2b29),
            Title: 'Log out',
            LeadIcon: Icons.settings,
            Ontap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
          ),
        ])));
  }
}