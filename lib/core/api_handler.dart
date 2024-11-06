import 'package:basic_api/core/api_data.dart';
import 'package:dio/dio.dart';

class ApiHandler {

  Future<ApiData> get(String url) async {
    final dio = Dio();
    final apiData = ApiData();
    try {
      final response = await dio.get(url);
      apiData.setApiResponseData(response.data);

    } on DioException catch (e) {
      apiData.setErrorCode(e.response?.statusCode ?? -1);
      apiData.setErrorMessage(e.message ?? "Something went wrong!");
    }
    return apiData;
  }

}