import 'dart:js';
import 'dart:math';
import 'package:bil_co/ApiSingleton.dart';
import 'package:bil_co/Authorization.dart';
import 'package:flutter/material.dart';
import 'package:bil_co/reusable_components/buttons.dart';
import 'package:bil_co/constants.dart';
import 'package:bil_co/second_hand_sale.dart';
import 'package:bil_co/sale_components.dart';
import 'package:bil_co/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

import '../GenericCard.dart';

class HeaderPanel extends StatelessWidget {
  bool isMobile = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: _width / right_left_page_spacing,
          vertical: isMobile ? 30 : 10),
      child: Column(
        children: [
          // Mevcut içerik
          isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [LeftSidePanel(), RightSidePanel(context)],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [LeftSidePanel(), RightSidePanel(context)],
                ),
          // CustomSearchBar ekleniyor
          SizedBox(height: 20), // 20 piksel boşluk
        ],
      ),
    );
  }

  Widget LeftSidePanel() =>
      const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text('BilCo.',
            style: TextStyle(
                fontSize: 25,
                color: kTitleColor,
                fontWeight: FontWeight.w800,
                letterSpacing: .5)),
      ]);

  Widget RightSidePanel(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButtons('About Us', kTitleColor, () {
          print("button pressed");
        }),
        TextButton(
            onPressed: () {},
            child: TextButtons('Shop', kTitleColor, () {
              print("button pressed");
            }))
      ]);
}

// --------------------------------------------- Profile Part -------------------------------
class ProfileInfo extends StatefulWidget {
  List<GenericCard> loadedGenericCards;

  ProfileInfo({super.key, required this.loadedGenericCards});

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String data = '';
  bool isMobile = false;
  int columns = 4;
  bool isProductsLoading = false;
  int shownCardNumber=4;

  bool hasMore = true;//TODO add maximum amount of cards needed
  @override
  Widget build(BuildContext context) {
    int maximumCard = widget.loadedGenericCards.length;
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of columns based on screen width
    int columns ;
    if (screenWidth < 600) {
      // Example breakpoint for small screens
      columns = 1;
    } else if (screenWidth < 900) {
      // Example breakpoint for medium screens
      columns = 2;
    } else {
      columns = 4; // Default value passed to the widget
    }
    hasMore = shownCardNumber < maximumCard;
    return (isProductsLoading)
        ? const Center(
            // Display a spinner or loading indicator
            child: CircularProgressIndicator(),
          )
        : Container(
            child: Column(children: [
            /// card header
            Container(
                width: double.infinity,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SocialValue('Ongoings', 0),
                  SocialValue('Completed Purchases', 10),
                  SocialValue('Completed Sales', 86)
                ])),
            //SizedBox(height: isMobile ? 20 : 50),
            /// description
            Divider(height: 30, thickness: 1, color: Colors.grey[300]),
            Text('$data',
                style: TextStyle(color: Colors.grey[900], fontSize: 12)),
            SingleChildScrollView(child:Container(
              child: ProfileItemGrid(
                cardNumber: shownCardNumber,
                columnNo: columns,
                genericCards: widget.loadedGenericCards,
              ),
            )
            ),


            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  hasMore = shownCardNumber < maximumCard;
                  print(hasMore);
                  if (hasMore) {
                    shownCardNumber += columns;
                  } else if ((shownCardNumber - columns) > 0)
                    shownCardNumber -= columns;
                  hasMore = shownCardNumber < maximumCard;

                });
                print("button pressed");
              },
              child: hasMore
                  ? Text('Show more', style: TextStyle(color: Colors.green))
                  : Text('Show Products'),
            ),
          ]));
  }

  Widget SocialValue(String label, int value) => Container(
      // ... same as before ...
      );
}

// --------------------------------------------- Profile Part -------------------------------

//Itemgrid
class ProfileItemGrid extends StatelessWidget {
  final int cardNumber;
  final int columnNo;
  final List<GenericCard> genericCards;

  const ProfileItemGrid({
    required this.cardNumber,
    required this.columnNo,
    required this.genericCards,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure itemCount does not exceed the length of genericCards
    int itemCount = min(cardNumber, genericCards.length);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnNo, // Number of columns
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemCount, // Use the limited item count
      itemBuilder: (context, index) {
        return genericCards[index];
      },
    );
  }
}

/*
class PItemGrid extends StatelessWidget {
  const PItemGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
      ),
      itemBuilder: (context, index) {
        return GenericCardA(
            header: 'Product Name',
            description: 'This is the product description.',
            imageProviders: [
              AssetImage('assets/borrow.png'),
              AssetImage('assets/donate.jpeg'),
              AssetImage('assets/image.jpeg'),
            ]);
      },
    );

      padding: EdgeInsets.all(5),
      height: 50,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$value',
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text(label,
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ]));
}
*/
class ProfileCard extends StatelessWidget {
  final PostApi getPostAPI = AuthorizedAPISingleton.instance.getPostApi();
  final List<GenericCard> _posts = [];
  @override
  Widget build(BuildContext context) {
    bool is_mobile = false;
    double _width = MediaQuery.of(context).size.width;
    getPostAPI.postsFuzzyGet(userId: Authorization.userId).then((value) {
      for (int a = 0; a < value.data!.data!.length; a++) {
        _posts.add(GenericCard(post: value.data!.data![a]));
      }
    });

    /// card
    return Container(
      width: _width,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.fromLTRB(10, is_mobile ? 80 : 20, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ProfileInfo(loadedGenericCards: this._posts),
    );
  }
}

class ProfilePanel extends StatelessWidget {
  ProfilePanel({super.key, required this.userDTO});
  final UserDTO userDTO;
  String? userIdAuth = Authorization.userId;

  @override
  Widget build(BuildContext context) {
    bool isMobile = false;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          isMobile ? 15 : _width / right_left_page_spacing,
          isMobile ? 0 : 150,
          isMobile ? 15 : _width / right_left_page_spacing,
          10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: ProfileImage(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.school, size: 20, color: Colors.grey[400]),
                  SizedBox(width: 10),
                  Text(
                      (userDTO.firstName ?? "") +
                          " " +
                          (userDTO.lastName ?? ""),
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ]),
          ),
          SizedBox(height: 8),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.mail, size: 20, color: Colors.grey[400]),
                SizedBox(width: 10),
                Text(userDTO.userName ?? "",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 12,
                        fontWeight: FontWeight.bold))
              ]),
          SizedBox(height: 8),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone, size: 20, color: Colors.grey[400]),
                SizedBox(width: 10),
                Text(this.userDTO.phoneNumber ?? "",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 12,
                        fontWeight: FontWeight.bold))
              ]),
          /* SizedBox(height: 8) ,
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.numbers, size: 20, color: Colors.grey[400]),
                SizedBox(width: 10),
                Text('22102544',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 12,
                        fontWeight: FontWeight.bold))
              ]),
              */
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                const Icon(Icons.edit, size: 20, color: kFormButtonColor),
                TextButtons('Edit Profile Info', kFormButtonColor!, () {
                  context.go("/edit_user_info/$userIdAuth");
                })
              ]),
          ProfileCard()
        ],
      ),
    );
  }

  Widget ProfileImage() {
    if(this.userDTO.userImage != null) {
      return CircleAvatar(maxRadius: 70, foregroundImage: NetworkImage((userDTO.userImage!.imageUrl ?? "https://images.assetsdelivery.com/compings_v2/yehorlisnyi/yehorlisnyi2104/yehorlisnyi210400016.jpg")));
    }
    return CircleAvatar(radius: 70, backgroundColor: Colors.white10);
  }
}

/*
The Widget after Completed Sales
 */
Widget MiddlePart() => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          newRow(Icon(Icons.phone), "+90", 'Change Number'),
          Row(),
          newRow(Icon(Icons.shop), 'Items on Sale', 'Go to items on sale'),
          Row(),
          newRow(
              Icon(Icons.shopping_bag), 'Items Bought', 'Go to items bought'),
          newRow(Icon(Icons.logout), 'Log out of account', 'Log out'),
        ],
      ),
    );
Widget newRow(Icon anIcon, String pText, String sText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Row(
          children: [anIcon, SizedBox(width: 5), Text(pText)],
        ),
      ),
      TextButtons(sText, kPrimaryColor, () {
        print("button pressed");
      })
    ],
  );
}

// -------------------------------------------------------- BOTTOM PART --------------------------
class OtherResources extends StatelessWidget {
  final bool isMobile;

  OtherResources({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('OTHER RESOURCES',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: isMobile ? 10 : 12,
                fontWeight: FontWeight.bold)),
        TextButtons('Terms & Conditions', kTextColor, () {
          print("button pressed");
        }),
        TextButtons('Privacy Policy', kTextColor, () {
          print("button pressed");
        }),
        TextButtons('Contact Us', kTextColor, () {
          print("button pressed");
        }),
      ],
    );
  }
}

class SocialNetwork extends StatelessWidget {
  final bool isMobile;

  SocialNetwork({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    double r = 20;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text('Start your campus life with',
            style: TextStyle(color: Colors.grey[900], fontSize: 10)),
        Text('BILCO !',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 12,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/second_hand_sale.jpeg'),
              backgroundColor: kTitleColor,
              radius: r,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/borrow.png'),
              backgroundColor: kTitleColor,
              radius: 20,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/donate.jpeg'),
              backgroundColor: kTitleColor,
              radius: 20,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/lost_and_found.jpeg'),
              backgroundColor: kTitleColor,
              radius: 20,
            ),
          ],
        )
      ]),
    );
  }
}

class WebInfo extends StatelessWidget {
  final bool isMobile;

  WebInfo({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: isMobile
          ? OtherResources()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtherResources(),
              ],
            ),
    );
  }
}

class FooterPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool isMobile = false;

    return Container(
      margin: EdgeInsets.all(_width / right_left_page_spacing),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SocialNetwork(isMobile: isMobile),
                WebInfo(isMobile: isMobile),
              ],
            )
          : Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.0), // Sol taraftaki widget için padding
                  child: SocialNetwork(isMobile: isMobile),
                ),
                Expanded(child: Container()), // Ortadaki boşluk
                Padding(
                  padding: EdgeInsets.only(
                      right: 20.0), // Sağ taraftaki widget için padding
                  child: WebInfo(isMobile: isMobile),
                ),
              ],
            ),
    );
  }
}
/*
class GenericCardA extends StatefulWidget {
  final String header;
  final String description;
  final List<ImageProvider> imageProviders; // Keep the list of images
  final Color backgroundColor;

  GenericCardA({
    required this.header,
    required this.description,
    required this.imageProviders,
    this.backgroundColor = Colors.white,
  });

  @override
  _GenericCardAState createState() => _GenericCardAState();
}

class _GenericCardAState extends State<GenericCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.header,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

           */
          Expanded(
            child: Image(
              image:
                  widget.imageProviders.first, // Display only the first image
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

}

 */
