import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage404 extends StatelessWidget {
  const ErrorPage404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef1d1),
      body: Container(
        // Ensure it takes the full height of the screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'pagenotfound.png'), // This will cover the entire area of the Container
          ),
        ),
      ),
    );
  }
}
