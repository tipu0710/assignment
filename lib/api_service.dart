import 'package:dio/dio.dart';

class ApiService {

  static Future<Response> getMethod(String url) async {
    Dio dio = new Dio();

    try {
      Response response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
      } else {
        print(e.request);
        print(e.message);
      }
      throw e;
    }
  }
}
