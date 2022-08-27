import 'package:cinema_app/shared/constances/constances.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    return dio = Dio(
      BaseOptions(
        baseUrl: AppConstances.baseurl,
        receiveDataWhenStatusError: true,
        queryParameters: {'api_key': AppConstances.apiKey},
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(path, queryParameters: query);
  }
}
