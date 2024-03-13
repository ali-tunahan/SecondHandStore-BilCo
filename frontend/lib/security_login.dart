import 'package:animated_background/animated_background.dart';
import 'package:bil_co/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';
import 'ApiSingleton.dart';
import 'Authorization.dart';
import 'form_components.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SecurityLogin extends StatefulWidget {
  const SecurityLogin({super.key});

  @override
  State<SecurityLogin> createState() => _SecurityLoginState();
}

class _SecurityLoginState extends State<SecurityLogin>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late String password;
  late String mail;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Widget scaffoldChild;
    Form formContainer = Form(
      key: _formKey,
      child: FormContainer(
          title: "Security Login ",
          asset: 'assets/signInBackgroundBlur.png',
          children: [
            InfoFormField(
              onSaved: (value) {
                mail = value ?? "";
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
                  password = value ?? "";
                },
                icon: const Icon(Icons.lock),
                hintText: "",
                labelText: "Password *",
                isPassword: true),
            isLoading
                ? Padding(
                    padding: EdgeInsets.all(6.0),
                    child: CircularProgressIndicator(),
                  )
                : FormButton(
                    hintText: "Login as G building security",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        _formKey.currentState?.save();
                        final authRequest = AuthorizeRequest((b) => b
                          ..password = password
                          ..userName = mail);
                        try {
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
                              context.go("/market/pending_requests");
                            } else {
                              //maybe dont if else just try and catch anything in below
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
                        } catch (e) {
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
                      }
                    },
                  ),
            Center(
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: kHighlightText,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go("/sign_up");
                        }),
                ]),
              ),
            ),
          ]),
    );
    if (screenSize.width < 1130) {
      scaffoldChild = Center(
        child: formContainer,
      );
    } else {
      scaffoldChild = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: BasicDemo()),
              ],
            ),
          ),
          formContainer,
        ],
      );
    }
    return Scaffold(
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
            child: scaffoldChild));
  }
}

class BasicDemo extends StatelessWidget {
  const BasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    double fontSize = 25;
    List<Widget> list = [
      const Text(
        "Welcome to BilCo",
        style: TextStyle(
            fontFamily: 'Lato', fontWeight: FontWeight.w700, fontSize: 90),
      ),
      const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "In BilCo, You Can...",
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 60),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleIcon(
                  assetImage: "assets/second_hand_sale.jpeg",
                  text: "Second Hand Sale"),
              CircleIcon(assetImage: "assets/borrow.png", text: "Borrow"),
              CircleIcon(
                  assetImage: "assets/lost_and_found.jpeg", text: "Lost and Found"),
              CircleIcon(assetImage: "assets/donate.jpeg", text: "Donate")
            ],
          ),
        ],
      ),
      const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/why_bilco.png"),
            radius: 180,
            backgroundColor: kPrimaryColor,
          ),
          Text(
            "Why BilCo?",
            style: TextStyle(
                fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 60),
          )
        ],
      ),
      TextColumn(fontSize: fontSize)
    ];
    return CarouselSlider(
      options: CarouselOptions(
          scrollDirection: Axis.vertical,
          autoPlay: true,
          enlargeCenterPage: true),
      items: list
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 45.0),
                child: Container(
                  child: Center(child: item),
                ),
              ))
          .toList(),
    );
  }
}

class TextColumn extends StatelessWidget {
  const TextColumn({
    super.key,
    required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "BilCo is...",
          style: TextStyle(
              fontFamily: 'Lato', fontSize: 35, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Comunity Centric",
          style: TextStyle(
              fontFamily: 'Lato', fontSize: 35, fontWeight: FontWeight.bold),
        ),
        RichText(
          text: TextSpan(
              text: "BilCo is exclusively for ",
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: fontSize,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "Bilkent University members",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: kSecondaryColor,
                        fontSize: fontSize)),
                TextSpan(
                  text:
                      ", ensuring a focused and tightly-knit community experience.",
                  style: TextStyle(fontFamily: 'Lato', fontSize: fontSize),
                )
              ]),
        ),
        const Text(
          "Sustainability",
          style: TextStyle(
              fontFamily: 'Lato', fontSize: 35, fontWeight: FontWeight.bold),
        ),
        RichText(
          text: TextSpan(
              text:
                  "By encouraging the reuse and sharing of items, BilCo promotes ",
              style: TextStyle(fontFamily: 'Lato', fontSize: fontSize),
              children: <TextSpan>[
                TextSpan(
                    text: "sustainability ",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: kSecondaryColor,
                        fontSize: fontSize)),
                TextSpan(
                  text: "and ",
                  style: TextStyle(fontFamily: 'Lato', fontSize: fontSize),
                ),
                TextSpan(
                    text: "responsible consumption",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: kSecondaryColor,
                        fontSize: fontSize))
              ]),
        ),
        const Text(
          "Convenience",
          style: TextStyle(
              fontFamily: 'Lato', fontSize: 35, fontWeight: FontWeight.bold),
        ),
        RichText(
          text: TextSpan(
              text:
                  "It simplifies transactions, reduces the stress of finding lost items, and fosters a ",
              style: TextStyle(fontFamily: 'Lato', fontSize: fontSize),
              children: [
                TextSpan(
                    text: "culture of giving ",
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: kSecondaryColor,
                        fontSize: fontSize)),
                TextSpan(
                  text: "within the university",
                  style: TextStyle(fontFamily: 'Lato', fontSize: fontSize),
                ),
              ]),
        ),
      ],
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.assetImage,
    required this.text,
  });
  final String assetImage;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(assetImage),
          backgroundColor: kTitleColor,
          radius: 50,
        ),
        Text(
          text,
          style: const TextStyle(
              fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
