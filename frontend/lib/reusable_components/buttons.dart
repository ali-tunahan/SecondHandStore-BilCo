import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:bil_co/constants.dart';

/*
Widget IconLabelButtons(String lebel, String path) => TextButton.icon(
    onPressed: () => print('pressed'),
    icon: SvgPicture.asset(
      path,
      width: 20,
      color: kTitleColor,
    ),
    label: Text(lebel, style: TextStyle(color: kTitleColor)));
*/
Widget TextButtons(
        String label, Color color, VoidCallback onPressed) =>
    TextButton(
        child: Text(
            label,
            style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: .5)),
        onPressed: onPressed);
/*
Widget LogoButton(String path) => Container(
    margin: EdgeInsets.symmetric(horizontal: 3),
    child: IconButton(
        icon: SvgPicture.asset(path, width: 15, color: kScaffoldColor),
        onPressed: () {}));
*/
Widget NormalButton(String label, Color txtcolor, String path, Color iconColor,
        Color backColor) =>
    InkWell(
      onTap: () {},
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              color: backColor, borderRadius: BorderRadius.circular(5)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            if (path != '') Image.asset(path, color: iconColor, width: 15),
            if (path != '') SizedBox(width: 5),
            Text(label,
                style: TextStyle(
                    fontSize: 10, color: txtcolor, fontWeight: FontWeight.w700))
          ])),
    );
Widget AcceptButton(String label, Color txtcolor, Color backColor,Function onPressed) =>
    ElevatedButton(
      onPressed: () {
        onPressed(); //TODO IMPLEMENT WHAT TO DO WHEN PRESSED
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backColor),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Custom border radius
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          label,
          style: const TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
      ),
    );
