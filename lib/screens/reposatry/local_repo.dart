import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';
import 'package:news/screens/reposatry/repo.dart';

class HomeLocalRepo extends HomeRepo{
  @override
  Future<NewsResponse> getNewsResponse(String sourceId) {
    // TODO: implement getNewsResponse
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSourcesResponse(String categoryId) {
    // TODO: implement getSourcesResponse
    throw UnimplementedError();
  }

}