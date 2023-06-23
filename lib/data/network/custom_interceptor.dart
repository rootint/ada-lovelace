import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.putIfAbsent('Authorization', () => 'Bearer balladwise');
    // final _tokens = await getToken();
    // if (_tokens != null) {
    //   options.headers.putIfAbsent('Authorization', () => _tokens);
    // }
    // if (kDebugMode) {
    //   // log(options.uri.toString());
    //   print(options.uri);
    //   // print('Option headers: ${options.headers}');
    //   print(options.data);
    // }
    handler.next(options);
  }
}

@override
void onError(DioException exception, ErrorInterceptorHandler handler) {
  print(exception.response!.statusCode);
}

// import 'dart:async';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '../../core/constants.dart';

// /// TokenInterceptor is in charge of attaching accessToken to request headers
// class TokenInterceptor extends Interceptor {
//   // final FlutterSecureStorage _storage;
//   String? _token;

//   // constructor
//   TokenInterceptor(this._storage);

//   FutureOr<String?> getToken() async {
//     if (_token != null) {
//       return _token;
//     } else {
//       final _fetchedToken = await _storage.read(key: Constants.accessTokenKey);
//       if (kDebugMode) print('Fetched Token $_fetchedToken');
//       return _token = _fetchedToken == null ? null : 'Token $_fetchedToken';
//     }
//   }

//   Future<void> saveToken(String token) async {
//     _token = 'Token $token';
//     await _storage.write(key: Constants.accessTokenKey, value: token);
//     if (kDebugMode) print('Saved Token $_token');
//   }

//   Future<void> deleteToken() async {
//     _token = null;
//     await _storage.delete(key: Constants.accessTokenKey);
//     if (kDebugMode) {
//       print('Token deleted');
//     }
//   }

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final _tokens = await getToken();
//     if (_tokens != null) {
//       options.headers.putIfAbsent('Authorization', () => _tokens);
//     }
//     if (kDebugMode) {
//       // log(options.uri.toString());
//       print(options.uri);
//       // print('Option headers: ${options.headers}');
//       print(options.data);
//     }
//     handler.next(options);
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     if (kDebugMode) {
//       print('onError start ${err.response?.realUri}');
//       print(err.message);
//       print(err.type);
//       if (err.type == DioErrorType.response) {
//         print(err.response.toString());
//       }
//       print('onError finish');
//     }
//     super.onError(err, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     if (kDebugMode) {
//       print(
//           'RESPONSE for ${response.requestOptions.method} ${response.requestOptions.path} is ${response.statusCode}\n ${response.data}');
//     }
//     super.onResponse(response, handler);
//   }
// }
