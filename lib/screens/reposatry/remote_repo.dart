import 'package:dio/dio.dart';
import 'package:news/core/constans.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';
import 'package:news/screens/reposatry/repo.dart';

class HomeRemoteRepo extends HomeRepo{
  late Dio dio ;
  HomeRemoteRepo(){
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
  @override
  Future<NewsResponse> getNewsResponse(String sourceId) async{
   try{
     Response response = await dio.get(
         "/v2/everything? &sources=$sourceId"
     );
     NewsResponse newsResponse = NewsResponse.fromJson(response.data);
     return newsResponse;
   }catch(e){
     throw Exception("error");
   }
  }

  @override
  Future<SourcesResponse> getSourcesResponse(String categoryId) async{
  try{
    Response response = await dio.get(
        "/v2/top-headlines/sources?&category=$categoryId"
    );

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }catch(e){
    throw Exception("error");
  }
  }

}