import 'dart:developer';

import 'package:dio/dio.dart';

class HttpService {
  static final String url = 'http://192.168.1.8/carApp/public/api';
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (error, errorInterceptorHandler) {
            print(error.message);
          },
          onRequest: (request, requestInterceptorHandler) {
            print("${request.method} | ${request.path}");
          },
          onResponse: (response, responseInterceptorHandler) {
            print(
                '${response.statusCode} ${response.statusCode} ${response.data}');
          },
        ),
      );
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token = '';
    options.headers.addAll({"Authorization": "Bearer: $token"});
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> postHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioError catch (e) {
      log(e.toString());
    }
  }
}
