import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/constants.dart';

@singleton
class ApiManger {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseMoviesApiUrl,
        headers: {
          "Authorization":
              Constants.apiKey
        },
      ),
    );
  }
  Future<Response> getRequest(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      endPoints,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> postRequest(
      {required String endPoints, Map<String, dynamic>? body}) async {
    var response = await dio.post(endPoints, data: body);
    return response;
  }
}
