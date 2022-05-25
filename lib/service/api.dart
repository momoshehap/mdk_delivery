import 'package:dio/dio.dart';

class Helper {
  static Dio? dio;
  static String apiKey = "d3c87f0141934fca925f3a7bcd6111f6";
  static String baseUrl = "https://newsapi.org/";
  static String path = "v2/top-headlines";

  static Map<String, dynamic> query = {
    'country': 'eg',
    'category': 'business',
    'apiKey': Helper.apiKey
  };

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      String url, Map<String, dynamic> query) async {
    return await dio!
        .get(
      url,
      queryParameters: query,
    )
        .catchError((value) {
      if (value == null) {
        print("faild to download news , some thing went wrong!!$value");
      }
    });
  }
}
