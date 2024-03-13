import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
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
        title: Text('Settings', style: ProfilePageTextStyle()),
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {
            //Will go to home page
          },
          child: Text('BilCo.', style: ProfilePageTextStyle()),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Option 1'),
            onTap: () {
              // Handle option 1 tap
            },
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () {
              // Handle option 2 tap
            },
          ),
          // Add more options as needed
        ],
      ),
    );
  }
}

TextStyle ProfilePageTextStyle() {
  return TextStyle(
      fontSize: 25,
      color: kTitleColor,
      fontWeight: FontWeight.w800,
      letterSpacing: .5);
}
