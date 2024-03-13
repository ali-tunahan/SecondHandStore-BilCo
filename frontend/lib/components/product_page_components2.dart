import 'package:bil_co/ApiSingleton.dart';
import 'package:bil_co/components/message_components.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';
import '../reusable_components/buttons.dart';
import 'profile_page_components.dart';
import '../constants.dart';

class ProductPanel2 extends StatefulWidget {
  const ProductPanel2({super.key, required this.post,  this.isSecurity=false, required this.userDTO});
  final PostDetailsDTO post;
  final bool isSecurity;
  final UserDTO userDTO;
  @override
  State<ProductPanel2> createState() => _ProductPanel2State();
}

class _ProductPanel2State extends State<ProductPanel2> {
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    List<PostImage> imageUrls = widget.post.postImages!.asList();
    double screenWidth = MediaQuery.of(context).size.width;
    double _width = MediaQuery.of(context).size.width;
    List<String> tags = widget.post.tags!.split(",");

    if (screenWidth >= 600) {
      return Container(
        margin: EdgeInsets.all(_width / right_left_page_spacing),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.post.title ?? "", // Title text
                            style: TextStyle(
                              fontSize: 30.0, // Larger font size for title
                              fontWeight: FontWeight
                                  .bold, // Bold font weight for title
                            )),
                      )),
                  Expanded(
                    flex: 5,
                    child: Padding(
                        padding: EdgeInsets.all(
                            30), // Sol taraftaki widget için padding
                        child: Container(
                            width: 400,
                            height: 400,
                            child: (kIsWeb)
                                ? ImageCarouselWithArrows(imageUrls)
                                : ImageCarousel(imageUrls: imageUrls))),
                  ),

                ],
              ),
            ),

            // Ortadaki boşluk
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20.0), // Sağ taraftaki widget için padding
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProfileProductCard((widget.userDTO.firstName ?? "") + " " + (widget.userDTO.lastName ?? ""), widget.userDTO.userImage?.imageUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          ProductDescCard(widget.post.body ?? "Description"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if(widget.post.lostItemState==0&&widget.isSecurity)
                        AcceptButton('Accept', Colors.white, Colors.green,
                            () {
                          AuthorizedAPISingleton.instance.getPostApi().postsIdPut(id: widget.post.id ?? "",updatePostDTO: UpdatePostDTO((b)=>b..id = widget.post.id..postType=widget.post.postType..lostItemState = 1..postImages = null..active..price=widget.post.price..tags=widget.post.tags..body=widget.post.body..title=widget.post.title..created=widget.post.created)).then((value){
                            context.go("/market/pending_requests");
                          });
                        }),
                        if(widget.post.lostItemState==0&&widget.isSecurity)
                        AcceptButton(' Deny ', Colors.white, Colors.red, () {
                          AuthorizedAPISingleton.instance.getPostApi().postsIdPut(id: widget.post.id ?? "",updatePostDTO: UpdatePostDTO((b)=>b..id = widget.post.id..postType=widget.post.postType..lostItemState = 2..postImages = null..active..price=widget.post.price..tags=widget.post.tags..body=widget.post.body..title=widget.post.title..created=widget.post.created)).then((value){
                            context.go("/market/pending_requests");
                          });
                        }),
                        if(widget.post.lostItemState==1&&widget.isSecurity)
                        AcceptButton("Delete Post", Colors.white, Colors.red, () {
                          AuthorizedAPISingleton.instance.getPostApi().postsIdPut(id: widget.post.id ?? "",updatePostDTO: UpdatePostDTO((b)=>b..id = widget.post.id..postType=widget.post.postType..lostItemState = 2..postImages = null..active..price=widget.post.price..tags=widget.post.tags..body=widget.post.body..title=widget.post.title..created=widget.post.created)).then((value){
                            context.go("/market/pending_requests");
                          });
                        })
                      ],
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(_width / right_left_page_spacing),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(45),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.post.title ?? "",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 400,
                height: 400,
                child: (kIsWeb)
                    ? ImageCarouselWithArrows(imageUrls)
                    : ImageCarousel(imageUrls: imageUrls),
              ),
              buildChipsRow(tags),
              ProfileProductCard(widget.post.userId ?? "User Name", "a.png"),
              ProductDescCard(widget.post.body ?? "Description"),
            ],
          ),
        ),
      );
    }
  }

  Padding productChip(String chipText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(chipText),
      ),
    );
  }

  Card ProfileProductCard(String name, String? imageUrl) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 70, foregroundImage: NetworkImage(imageUrl?? "https://images.assetsdelivery.com/compings_v2/yehorlisnyi/yehorlisnyi2104/yehorlisnyi210400016.jpg")),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Background color (red)
                    onPrimary: Colors.white, // Text color (white)
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  // Call your navigation function here
                  final userId = widget.userDTO.id ?? "";
                  context.go("/chat_box/$userId");
                },
                child: Text('Get in contact'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Card ProductDescCard(String description) {
    int price = widget.post.price ?? 0;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChipsRow(List<String> chipTexts) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0, // Space between chips
          children: chipTexts.map((text) => productChip(text)).toList(),
        ),
      ),
    );
  }

  Widget buildImageList(List<String> imageUrls) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          // Call the provided onTap function when the image is tapped
          child: Container(
            margin:
                EdgeInsets.symmetric(horizontal: 5.0), // Space between images
            child: Image.asset(
              imageUrls[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final List<PostImage> imageUrls;

  ImageCarousel({required this.imageUrls});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        autoPlay: false,
        aspectRatio: 16 / 9,
        enlargeCenterPage: false,
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.network(url.imageUrl ?? "", fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }
}

class ImageCarouselWithArrows extends StatefulWidget {
  final List<PostImage> imageUrls;

  ImageCarouselWithArrows(this.imageUrls);

  @override
  _ImageCarouselWithArrowsState createState() =>
      _ImageCarouselWithArrowsState();
}

class _ImageCarouselWithArrowsState extends State<ImageCarouselWithArrows> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.imageUrls.length,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemBuilder: (context, index) {
            return Image.network(
              widget.imageUrls[index].imageUrl ?? "fba",
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          left: 10,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        Positioned(
          right: 10,
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }
}
