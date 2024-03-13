# openapi.api.PostApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**postsFuzzyGet**](PostApi.md#postsfuzzyget) | **GET** /posts/Fuzzy | 
[**postsGet**](PostApi.md#postsget) | **GET** /posts | 
[**postsIdDelete**](PostApi.md#postsiddelete) | **DELETE** /posts/{id} | 
[**postsIdGet**](PostApi.md#postsidget) | **GET** /posts/{id} | 
[**postsIdPut**](PostApi.md#postsidput) | **PUT** /posts/{id} | 
[**postsPost**](PostApi.md#postspost) | **POST** /posts | 


# **postsFuzzyGet**
> PostDTOListingResponse postsFuzzyGet(userId, startIndex, count, tags, minPrice, maxPrice, searchTitle, postType, lostItemState)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = Openapi().getPostApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final int startIndex = 56; // int | 
final int count = 56; // int | 
final String tags = tags_example; // String | 
final int minPrice = 56; // int | 
final int maxPrice = 56; // int | 
final String searchTitle = searchTitle_example; // String | 
final int postType = 56; // int | 
final int lostItemState = 56; // int | 

try {
    final response = api.postsFuzzyGet(userId, startIndex, count, tags, minPrice, maxPrice, searchTitle, postType, lostItemState);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostApi->postsFuzzyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [optional] 
 **startIndex** | **int**|  | [optional] [default to 0]
 **count** | **int**|  | [optional] 
 **tags** | **String**|  | [optional] 
 **minPrice** | **int**|  | [optional] 
 **maxPrice** | **int**|  | [optional] 
 **searchTitle** | **String**|  | [optional] 
 **postType** | **int**|  | [optional] 
 **lostItemState** | **int**|  | [optional] 

### Return type

[**PostDTOListingResponse**](PostDTOListingResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsGet**
> BuiltList<PostDTO> postsGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = Openapi().getPostApi();

try {
    final response = api.postsGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostApi->postsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PostDTO&gt;**](PostDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsIdDelete**
> postsIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = Openapi().getPostApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    api.postsIdDelete(id);
} catch on DioException (e) {
    print('Exception when calling PostApi->postsIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsIdGet**
> PostDetailsDTO postsIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = Openapi().getPostApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final response = api.postsIdGet(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostApi->postsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**PostDetailsDTO**](PostDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsIdPut**
> postsIdPut(id, updatePostDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = Openapi().getPostApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final UpdatePostDTO updatePostDTO = ; // UpdatePostDTO | 

try {
    api.postsIdPut(id, updatePostDTO);
} catch on DioException (e) {
    print('Exception when calling PostApi->postsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **updatePostDTO** | [**UpdatePostDTO**](UpdatePostDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postsPost**
> Post postsPost(createPostDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure API key authorization: Bearer
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Bearer').apiKeyPrefix = 'Bearer';

final api = Openapi().getPostApi();
final CreatePostDTO createPostDTO = ; // CreatePostDTO | 

try {
    final response = api.postsPost(createPostDTO);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PostApi->postsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createPostDTO** | [**CreatePostDTO**](CreatePostDTO.md)|  | [optional] 

### Return type

[**Post**](Post.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

