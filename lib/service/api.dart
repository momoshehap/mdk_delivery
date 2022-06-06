import 'dart:convert';

import 'package:dio/dio.dart';

class Helper {
  static late Dio dio;
  static String baseUrl = "https://host.hotcloudhost.com/~mdk/DriverApi/";

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String? header,
  }) async {
    return await dio
        .get(
      url,
      queryParameters: query,
      options: Options(
        headers: {
          "Token": header,
        },
      ),
    )
        .catchError((value) {
      if (value == null) {}
    });
  }

  static Future<Response> SendPost({
    required String url,
    required Map<String, dynamic> query,
    String? header,
  }) async {
    return await dio
        .post(
      url,
      data: json.encode(query),
      options: Options(
        headers: {
          "Token": header,
        },
      ),
    )
        .catchError((value) {
      print(value);
    });
  }
}
