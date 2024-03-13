import 'dart:async';
import 'package:bil_co/ApiSingleton.dart';
import 'package:bil_co/GenericCard.dart';
import 'package:bil_co/components/ErrorDisplayComponents.dart';
import 'package:bil_co/constants.dart';
import 'package:bil_co/sale_components.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Authorization.dart';
import 'EditPostPageArguments.dart';
import 'package:openapi/openapi.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'components/message_components.dart';
import 'fetch_data.dart';

class SecondHandSale extends StatefulWidget {
  const SecondHandSale({super.key, required this.pageType, required this.search,});
  final int pageType;
  final String search;
  State<SecondHandSale> createState() => _SecondHandSaleState();
}

/*
Messages
 */
class _SecondHandSaleState extends State<SecondHandSale>
    with TickerProviderStateMixin {
  bool isLoading = false;
  @override
  @override
  void initState() {
    super.initState();
    isLoading = true;
    Authorization.getUserId().then((value) {
      setState(() {
        isLoading = false;
        // userId = value??"";
        Authorization.userId = value;
      });
    });
  }

  bool onScreen = false;
  @override
  Widget build(BuildContext context) {
    String tags="";
    String min ="";
    String max="";
    String search = widget.search;
    if(widget.search!=""){
     tags = widget.search.substring(widget.search.indexOf("tags=")+5,widget.search.indexOf("?min"));
     min = widget.search.substring(widget.search.indexOf("min=")+4,widget.search.indexOf("?max"));
     max = widget.search.substring(widget.search.indexOf("max=")+4);
     search = widget.search.substring(0,widget.search.indexOf("?tags="));
    }
    int postType=0;
    if(widget.pageType==0) {
      postType = 0;
    } else if (widget.pageType == 1)
      postType = 1;
    else if (widget.pageType == 2)
      postType = 2;
    else if (widget.pageType == 3) postType = 3;
    return Scaffold(
      body: PageLayout(postType: postType,search: search, tags: tags,max: max,min:min,),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Center(
                    child: Text(
                  "Messages",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                )),
              ),
              height: 103,
              width: double.infinity,
              color: kAppBarColor,
            ),
            Container(child: MessagesSection())
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              buttonStyleData: const ButtonStyleData(
                  decoration: BoxDecoration(shape: BoxShape.circle)),
              customButton: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5),
                child: Icon(
                  Icons.person,
                  color: kIconColor,
                ),
              ),
              items: [
                ...MenuItems.firstItems.map(
                  (item) => DropdownMenuItem<MenuItem>(
                    value: item,
                    child: MenuItems.buildItem(item),
                  ),
                ),
                const DropdownMenuItem<Divider>(
                    enabled: false, child: Divider()),
                ...MenuItems.secondItems.map(
                  (item) => DropdownMenuItem<MenuItem>(
                    value: item,
                    child: MenuItems.buildItem(item),
                  ),
                ),
              ],
              onChanged: (value) {
                MenuItems.onChanged(context, value! as MenuItem);
              },
              dropdownStyleData: DropdownStyleData(
                width: 160,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kAppBarColor,
                ),
                offset: const Offset(0, 8),
              ),
              menuItemStyleData: MenuItemStyleData(
                customHeights: [
                  ...List<double>.filled(MenuItems.firstItems.length, 48),
                  8,
                  ...List<double>.filled(MenuItems.secondItems.length, 48),
                ],
                padding: const EdgeInsets.only(left: 16, right: 16),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                context.go("/create_post");
                /*
                String a = Uri(path: 'posts/123123',queryParameters: {'mode':'add'}).toString();
                String b = "posts/123?mode=add";
                context.go(b);


                Navigator.of(context).pushNamed('/edit_post',
                    arguments: EditPostPageArguments(
                        mode: 'edit_post', postId: '123'));*/
              },
              icon: const Icon(
                Icons.add_circle_rounded,
                color: kIconColor,
              ),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 25)),
          Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(
                  Icons.message_sharp,
                  color: kIconColor,
                )),
          )
        ],
        backgroundColor: kAppBarColor,
        title: const Text("BilCo.",
            style: TextStyle(
              color: kTitleColor,
              fontWeight: FontWeight.w700,
            )),
        bottom: PreferredSize(preferredSize: Size(double.infinity, 100), child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClickableText(text: "Second Hand Sale",isChosen: widget.pageType==0,onTap:(){context.go("/market/second_hand_sale");} ),
            ClickableText(text: "Borrow",isChosen: widget.pageType==1,onTap:(){context.go("/market/borrow");}),
            ClickableText(text: "Donation",isChosen: widget.pageType==2, onTap:(){context.go("/market/donation");}),
            ClickableText(text: "Lost & Found",isChosen: widget.pageType==3, onTap:(){context.go("/market/lost_and_found");}),
          ],
        )),

      ),
    );
  }
}

class PageLayout extends StatefulWidget {
  PageLayout({
    super.key,
    this.onScreen = false, required this.postType, required this.search, required this.tags, required this.min, required this.max,
  });
  final String? search;
  final String tags;
  bool onScreen;
  final int postType;
  final String min;
  final String max;

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  @override
  Widget build(BuildContext context) {
    String min = widget.min;
    String max = widget.max;
    String search = widget.search??"";
    String tags = widget.tags;
    String? searchbartitle;
    if(search=="") {
      searchbartitle = "Search";
    } else if(search.indexOf("?")==-1) searchbartitle = search;
    else {searchbartitle =search.substring(0,search.indexOf("?"));    }
    final ScrollController scrollController = ScrollController();
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if (screenSize.width > kMobileWidthThreshold)
             FilterContainer(
               max: max,
              min: min,
              tags: tags,
              search: search??"",
              postType: widget.postType,
              title: 'Filters',
              children: [],
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                        Expanded(child: CustomSearchBar(searchbartitle, onChanged: (value) {
                          setState(() {
                            search=value;
                          });
                        },onSubmitted: (String value) {
                          setState(() {
                            search = value;
                          });
                          if(widget.postType==0) {
                            context.go("/market/second_hand_sale?search=$value?tags=$tags?min=$min?max=$max",);
                           Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SecondHandSale(pageType: 0, search: "$value?tags=$tags?min=$min?max=$max"),
                                maintainState: false,
                              ),
                            );
                          } else  if(widget.postType==1) {context.go("/market/borrow?search=$value?tags=$tags?min=$min?max=$max",);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SecondHandSale(pageType: 1, search: "$value?tags=$tags?min=$min?max=$max"),
                              maintainState: false,
                            ),
                          );}
                          else  if(widget.postType==2){ context.go("/market/donation?search=$value?tags=$tags?min=$min?max=$max",);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SecondHandSale(pageType: 2, search: "$value?tags=$tags?min=$min?max=$max"),
                              maintainState: false,
                            ),
                          );}
                          else  if(widget.postType==3) {context.go("/market/lost_and_found?search=$value?tags=$tags?min=$min?max=$max");Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SecondHandSale(pageType: 3, search: "$value?tags=$tags?min=$min?max=$max"),
                              maintainState: false,
                            ),
                          );}

                        },)),
                      if (screenSize.width <= kMobileWidthThreshold)
                        IconButton(
                          tooltip: "Filters",
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  child: Center(
                                    child: FilterContainer(
                                      max: max,
                                      min: min,
                                      tags: tags,
                                      search: search,
                                      postType: widget.postType,
                                      title: "Filters",
                                      children: [
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.list_alt_sharp),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: kScaffoldColor,
                        child: ItemGrid(
                          fetchDataFunction: fetchData,
                          scrollController: scrollController,
                          title: widget.search??"",
                          postType: widget.postType,
                          tags: widget.tags, min: widget.min, max: widget.max,lostStatus: widget.postType==3? 1 : null,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

typedef FetchDataFunction = Future<List<dynamic>> Function(
    int currentPage, int pageSize, int postType, String title, String tags,String min, String max, int? pending);

class ItemGrid extends StatefulWidget {
  final ScrollController scrollController;
  final FetchDataFunction fetchDataFunction;
  final int postType;
  final String title;
  final String tags;
  final String min;
  final String max;
  final int? lostStatus;
  const ItemGrid(
      {Key? key,
      required this.scrollController,
      required this.fetchDataFunction, required this.postType, required this.title, required this.tags, required this.min, required this.max, this.lostStatus})
      : super(key: key);

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  final List<dynamic> _currentItems = [];
  int _currentPage = 1;
  final StreamController<List<dynamic>> _dataStreamController =
      StreamController<List<dynamic>>();
  Stream<List<dynamic>> get dataStream => _dataStreamController.stream;

  final int _pageSize = 6;
  late final ScrollController _scrollController;
  bool _isFetchingData = false;
  Future<void> _fetchPaginatedData() async {
    if (_isFetchingData) {
      // Avoid fetching new data while already fetching
      return;
    }
    try {
      _isFetchingData = true;
      setState(() {});

      final startTime = DateTime.now();

      final items = await widget.fetchDataFunction(
        _currentPage,
        _pageSize,
        widget.postType,
        widget.title,
        widget.tags,
          widget.max,
        widget.min,
        widget.lostStatus
      );

      _currentItems.addAll(items);

      // Add the updated list to the stream without overwriting the previous data
      final endTime = DateTime.now();
      final timeDifference =
          endTime.millisecondsSinceEpoch - startTime.millisecondsSinceEpoch;

      if (timeDifference < 2000) {
        // Delay for 2 seconds if the time taken by the API request is less then 2 seconds
        await Future. delayed(const Duration(milliseconds: 2000));
      }
      _dataStreamController.add(_currentItems);
      _currentPage++;
    } catch (e) {
      _dataStreamController.addError(e);
    } finally {
      // Set to false when data fetching is complete
      _isFetchingData = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = widget.scrollController;
    _fetchPaginatedData();
    _scrollController.addListener(() {
      _scrollController.addListener(() {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;

        if (currentScroll == maxScroll) {
          // When the last item is fully visible, load the next page.
          _fetchPaginatedData();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
      stream: dataStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return ErrorDisplayComponents(
            snackBarTitle: 'Oh, Snap!',
            snackBarWiring:
                'The page you are currently trying to open could not be loaded properly, please try again',
            imagePath: 'assets/dalle4.png',
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Display a message when there is no data
          return const ErrorDisplayComponents(
            snackBarTitle: ':(',
            snackBarWiring: 'There are no items currently',
            imagePath: 'assets/dalle5.png',
          );
        } else {
          // Display the paginated data
          final items = snapshot.data;
          return ListView(
            controller: _scrollController,
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items!.length,
                  itemBuilder: (context, index) {
                    return GenericCard(
                      post: items[index] as PostDTO,
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 600)),
              if (_isFetchingData)
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )),
            ],
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _dataStreamController.close();
    //we do not have control cover the _scrollController so it should not be disposed here
    // _scrollController.dispose();
    super.dispose();
  }
}
/* if (widget.onScreen)  const FilterContainer(
                  title: 'Filters',
                  children: [

                  ],
                ),*/

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [profile];
  static const List<MenuItem> secondItems = [logout];

  static const profile = MenuItem(text: 'Profile', icon: Icons.person);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: kIconColor, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: kIconColor,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.profile:
        //Do something
        String userId = Authorization.userId ?? "";
        context.go("/profile_page/$userId");
        break;
      case MenuItems.logout:
        final userId = Authorization.userId;
        Authorization.userId = null;
        Authorization.jwtToken = null;
        Authorization.refreshToken = null;
        AuthorizedAPISingleton.instance.getAuthApi().apiAuthRevokePost(userId: userId).then((value){
          Authorization.nukeTokens().then((value){
            context.go("/");
          });
        });
        break;
    }
  }
}

class CustomSearchBar extends StatefulWidget {
  final String hint_text;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  const CustomSearchBar(this.hint_text, {Key? key, required this.onSubmitted, this.onChanged}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.hint_text);
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      hintText: "Search",
      leading: const Icon(Icons.search),
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
    );
  }
}
