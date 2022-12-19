import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shoea_app/core/color/colors.dart';
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
          // ListTileWidget(
          //   IconColor: whiteColor,
          //   LeadIcon: Icons.notifications,
          //   Title: 'Notification',
          //   Ontap: () {},
          //   TrailingButton: Switch(
          //       activeColor: Colors.red,
          //       value: islight,
          //       onChanged: (value) {
          //         islight = value;
          //       }),
          // ),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.person,
              Title: 'About',
              Ontap: () {},
              TrailingButton: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.lock,
              Title: 'Privacy Policy',
              Ontap: () {},
              TrailingButton: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
          // ListTileWidget(
          //     IconColor: whiteColor,
          //     LeadIcon:
          //         //Icons.contact_mail_rounded,
          //         Icons.tips_and_updates,
          //     Title: 'Help & support',
          //     Ontap: () {},
          //     TrailingButton: Icon(
          //       Icons.arrow_forward_ios,
          //       color: whiteColor,
          //     )),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.info,
              Title: 'Terms & Conditions',
              Ontap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        LicensePage(applicationName: 'Shoea E-Commerce'),
                  )),
              TrailingButton: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.telegram,
              Title: 'Invite Friends',
              Ontap: () {
                // Share.share(
                //     'hey! check out this new app \n https://play.google.com/store/apps/details?id=in.brototype.mixpod');
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
