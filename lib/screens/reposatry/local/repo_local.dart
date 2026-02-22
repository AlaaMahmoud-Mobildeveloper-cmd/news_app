
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';

abstract class HomeRepoLocal {


  Future<SourcesResponse> getSourcesResponse(String categoryId);


  Future<NewsResponse> getNewsResponse(String sourceId);
   Future<NewsResponse> searchNews(String query);
}