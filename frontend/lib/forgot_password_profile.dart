import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:go_router/go_router.dart';
import 'PostPage.dart';
import 'constants.dart';

class ForgotPassWordProfile extends StatefulWidget {
  const ForgotPassWordProfile({super.key});

  @override
  State<ForgotPassWordProfile> createState() => _ForgotPassWordProfileState();
}

class _ForgotPassWordProfileState extends State<ForgotPassWordProfile> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double boxWidth = screenSize.width * 0.5;
    double boxHeight = screenSize.height * 0.5;
    if (screenSize.width < 700) {
      boxHeight = screenSize.height * 0.8;
      boxWidth = screenSize.width * 0.9;
    } else {
      boxHeight = screenSize.height * 0.7;
      boxWidth = screenSize.width * 0.5;
    }
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
                  'Change Password',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller,
                    obscureText:
                        !_passwordVisible, // Use the state variable here
                    decoration: InputDecoration(
                      labelText: 'Please enter your existing password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Change the icon based on the state of password visibility
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          // Update the state to toggle password visibility
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    // Other optional properties...
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller2,
                    obscureText:
                        !_passwordVisible, // Use the state variable here
                    decoration: InputDecoration(
                      labelText: 'Please enter your new password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Change the icon based on the state of password visibility
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          // Update the state to toggle password visibility
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    // Other optional properties...
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller3,
                    obscureText:
                        !_passwordVisible, // Use the state variable here
                    decoration: InputDecoration(
                      labelText: 'Please enter your new password again',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Change the icon based on the state of password visibility
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          // Update the state to toggle password visibility
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    // Other optional properties...
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_controller2.text != _controller3.text) {
                      final snackBar = SnackBar(
                        duration: const Duration(seconds: 3),
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Passwords don\'t match',
                          message: 'Make sure passwords match',
                          contentType: ContentType.failure,
                        ),
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }
                    //TODO
                    //TODO ESKİ ŞİFREYLE AYNI MI BURDA KONTROL ET
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
