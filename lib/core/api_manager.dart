import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/constans.dart';


@lazySingleton
class ApiManager {

  late Dio dio ;
  ApiManager() {
    dio = Dio(
        BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            headers: {
              "x-api-key": {ApiConstants.apiKey}
            }
        )
    );
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
    ));
  }

  get(String path){
    return dio.get(path);

  }

  post(String path){
    return dio.post(path);

  }


}