import 'package:bil_co/constants.dart';
import 'package:bil_co/product_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class GenericCard extends StatefulWidget {
  final PostDTO post;
  final Color backgroundColor;
  final bool isSecurity;

  GenericCard({
    this.backgroundColor = Colors.white, required this.post, this.isSecurity=false,
  });

  @override
  _GenericCardState createState() => _GenericCardState();
}

/*
class GenericCard extends StatefulWidget {
  final String header;
  final String price;
  final String date;
  final String owner;
  final String description;
  final List<ImageProvider> imageProviders; // Keep the list of images
  final Color backgroundColor;

  GenericCard({
    required this.header,
    required this.price,
    required this.date,
    required this.owner,
    required this.description,
    required this.imageProviders,
    this.backgroundColor = Colors.white,
  });

  @override
  _GenericCardState createState() => _GenericCardState();
}
*/
class _GenericCardState extends State<GenericCard> {
  @override
  Widget build(BuildContext context) {
    String id = widget.post.id??"";
    return  InkWell(
      onTap:  (){
        context.go("/post_details/$id", extra: widget.isSecurity);
      },
      child: Card(
        color: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              alignment: Alignment.center, // Resmi merkeze hizala
              child: /*Image(
                image: widget.imageProviders.first,
                fit: BoxFit.cover,
              ),*/
              Image.network(widget.post.postImage?.imageUrl ?? "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg"),
      ),
            Divider(height: 10, thickness: 1, color: Colors.grey[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Çocukları sağa ve sola yasla
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    //widget.header,
                    widget.post.title??"",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor, // Arka plan rengi
                      borderRadius: BorderRadius.circular(10.0), // Köşeleri daire şeklinde yap
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      //"technology",
                      widget.post.tags??"", // TODO: tag array mi tek bir string mi?
                      style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white), // Metin rengi
                    ),
                  ),
                ),
              ],
            ),
            if(widget.post.postType==0||widget.post.postType==1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Price: " +  widget.post.price.toString()  + " ₺",
                    //widget.price
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Posted on: " +(widget.post.created?.toString().substring(0,widget.post.created!.toString().indexOf("Z")-4) ?? ""),//widget.date,
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                Divider(height: 10, thickness: 1, color: Colors.grey[300]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    //widget.description,
                    widget.post.body??"",overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),

            /*Expanded(
              child: Image.network(widget.post.postImage?.imageUrl ?? "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.post.body??"",
                style: const TextStyle(fontSize: 16),
              ),
            ),*/

          ],
        ),
      ),
    );
  }
}
