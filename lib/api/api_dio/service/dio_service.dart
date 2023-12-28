import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> fetch_Post(String url) async {
    Dio dio = Dio();
    return await dio.get(
        url, options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) => response);
  }
}