

import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';

abstract class HomeRepo {


  Future<SourcesResponse> getSourcesResponse(String categoryId);


  Future<NewsResponse> getNewsResponse(String sourceId);

}