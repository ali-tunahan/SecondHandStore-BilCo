import 'package:bil_co/constants.dart';
import 'package:bil_co/form_components.dart';
import 'package:bil_co/second_hand_sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class FilterContainer extends StatefulWidget {
   FilterContainer(
      {super.key, required this.children, required this.title, required this.postType, required this.search, required this.tags, required this.min, required this.max});
  final List<Widget> children;
  final String title;
   final int postType;
   final String search;
   final String tags;
   final String min;
   final String max;
  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    String value1="";
    String value2="";
    Size screenSize = MediaQuery.of(context).size;
    double size;
    String? search = widget.search;
    String tags = widget.tags;
    if ( screenSize.width>kMobileWidthThreshold){
      size= 170;
    }else {
      size = screenSize.width;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      child: Container(
          width: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey, // Siyah renkli border
              width: 0.5, // Border kalınlığı
            ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1 , color: Colors.grey)
                  ),
            color: Colors.transparent,
            boxShadow: [
            ],)
          ),
          
            SearchableFilterChips(allFilters: allFilters, label: "Tags", onSaved: (value) {
              tags = value;
            },
            onChanged: (value){
              tags = value;
            }, alreadySelected: tags,),
            if(widget.postType==0||widget.postType==1)
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(

                  width: 70,
                  child: TextFormField(
                    initialValue: widget.min=="-1"||widget.min==""? null : widget.min,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(

                      suffix: Text("₺"),
                      hintText: "Min Price:",
                      hintStyle: TextStyle(
                        fontSize: 12
                      )
                    ),
                    onChanged: (value) {
                      if(!isNumber(value)) {
                        value="";
                      }
                      value1=value;
                    },
                  ),
                ),
                Container(
                  width: 70,
                  child: TextFormField(
                    initialValue: widget.max=="-1"||widget.max==""?  null : widget.max,
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          suffix: Text("₺"),
                          hintText: "Max Price:",
                          hintStyle: TextStyle(
                              fontSize: 12
                          )
                      ),
                    onChanged: (value) {
                      value2=value;
                    },
                  ),
                )
              ],
            ),
            FormButton(hintText: "Filter", onPressed: (){

              if(widget.postType==0) {
                context.go("/market/second_hand_sale?search=$search?tags=$tags?min=$value1?max=$value2",);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecondHandSale(pageType: 0, search: "$search?tags=$tags?min=$value1?max=$value2",),
                    maintainState: false,
                  ),
                );
              } else  if(widget.postType==1) {context.go("/market/borrow?search=$search?tags=$tags?min=-1?max=-1",);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondHandSale(pageType: 1, search: "$search?tags=$tags?min=-1?max=-1",),
                  maintainState: false,
                ),
              );}
              else  if(widget.postType==2){ context.go("/market/donation?search=$search?tags=$tags?min=-1?max=-1",);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondHandSale(pageType: 2, search: "$search?tags=$tags?min=-1?max=-1",),
                  maintainState: false,
                ),
              );}
              else  if(widget.postType==3) {context.go("/market/lost_and_found?search=$search?tags=$tags?min=-1?max=-1");Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondHandSale(pageType: 3, search: "$search?tags=$tags?min=-1?max=-1",),
                  maintainState: false,
                ),
              );}
            })


          ]
        )
      ),
    );
  }

  bool isNumber(String value) {
    if(value == null) {
      return true;
    }
    final n = num.tryParse(value);
    return n!= null;
  }
}

class ClickableText extends StatefulWidget {
  const ClickableText({
    super.key,
    required this.text,
    required this.isChosen,
    this.onTap,
  });
  final String text;
  final bool isChosen;
  final Function()? onTap;

  @override
  State<ClickableText> createState() => _ClickableTextState();
}

class _ClickableTextState extends State<ClickableText> {
  Color color = kTextColor;
  FontWeight fontWeight = FontWeight.w400;
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    if (widget.isChosen) fontWeight = FontWeight.w700;
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MouseRegion(
            onEnter: (event) {
              setState(() {
                color = kHighlightText;
                isHovering = true;
              });
            },
            onExit: (event) {
              setState(() {
                color = kTextColor;
                isHovering = false;
              });
            },
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: isHovering ? 25 : 16,
                    fontWeight: fontWeight),
                child: Text(widget.text),
              ),
            )),
      ),
    );
  }
}
