import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'Authorization.dart';

class TokenInterceptor extends Interceptor {
 @override
 Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
  String? accessToken = await Authorization.getAccessToken();

  if (accessToken != null) {
   options.headers['Authorization'] = 'Bearer $accessToken';
  }
  options.headers['ngrok-skip-browser-warning'] = 'true';
  return super.onRequest(options, handler);
 }
}

class SkipInterceptor extends Interceptor{
 @override
 Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
  options.headers['ngrok-skip-browser-warning'] = 'true';
  return super.onRequest(options, handler);
 }
}


class AuthorizedAPISingleton {
 static final Openapi _instance = Openapi(interceptors: [TokenInterceptor()]);

 static Openapi get instance =>_instance;
}