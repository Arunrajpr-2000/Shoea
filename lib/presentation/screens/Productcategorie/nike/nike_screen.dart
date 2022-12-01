import 'package:flutter/material.dart';
import 'package:shoea_app/core/color/colors.dart';
import 'package:shoea_app/presentation/widgets/drawer_widget.dart';
import 'package:shoea_app/presentation/widgets/itemwidget.dart';

class NikeScreen extends StatelessWidget {
  const NikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldBgcolor,
      appBar: AppBar(
        backgroundColor: ScaffoldBgcolor,
        title: Text(
          'Nike',
          style: TextStyle(color: whiteColor),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: ListView(
        shrinkWrap: true,
        children: [ItemWidget()],
      ),
    );
  }
}
