import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/screens/Auth/signIn/login.dart';
import 'package:shoea_app/presentation/widgets/drawer_widget.dart';
import 'package:shoea_app/presentation/widgets/list_tile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool islight = true;
    return Scaffold(
      backgroundColor: ScaffoldBgcolor,
      appBar: AppBar(
        backgroundColor: ScaffoldBgcolor,
        title: Text(
          'Settings',
          style: TextStyle(color: whiteColor, fontSize: 17),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          ListTileWidget(
            IconColor: whiteColor,
            LeadIcon: Icons.notifications,
            Title: 'Notification',
            Ontap: () {},
            TrailingButton: Switch(
                activeColor: Colors.red,
                value: islight,
                onChanged: (value) {
                  islight = value;
                }),
          ),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.lock,
              Title: 'Privacy Policy',
              Ontap: () {},
              TrailingButton: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.info,
              Title: 'Terms & Conditions',
              Ontap: () {},
              TrailingButton: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.groups,
              Title: 'Invite Friends',
              Ontap: () {},
              TrailingButton: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.logout,
              Title: 'Logout',
              Ontap: () async {
                await FirebaseAuth.instance.signOut();
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx1) => LoginScreen()));
              },
              TrailingButton: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
        ],
      ),
    );
  }
}
