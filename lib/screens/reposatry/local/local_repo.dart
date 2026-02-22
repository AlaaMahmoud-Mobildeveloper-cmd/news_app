import 'package:injectable/injectable.dart';
import 'package:news/core/cache_helper.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';
import 'package:news/screens/reposatry/local/repo_local.dart';

@Injectable(as:HomeRepoLocal)
class HomeLocalRepoImpl extends HomeRepoLocal{
  @override
  Future<NewsResponse> getNewsResponse(String sourceId) async {
    var response =await CacheHelper.getNewsResponse(sourceId);
    return response ?? NewsResponse() ;
  }

  @override
  Future<SourcesResponse> getSourcesResponse(String categoryId)async {
    var response = await CacheHelper.getSourceResponse(categoryId);
    return response ?? SourcesResponse() ;
  }

  @override
  Future<NewsResponse> searchNews(String query) async{
    var response =await CacheHelper.getNewsResponse(query);
    return response ?? NewsResponse() ;
  }

}