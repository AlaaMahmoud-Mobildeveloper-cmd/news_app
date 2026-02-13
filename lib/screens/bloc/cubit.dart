import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:news/core/constans.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';
import 'package:news/screens/bloc/stats.dart';

class HomeCubit extends Cubit<HomeState>{
  late Dio dio ;
  HomeCubit() : super(HomeInitState()){
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

  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;

  void onChangeSource(int index){
    selectedIndex = index;
    emit(OnChangeSource());
    getNewsData();
  }

  Future<void> getNewsData() async{
    emit(GetNewsDataLoadingState());
    try{
      Response response = await dio.get(
          "/v2/everything? &sources=${sources[selectedIndex].id}"
      );
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      if(newsResponse.status == "error"){
        emit(GetNewsDataErrorState());
        return;
      }
      articles = newsResponse.articles ?? [];
      emit(GetNewsDataSuccessState());
    }catch(e){
      emit(GetNewsDataErrorState());
    }
  }

  Future<void> getSources(String categoryId) async{
    emit(GetSourcesLoadingState());
    try{
      Response response = await dio.get(
          "/v2/top-headlines/sources?&category=$categoryId"
      );

      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      sources = sourcesResponse.sources ?? [];
      emit(GetSourcesSuccessState());
      getNewsData();
    }catch(e){
      emit(GetSourcesErrorState());
    }
  }

}


