import 'dart:convert';
import 'dart:io';
import 'dart:js_interop';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';
import 'ApiSingleton.dart';
import 'Authorization.dart';
import 'form_components.dart';
import 'package:animated_background/animated_background.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'package:dio/dio.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Widget scaffoldChild;
    String? password;
    String? email;
    String? firstName;
    String? lastName;
    String? phoneNumber;
    Form form = Form(
        key: _formKey,
        child: FormContainer(
          title: 'Sign Up',
          asset: 'assets/signInBackground.png',
          children: [
            InfoFormField(
              onSaved: (value) {
                firstName = value;
              },
              icon: const Icon(Icons.abc),
              hintText: "John",
              labelText: "First Name *",
            ),
            InfoFormField(
              onSaved: (value) {
                lastName = value;
              },
              icon: const Icon(Icons.abc),
              hintText: "Doe",
              labelText: "Last Name *",
            ),
            InfoFormField(
              onSaved: (value) {
                phoneNumber = value;
              },
              icon: const Icon(Icons.phone),
              hintText: "+90 5xx xxx xx xx",
              labelText: "Phone Number *",
            ),
            InfoFormField(
              onSaved: (value) {
                email = value;
              },
              icon: const Icon(Icons.person),
              hintText: "name.surname@ug.bilkent.edu.tr",
              labelText: "Email *",
              validator: (value) {
                if (value == null ||
                    !value.endsWith("bilkent.edu.tr") ||
                    !value.contains("@")) {
                  return "Please use a Bilkent mail!";
                }
                return null;
              },
            ),
            InfoFormField(
                onSaved: (value) {
                  password = value ?? password;
                },
                onChanged: (value) {
                  password = value;
                },
                icon: const Icon(Icons.lock),
                hintText: "",
                labelText: "Password *",
                isPassword: true),
            InfoFormField(
                validator: (value) {
                  if (value == null || value != password) {
                    return "Passwords don't match";
                  }
                  return null;
                },
                onSaved: (value) {
                  print(value);
                },
                icon: const Icon(Icons.lock),
                hintText: "",
                labelText: "Password Again*",
                isPassword: true),
            isLoading
                ? CircularProgressIndicator()
                : FormButton(
                    hintText: "Sign Up",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        setState(() {
                          isLoading = true;
                        });
                        final createUserDTO = CreateUserDTO((b) => b
                          ..enabled = true
                          ..userName = email
                          ..password = password
                          ..firstName = firstName
                          ..lastName = lastName
                          ..phoneNumber = phoneNumber);

                        Openapi(interceptors: [SkipInterceptor()])
                            .getAuthApi()
                            .apiAuthRegisterPost(createUserDTO: createUserDTO)
                            .then((value) {
                          final authRequest = AuthorizeRequest((b) => b
                            ..password = password
                            ..userName = email);
                          Openapi(interceptors: [SkipInterceptor()])
                              .getAuthApi()
                              .apiAuthAuthorizePost(
                                  authorizeRequest: authRequest)
                              .then((value) async {
                            setState(() {
                              isLoading = false;
                            });
                            if (value.statusCode == 200 &&
                                value.data != null &&
                                value.data?.isAuthorized != null &&
                                value.data?.isAuthorized == true) {
                              final data = value.data; //TODO if data is null??
                              await Authorization.storeTokens(data?.accessToken,
                                  data?.refreshToken, data?.userId);
                              context.go("/market/second_hand_sale");
                            } else {
                              final snackBar = SnackBar(
                                duration: const Duration(seconds: 3),
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: "Wrong Password",
                                  contentType: ContentType.failure,
                                  message: 'Please enter again',
                                ),
                              );
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              });
                            }
                          });
                        });
                      }
                    },
                  ),
            Center(
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        color: kHighlightText,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go("/");
                        }),
                ]),
              ),
            ),
          ],
        ));
    scaffoldChild = Center(
      child: form,
    );
    return Scaffold(
        body: AnimatedBackground(
            vsync: this,
            behaviour: RandomParticleBehaviour(
                options: const ParticleOptions(
              baseColor: kSignUpBackground,
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
            child: scaffoldChild));
  }
}
