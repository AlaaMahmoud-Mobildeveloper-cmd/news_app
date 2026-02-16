import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:news/core/constans.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';
import 'package:news/screens/bloc/stats.dart';
import 'package:news/screens/reposatry/repo.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitState());

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

      NewsResponse newsResponse = await repo.getNewsResponse(sources[selectedIndex].id ?? "");
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

      SourcesResponse sourcesResponse = await repo.getSourcesResponse(categoryId);
      sources = sourcesResponse.sources ?? [];
      emit(GetSourcesSuccessState());
      getNewsData();
    }catch(e){
      emit(GetSourcesErrorState());
    }
  }

}


