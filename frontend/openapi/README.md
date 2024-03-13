# openapi (EXPERIMENTAL)
No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v1
- Build package: org.openapitools.codegen.languages.DartDioClientCodegen

## Requirements

* Dart 2.15.0+ or Flutter 2.8.0+
* Dio 5.0.0+ (https://pub.dev/packages/dio)

## Installation & Usage

### pub.dev
To use the package from [pub.dev](https://pub.dev), please include the following in pubspec.yaml
```yaml
dependencies:
  openapi: 1.0.0
```

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```yaml
dependencies:
  openapi:
    git:
      url: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      #ref: main
```

### Local development
To use the package from your local drive, please include the following in pubspec.yaml
```yaml
dependencies:
  openapi:
    path: /path/to/openapi
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:openapi/openapi.dart';


final api = Openapi().getAuthApi();
final AuthorizeRequest authorizeRequest = ; // AuthorizeRequest | 

try {
    final response = await api.apiAuthAuthorizePost(authorizeRequest);
    print(response);
} catch on DioException (e) {
    print("Exception when calling AuthApi->apiAuthAuthorizePost: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
[*AuthApi*](doc/AuthApi.md) | [**apiAuthAuthorizePost**](doc/AuthApi.md#apiauthauthorizepost) | **POST** /api/Auth/authorize | 
[*AuthApi*](doc/AuthApi.md) | [**apiAuthIdGet**](doc/AuthApi.md#apiauthidget) | **GET** /api/Auth/{id} | 
[*AuthApi*](doc/AuthApi.md) | [**apiAuthIdPut**](doc/AuthApi.md#apiauthidput) | **PUT** /api/Auth/{id} | 
[*AuthApi*](doc/AuthApi.md) | [**apiAuthRefreshPost**](doc/AuthApi.md#apiauthrefreshpost) | **POST** /api/Auth/refresh | 
[*AuthApi*](doc/AuthApi.md) | [**apiAuthRegisterPost**](doc/AuthApi.md#apiauthregisterpost) | **POST** /api/Auth/register | 
[*AuthApi*](doc/AuthApi.md) | [**apiAuthRevokePost**](doc/AuthApi.md#apiauthrevokepost) | **POST** /api/Auth/revoke | 
[*AuthApi*](doc/AuthApi.md) | [**messagesReceiverUserIdSenderUserIdGet**](doc/AuthApi.md#messagesreceiveruseridsenderuseridget) | **GET** /messages/{receiverUserId}/{senderUserId} | 
[*AuthApi*](doc/AuthApi.md) | [**userchatsIdGet**](doc/AuthApi.md#userchatsidget) | **GET** /userchats/{id} | 
[*CommentApi*](doc/CommentApi.md) | [**commentsFuzzyGet**](doc/CommentApi.md#commentsfuzzyget) | **GET** /comments/Fuzzy | 
[*CommentApi*](doc/CommentApi.md) | [**commentsGet**](doc/CommentApi.md#commentsget) | **GET** /comments | 
[*CommentApi*](doc/CommentApi.md) | [**commentsIdDelete**](doc/CommentApi.md#commentsiddelete) | **DELETE** /comments/{id} | 
[*CommentApi*](doc/CommentApi.md) | [**commentsIdGet**](doc/CommentApi.md#commentsidget) | **GET** /comments/{id} | 
[*CommentApi*](doc/CommentApi.md) | [**commentsIdPut**](doc/CommentApi.md#commentsidput) | **PUT** /comments/{id} | 
[*CommentApi*](doc/CommentApi.md) | [**commentsPost**](doc/CommentApi.md#commentspost) | **POST** /comments | 
[*DemoApi*](doc/DemoApi.md) | [**demosFuzzyGet**](doc/DemoApi.md#demosfuzzyget) | **GET** /demos/Fuzzy | 
[*DemoApi*](doc/DemoApi.md) | [**demosGet**](doc/DemoApi.md#demosget) | **GET** /demos | 
[*DemoApi*](doc/DemoApi.md) | [**demosIdDelete**](doc/DemoApi.md#demosiddelete) | **DELETE** /demos/{id} | 
[*DemoApi*](doc/DemoApi.md) | [**demosIdGet**](doc/DemoApi.md#demosidget) | **GET** /demos/{id} | 
[*DemoApi*](doc/DemoApi.md) | [**demosIdPut**](doc/DemoApi.md#demosidput) | **PUT** /demos/{id} | 
[*DemoApi*](doc/DemoApi.md) | [**demosPost**](doc/DemoApi.md#demospost) | **POST** /demos | 
[*PostApi*](doc/PostApi.md) | [**postsFuzzyGet**](doc/PostApi.md#postsfuzzyget) | **GET** /posts/Fuzzy | 
[*PostApi*](doc/PostApi.md) | [**postsGet**](doc/PostApi.md#postsget) | **GET** /posts | 
[*PostApi*](doc/PostApi.md) | [**postsIdDelete**](doc/PostApi.md#postsiddelete) | **DELETE** /posts/{id} | 
[*PostApi*](doc/PostApi.md) | [**postsIdGet**](doc/PostApi.md#postsidget) | **GET** /posts/{id} | 
[*PostApi*](doc/PostApi.md) | [**postsIdPut**](doc/PostApi.md#postsidput) | **PUT** /posts/{id} | 
[*PostApi*](doc/PostApi.md) | [**postsPost**](doc/PostApi.md#postspost) | **POST** /posts | 
[*SavedPostApi*](doc/SavedPostApi.md) | [**savedpostsGet**](doc/SavedPostApi.md#savedpostsget) | **GET** /savedposts | 
[*SavedPostApi*](doc/SavedPostApi.md) | [**savedpostsIdDelete**](doc/SavedPostApi.md#savedpostsiddelete) | **DELETE** /savedposts/{id} | 
[*SavedPostApi*](doc/SavedPostApi.md) | [**savedpostsPost**](doc/SavedPostApi.md#savedpostspost) | **POST** /savedposts | 


## Documentation For Models

 - [AuthorizeDTO](doc/AuthorizeDTO.md)
 - [AuthorizeRequest](doc/AuthorizeRequest.md)
 - [ChatDTO](doc/ChatDTO.md)
 - [Comment](doc/Comment.md)
 - [CommentDTO](doc/CommentDTO.md)
 - [CommentDTOListingResponse](doc/CommentDTOListingResponse.md)
 - [CreateCommentDTO](doc/CreateCommentDTO.md)
 - [CreateDemoDTO](doc/CreateDemoDTO.md)
 - [CreatePostDTO](doc/CreatePostDTO.md)
 - [CreateUserDTO](doc/CreateUserDTO.md)
 - [Message](doc/Message.md)
 - [Post](doc/Post.md)
 - [PostDTO](doc/PostDTO.md)
 - [PostDTOListingResponse](doc/PostDTOListingResponse.md)
 - [PostDetailsDTO](doc/PostDetailsDTO.md)
 - [PostImage](doc/PostImage.md)
 - [RefreshRequest](doc/RefreshRequest.md)
 - [SavedPost](doc/SavedPost.md)
 - [SavedPostDTO](doc/SavedPostDTO.md)
 - [UpdatePostDTO](doc/UpdatePostDTO.md)
 - [UpdateUserDTO](doc/UpdateUserDTO.md)
 - [User](doc/User.md)
 - [UserDTO](doc/UserDTO.md)
 - [UserImage](doc/UserImage.md)
 - [UserType](doc/UserType.md)


## Documentation For Authorization


Authentication schemes defined for the API:
### Bearer

- **Type**: API key
- **API key parameter name**: JWT Authentication
- **Location**: HTTP header


## Author


