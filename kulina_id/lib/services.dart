import 'package:dio/dio.dart';
import 'package:kulina_id/model.dart';

class ServiceApi {
  Dio _dio = Dio();
  Response? response;
  Future<Response> getGuest() async {
    int limit = 5;
    var url =
        'http://food.mockable.io/v1/banner';
    try {
      
      response = await _dio.get(url);
     
      return response!;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        throw e.response!;
      } else {
        throw e;
      }
    }
  }
}