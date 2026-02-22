import 'package:hive/hive.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';

class CacheHelper {
  static const String _boxNameSource ="SourcesBox";
  static const String _boxNameNews ="NewsBox";


  static Future<Box<NewsResponse>> _openNewsBox()async{
    if(!Hive.isBoxOpen(_boxNameNews)){
      return await Hive.openBox<NewsResponse>(_boxNameNews);
    }else{
      return Hive.box<NewsResponse>(_boxNameNews);

    }
  }

  static Future<void> saveNewsResponse(NewsResponse newsResponse,String sourceId)async{
    var box = await _openNewsBox();
    return box.put("news-$sourceId", newsResponse);

  }

  static Future<NewsResponse?> getNewsResponse(String sourceId)async{
    var box = await _openNewsBox();
    return box.get("news-$sourceId");
  }

  static Future<void> deleteNewsResponse()async{
    var box = await _openNewsBox();
    return box.delete("news");
  }


  //SourcesResponse
 static Future<Box<SourcesResponse>> _openSourceBox()async{
    if(!Hive.isBoxOpen(_boxNameSource)){
      return await Hive.openBox<SourcesResponse>(_boxNameSource);
    }else{
      return Hive.box<SourcesResponse>(_boxNameSource);

    }
  }

  static Future<void> saveSourceResponse(SourcesResponse sourcesResponse,String categoryId)async{
   var box = await _openSourceBox();
   return box.put("sources-$categoryId", sourcesResponse);

  }

  static Future<SourcesResponse?> getSourceResponse(String categoryId)async{
   var box = await _openSourceBox();
   return box.get("sources-$categoryId");
  }

  static Future<void> deleteSourceResponse()async{
    var box = await _openSourceBox();
    return box.delete("sources");
  }

}