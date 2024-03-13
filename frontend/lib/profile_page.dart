import 'package:animated_background/animated_background.dart';
import 'package:bil_co/ApiSingleton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bil_co/components/profile_page_components.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

import 'constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userId});
  final String userId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool isProfileLoading = false;
  late AuthApi _authApi;
  late UserDTO userDetailsDTO;
  String name = "";
  String? id = "";
  String? image = "";
  @override
  void initState() {
    super.initState();
    isProfileLoading = true;
    _authApi = AuthorizedAPISingleton.instance.getAuthApi();
    _authApi.apiAuthIdGet(id: widget.userId).then((value) {
      userDetailsDTO = value.data ?? UserDTO();
      setState(() {
        isProfileLoading = false;
        name = ((userDetailsDTO.firstName) ?? "") +
            (userDetailsDTO.lastName ?? "");
        id = userDetailsDTO.id;
        image = userDetailsDTO.userImage?.imageUrl;
        //Image.network(widget.title?? ""),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Widget scaffoldChild;
    return (isProfileLoading)
        ? const Center(
            // Display a spinner or loading indicator
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              actions: <Widget>[],
              title: Text('Profile', style: ProfilePageTextStyle()),
              leadingWidth: 100,
              leading: TextButton(
                onPressed: () => context.go("/market/second_hand_sale"),
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
                        //HeaderPanel(),
                        ProfilePanel(
                          userDTO: userDetailsDTO,
                        ),
                        FooterPanel()
                      ]), //Headerpanel silindi
                )
              ])),
            ));
  }

  TextStyle ProfilePageTextStyle() {
    return const TextStyle(
        fontFamily: 'Lato',
        fontSize: 25,
        color: kTitleColor,
        fontWeight: FontWeight.w800,
        letterSpacing: .5);
  }
}
