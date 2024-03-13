import 'package:animated_background/animated_background.dart';
import 'package:bil_co/ApiSingleton.dart';
import 'package:bil_co/components/product_page_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bil_co/components/profile_page_components.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

import 'components/product_page_components2.dart';
import 'constants.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.productId,  this.isSecurity=false});
  final String productId;
  final bool isSecurity;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  PostDetailsDTO postDetailsDTO = PostDetailsDTO();
  UserDTO userDTO = UserDTO();
  @override
  void initState() {
    super.initState();
    isLoading = true;
    AuthorizedAPISingleton.instance.getPostApi().postsIdGet(id: widget.productId).then((value) {
      setState(() {
        postDetailsDTO = value.data ?? PostDetailsDTO();
        AuthorizedAPISingleton.instance.getAuthApi().apiAuthIdGet(id: postDetailsDTO.userId ?? "").then((value){
            userDTO = value.data ?? UserDTO();
            setState(() {
              isLoading = false;
            });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (isLoading)
        return const Center(child: CircularProgressIndicator());
      else{
        Widget child =ProductPanel(post: postDetailsDTO, userDTO: userDTO,);
        if(postDetailsDTO.postType==3 && widget.isSecurity ) child = ProductPanel2(post: postDetailsDTO,isSecurity: widget.isSecurity, userDTO: userDTO,);
        else if(postDetailsDTO.postType==3){
          child = ProductPanel2(post: postDetailsDTO, userDTO: userDTO,);
        }
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Text('Product Details', style: ProfilePageTextStyle()),
              leadingWidth: 100,
              leading: TextButton(
                onPressed: () {
                  if(widget.isSecurity)
                    context.go("/market/pending_requests");
                  else  context.go("/market/second_hand_sale");
                } ,
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
              child: Container(
                child: child,
              ),
            ));}
      ;
    });
  }
}

TextStyle ProfilePageTextStyle() {
  return TextStyle(
      fontSize: 25,
      color: kTitleColor,
      fontWeight: FontWeight.w800,
      letterSpacing: .5);
}
