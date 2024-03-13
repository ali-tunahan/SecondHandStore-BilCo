import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:typed_data';
import 'dart:typed_data';
import 'package:azblob/azblob.dart';

import 'package:bil_co/ApiSingleton.dart';
import 'package:bil_co/Authorization.dart';
import 'package:bil_co/form_components.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:openapi/openapi.dart';

import 'constants.dart';

/*
  When this page is going to be used for editing the following should be the usage on  the onClicked:
  Navigator.pushNamed(
    context,
    '/edit_post',
    arguments: EditPostPageArguments(mode: 'edit', postId: somePostId),
  );

   */
/*
          public Guid Id { get; set; }
          public bool Active { get; set; }
          public PostType PostType { get; set; }
          public UserDTO? User { get; set; }
          public string? Tags { get; set; }
          public string Title { get; set; }
          public string? Body { get; set; }
          public PostImage? PostImage { get; set; }
          public DateTime? Created { get; set; }
   */
class PostPage extends StatefulWidget {
  final String mode;
  final String? postId;
  List<String>? tags;
  String? title;
  String? body;
  List<Uint8List> imageBytesList = [];
  PostPage({Key? key, required this.mode, this.postId}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState(mode: mode, postId: postId);
}

class _PostPageState extends State<PostPage> {
  final String mode;
  final String? postId;
  _PostPageState({required this.mode, this.postId}) : super();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<dynamic> imageBytesList = [];
  List<String?> imagesUrlList = [];
  late PostApi postService;
  late PostDetailsDTO postDetailsDTO;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  String? body = "";
  String? tags = "";
  String? title = "";
  String? price = "";
  int? borrowDay = null;

  @override
  void initState() {
    super.initState();
    imageBytesList = [];
    isLoading = true;
    postService = AuthorizedAPISingleton.instance.getPostApi();
    if (postId != null && (mode == 'edit')) {
      postService.postsIdGet(id: postId.toString()).then((value) {
        postDetailsDTO = value.data ?? PostDetailsDTO();
        setState(() {
          isLoading = false;
        });
        print(postDetailsDTO);
        body = postDetailsDTO.body ?? "";
        tags = postDetailsDTO.tags ?? "";
        title = postDetailsDTO.title ?? "";
        borrowDay = postDetailsDTO.borrowDay ?? 0;

        if(postDetailsDTO.postImages != null){
          for(var image in  postDetailsDTO.postImages!){
            imagesUrlList.add(image.imageUrl); // TODO Image url may be null
          }
        }
      });
    }
  }

  String selectedFilters = "";
  //Post Data
  int postType = 0;
  List<int> postTypes = [0,1,2,3];

  @override
  Widget build(BuildContext context) {
    Future<void> createPost() async {
      print(Authorization.userId);

      int priceInt = 0;
      try {
        priceInt = int.parse(price!);
      } catch (e) {
        priceInt = 0;
      }

      ListBuilder<String> images = ListBuilder();

      if (kIsWeb) {
        for (int i = 0; i < imageBytesList.length; i++) {
          var image = base64Encode(imageBytesList[i]);
          images.add(image.toString());
        }
      } else {
        // TODO test for android
        for (int i = 0; i < imageBytesList.length; i++) {
          var file = ([imageBytesList[i]] as File);
          var bytes = file.readAsBytesSync();
          String base64Image = base64Encode(bytes).toString();
          images.add(base64Image);
        }
      }
      int? state = null;
      if(postType == 3){
        state = 0;
      }
      int? newBorrowDay = null;
      if(postType == 1){
        newBorrowDay = borrowDay;
      }
      if(postType == 2){
        priceInt = 0;
      }
      CreatePostDTO createPostDTO = CreatePostDTO(
        (b) => b
          ..postImages = images
          ..userId = Authorization.userId
          ..title = title
          ..body = body
          ..postType = postType
          ..price = priceInt
          ..tags = selectedFilters
        ..location = ""
        ..lostItemState = state
        ..borrowDay = newBorrowDay
        ,
      );
      postService.postsPost(createPostDTO: createPostDTO).then((value) {
        final userId = Authorization.userId;
        context.go("/market/second_hand_sale");
      });
    }

    void updatePost() {
      int priceInt = 0;
      try {
        priceInt = int.parse(price!);
      } catch (e) {
        //TODO MUST BE INTEGER
      }

      ListBuilder<String> images = ListBuilder();

      if (kIsWeb) {
        for (int i = 0; i < imageBytesList.length; i++) {
          var image = base64Encode(imageBytesList[i]);
          images.add(image.toString());
        }
      } else {
        // TODO test for android
        for (int i = 0; i < imageBytesList.length; i++) {
          var file = ([imageBytesList[i]] as File);
          var bytes = file.readAsBytesSync();
          String base64Image = base64Encode(bytes).toString();
          images.add(base64Image);
        }
      }
      
      postService.postsIdPut(
          id: postId!,
          updatePostDTO: UpdatePostDTO((builder) => builder
            ..title = _titleController.text
            ..tags = selectedFilters
            ..body = _bodyController.text..price=priceInt..id=postId..active=true..postImages=images));
    }

    final screenSize = MediaQuery.of(context).size;
    final boxWidth = screenSize.width * 0.8;
    final boxHeight = screenSize.height * 0.8;
    final String mode_ = widget.mode;

    String appbarname;
    if (mode_ == 'edit') {
      appbarname = "Edit Post";
    } else {
      appbarname = "Create Post";
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(appbarname, style: ProfilePageTextStyle()),
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {
            //Will go to home page
            context.go("/market/second_hand_sale");
          },
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
            child: (isLoading && mode == 'edit')
                ? const Center(
                    // Display a spinner or loading indicator
                    child:
                        CircularProgressIndicator(), // TODO Ati send progress token
                  )
                : Form(
                    key: _formKey,
                    child: Column(children: [
                      InfoDropdownField(
                        onChanged: (value) {
                          setState(() {
                            postType = postTypes[value];
                          });
                        },
                        selectedValue: postType,
                        hintText: "Select Post Type",
                        labelText: "Post Type",
                        options: [
                          {'displayText': 'Sale', 'value': 0},
                          {'displayText': 'Borrow', 'value': 1},
                          {'displayText': 'Donation', 'value': 2},
                          {'displayText': 'Lost', 'value': 3}
                        ],
                      ),
                      InfoFormField(
                          /*key:_formKey,*/ hintText:
                              "Enter the Title of the Post",
                          labelText: "Title",
                          onSaved: (value) {
                            title = value;
                          },
                          initialValue: title),
                      InfoFormField(
                        /*key:_formKey,*/ hintText:
                            "Enter the Details of the Post",
                        labelText: "Details",
                        onSaved: (value) {
                          body = value;
                        },
                        initialValue: body,
                      ),
                      if (postType == 0 ||
                          postType == 1)
                        InfoFormField(
                            initialValue: price,
                            icon: const Icon(Icons.currency_lira),
                            hintText: "Enter Price in TRY",
                            labelText: "Price",
                            isNumber: true,
                            onSaved: (value) {
                              price = value;
                            }),
                      if(postType == 1)
                        InfoFormField(
                          initialValue: borrowDay.toString(),
                          icon: const Icon(Icons.date_range_sharp),
                          hintText: "Enter the rent period for the price",
                          labelText: "Borrow Day",
                          isNumber: true,
                          onSaved: (value) {
                            if(value != null)
                              borrowDay = int.tryParse(value);
                            else
                              borrowDay = 0;
                          }),
                      SearchableFilterChips(
                        alreadySelected: tags??"",
                        onChanged: (value) {
                          selectedFilters = value;
                        },
                        onSaved: (value) => print(value),
                        //key:_formKey,
                        hintText: "Select Tags for the Post",
                        label: "Tags",
                        allFilters: allFilters, // from constants
                      ),
                      ImageUploadForm(
                        onSaved: (value) {
                          imageBytesList = value;
                        },
                      ),
                      FormButton(
                          hintText:
                              mode_ == 'edit' ? "Update Post" : "Create Post",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState?.save();
                              if (mode_ == 'edit') {
                                updatePost();
                              } else {
                                await createPost();
                              }
                            }
                          })
                    ]),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Wrap(
      spacing: 8,
      children: imageBytesList
          .map((bytes) => Image.memory(
                bytes,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ))
          .toList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

//
// Column(
// children: [
// TextFormField(
// controller: _titleController,
// decoration: InputDecoration(labelText: 'Title'),
// ),
// TextFormField(
// controller: _bodyController,
// decoration: InputDecoration(labelText: 'Body'),
// keyboardType: TextInputType.multiline,
// maxLines: null,
// ),
// TextFormField(
// controller: _tagsController,
// decoration: InputDecoration(labelText: 'Tags'),
// ),
// ElevatedButton(
// onPressed: _pickImage,
// child: Text('Upload Image'),
// ),
// _buildImagePreview(),
// SizedBox(height: MediaQuery.of(context).size.height * 0.01),
// ElevatedButton(
// onPressed: () {
// if(mode == 'add'){
// createPost();
// }else if(postId != null && mode == 'edit'){
// updatePost();
// }
// },
// child: Text('Submit'),
// ),
// ],
// )
TextStyle ProfilePageTextStyle() {
  return const TextStyle(
      fontFamily: 'Lato',
      fontSize: 25,
      color: kTitleColor,
      fontWeight: FontWeight.w800,
      letterSpacing: .5);
}
