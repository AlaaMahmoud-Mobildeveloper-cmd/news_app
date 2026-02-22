import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/api_manager.dart';
import 'package:news/core/cache_helper.dart';
import 'package:news/core/constans.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';
import 'package:news/screens/reposatry/remot/repo.dart';


@Injectable(as: HomeRepoRemote)
class HomeRemoteRepoImpl extends HomeRepoRemote{

  ApiManager apiManager;
  HomeRemoteRepoImpl(this.apiManager);
  @override
  Future<NewsResponse> getNewsResponse(String sourceId) async{
   try{
     Response response = await apiManager.get(
         "/v2/everything? &sources=$sourceId"
     );
     NewsResponse newsResponse = NewsResponse.fromJson(response.data);
     await CacheHelper.saveNewsResponse(newsResponse, sourceId);
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
    await CacheHelper.saveSourceResponse(sourcesResponse, categoryId);
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
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      await CacheHelper.saveNewsResponse(newsResponse, query);
      return newsResponse;
    } catch (e) {
      throw Exception("Failed to search news: ${e.toString()}");
    }
  }

}