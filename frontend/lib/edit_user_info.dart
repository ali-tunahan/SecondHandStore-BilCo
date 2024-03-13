import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bil_co/components/edit_user_info_components.dart';
import 'package:bil_co/components/profile_page_components.dart';

import 'constants.dart';


class EditUserInfo extends StatefulWidget {
  const EditUserInfo({super.key, required this.userId});
  final String userId;
  @override
  State<EditUserInfo> createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Widget scaffoldChild;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
          ],
          title: Text('Profile', style: ProfilePageTextStyle()),
          leadingWidth: 100,
          leading: TextButton(
            onPressed: () {
              //Will go to home page
              Navigator.pushNamed(context, "/second_hand_sale");
            },
            child: Text('BilCo.', style: ProfilePageTextStyle()),
          ),
        ),
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
            baseColor: kPrimaryColor,
            spawnOpacity: 0.0,
            opacityChangeRate: 0.25,
            minOpacity: 0.1,
            maxOpacity: 0.4,
            particleCount: 70,
            spawnMaxRadius: 15.0,
            spawnMaxSpeed: 100.0,
            spawnMinSpeed: 30,
            spawnMinRadius: 7.0,
          )),
          child: SafeArea(
              child: Stack(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EditPanel(),
                    FooterPanel()
                  ]), //Headerpanel silindi
            )
          ])),
        ));
  }

  TextStyle ProfilePageTextStyle() {
    return TextStyle(
        fontSize: 25,
        color: kTitleColor,
        fontWeight: FontWeight.w800,
        letterSpacing: .5);
  }
}
