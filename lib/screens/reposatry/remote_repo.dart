import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/api_manager.dart';
import 'package:news/core/constans.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';
import 'package:news/screens/reposatry/repo.dart';


@Injectable(as: HomeRepo)
class HomeRemoteRepo extends HomeRepo{

  ApiManager apiManager;
  HomeRemoteRepo(this.apiManager);
  @override
  Future<NewsResponse> getNewsResponse(String sourceId) async{
   try{
     Response response = await apiManager.get(
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
    Response response = await apiManager.get(
        "/v2/top-headlines/sources?&category=$categoryId"
    );

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }catch(e){
    throw Exception("error");
  }
  }

  @override
  Future<NewsResponse> searchNews(String query) async{
    try {
      Response response = await apiManager.get(
          "/v2/everything?q=$query"
      );
      return NewsResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to search news: ${e.toString()}");
    }
  }

}