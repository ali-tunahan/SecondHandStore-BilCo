import 'dart:convert';

import 'package:bil_co/ApiSingleton.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:openapi/openapi.dart';

class Authorization {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  static String? jwtToken;
  static String? refreshToken;
  static String? userId;

  static Future<void> nukeTokens() async{
    await _storage.delete(key: 'jwtToken');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'userId');
  }

  static Future<void> storeTokens(String? jwtToken, String? refreshToken, String? userId) async {
    jwtToken = jwtToken;
    refreshToken = refreshToken;
    userId = userId;

    await _storage.write(key: 'jwtToken', value: jwtToken);
    await _storage.write(key: 'refreshToken', value: refreshToken);
    await _storage.write(key: 'userId', value: userId);
  }

  static Future<String?> getJwtToken() async {
    return await _storage.read(key: 'jwtToken');
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refreshToken');
  }

  static Future<String?> getUserId() async {
    return await _storage.read(key: 'userId');
  }

  static Future<void> refreshTokens() async {
    try {
      String? refreshToken = await getRefreshToken();
      if (refreshToken != null) {
        // Call your backend refresh token endpoint
        userId = await getUserId();
        if(userId == null){
          throw Exception("Token refresh failed"); //TODO handle
        }
        final refreshRequest = RefreshRequest((b) => b..userId = userId..refreshToken = refreshToken);
        final response = await AuthorizedAPISingleton.instance.getAuthApi().apiAuthRefreshPost(refreshRequest: refreshRequest);

        if (response.statusCode == 200) {
          // Update the stored tokens with the new values
          // Note: Adjust the response parsing based on your backend
          final data = response.data;
          userId = data?.userId;
          refreshToken = data?.refreshToken;
          jwtToken = data?.accessToken;
          await storeTokens(jwtToken, refreshToken, userId);
          //TODO handle error cases
        }
      }
    } catch (e) {
      // TODO Handle token refresh error navigate to login
      print('Token refresh failed: $e');
    }
  }

  static Future<String?> getAccessToken() async {
    String? jwtToken = await getJwtToken();

    if(jwtToken == null){
      await refreshTokens();
      return jwtToken;
    }

    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwtToken);


    /* isExpired() - you can use this method to know if your token is already expired or not.
  An useful method when you have to handle sessions and you want the user
  to authenticate if has an expired token */
    bool isTokenExpired = JwtDecoder.isExpired(jwtToken);

    if (isTokenExpired) {
      await refreshTokens();
      return jwtToken;
    }

    return jwtToken;
  }
  Future<bool> isAuthenticated() async {
    String? token = await Authorization.getAccessToken();
    if(token == null || token ==""){
      return false;
    }
    //Fixes the bug where refreshing the page resets user id
    userId = await Authorization.getUserId();
    jwtToken = token;

    return true;
  }

}