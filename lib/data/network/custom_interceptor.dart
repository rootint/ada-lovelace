import 'package:dio/dio.dart';

import '../../env.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
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
