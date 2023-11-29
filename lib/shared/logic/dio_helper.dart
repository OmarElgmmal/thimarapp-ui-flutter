import 'package:dio/dio.dart';

class DioHelper {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "https://thimar.amr.aait-d.com/api/",
    ),
  );

  Future<CustomResponse> sendData(String endPoint,
      {Map<String, dynamic>? data}) async {
    print(
      "(Post) https://thimar.amr.aait-d.com/api/$endPoint",
    );
    print(
      "Data: $data",
    );
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
      );
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          reponse: response);
    } on DioException catch (ex) {
      return CustomResponse(
          message: ex.response!.data["message"],
          isSuccess: false,
          reponse: ex.response);
    }
  }

  Future<CustomResponse> getData(String endPoint,
      {Map<String, dynamic>? data}) async{
    print(
      "(Get) https://thimar.amr.aait-d.com/api/$endPoint",
    );
    print(
      "Data: $data",
    );
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: data,
      );
      return CustomResponse(
          message: response.data["message"],
          isSuccess: true,
          reponse: response);
    } on DioException catch (ex) {
      return CustomResponse(
          message: ex.response!.data["message"],
          isSuccess: false,
          reponse: ex.response);
    }
  }
  }


class CustomResponse {
  late final String message;
  late final bool isSuccess;
  late final Response? reponse;

  CustomResponse(
      {required this.message, required this.isSuccess, this.reponse});
}
