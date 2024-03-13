import 'package:bil_co/reusable_components/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'PostPage.dart';
import 'constants.dart';

class ForgotPassWord extends StatefulWidget {
  const ForgotPassWord({super.key});

  @override
  State<ForgotPassWord> createState() => _ForgotPassWordState();
}

class _ForgotPassWordState extends State<ForgotPassWord> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final boxWidth = screenSize.width * 0.6;
    final boxHeight = screenSize.height * 0.5;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('', style: ProfilePageTextStyle()),
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () => context.go("/market/second_hand_sale"),
          child: Text('BilCo.', style: ProfilePageTextStyle()),
        ),
      ),
      body: Center(
        child: Container(
          width: boxWidth,
          height: boxHeight,
          padding: EdgeInsets.all(screenSize.width * 0.05),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.all(5),
            child: Column(
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Please enter your email',
                      border: OutlineInputBorder(),
                    ),
                    // Other optional properties...
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('object'); //TODO IMPLEMENT WHAT TO DO WHEN PRESSED
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(kFormButtonColor),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Custom border radius
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' Send password reset link ',
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                ),
                //AcceptButton('Accept', Colors.white, Colors.green),
                //AcceptButton(' Deny ', Colors.white, Colors.red)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
