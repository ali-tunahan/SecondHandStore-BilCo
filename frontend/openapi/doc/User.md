# openapi.model.User

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**userName** | **String** |  | [optional] 
**normalizedUserName** | **String** |  | [optional] 
**email** | **String** |  | [optional] 
**normalizedEmail** | **String** |  | [optional] 
**emailConfirmed** | **bool** |  | [optional] 
**passwordHash** | **String** |  | [optional] 
**securityStamp** | **String** |  | [optional] 
**concurrencyStamp** | **String** |  | [optional] 
**phoneNumber** | **String** |  | [optional] 
**phoneNumberConfirmed** | **bool** |  | [optional] 
**twoFactorEnabled** | **bool** |  | [optional] 
**lockoutEnd** | [**DateTime**](DateTime.md) |  | [optional] 
**lockoutEnabled** | **bool** |  | [optional] 
**accessFailedCount** | **int** |  | [optional] 
**enabled** | **bool** |  | [optional] 
**firstName** | **String** |  | [optional] 
**lastName** | **String** |  | [optional] 
**userType** | [**UserType**](UserType.md) |  | [optional] 
**userImage** | [**UserImage**](UserImage.md) |  | [optional] 
**posts** | [**BuiltList&lt;Post&gt;**](Post.md) |  | [optional] 
**savedPosts** | [**BuiltList&lt;SavedPost&gt;**](SavedPost.md) |  | [optional] 
**commentsMade** | [**BuiltList&lt;Comment&gt;**](Comment.md) |  | [optional] 
**commentsReceived** | [**BuiltList&lt;Comment&gt;**](Comment.md) |  | [optional] 
**refreshToken** | **String** |  | [optional] 
**refreshTokenExpires** | [**DateTime**](DateTime.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


