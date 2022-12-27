import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/widgets/list_tile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldBgcolor,
      appBar: AppBar(
        backgroundColor: ScaffoldBgcolor,
        title: const Text(
          'Settings',
          style: TextStyle(color: whiteColor, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.info,
              Title: 'Terms & Conditions',
              Ontap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const LicensePage(applicationName: 'Lace it'),
                  )),
              TrailingButton: const Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.lock,
              Title: 'Privacy Policy',
              Ontap: () {},
              TrailingButton: const Icon(
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
              TrailingButton: const Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
          ListTileWidget(
              IconColor: whiteColor,
              LeadIcon: Icons.person,
              Title: 'About',
              Ontap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Column(
                        children: const [
                          Text(
                            "S H O E A",
                            style: TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text('1.0.0')
                        ],
                      ),
                      content: const Text(
                          'Shoea is designed and developed by\n ARUNRAJ'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: Color(0xffdd0021),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              TrailingButton: const Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
              )),
        ],
      ),
    );
  }
}
