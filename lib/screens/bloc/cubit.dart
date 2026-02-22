import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/internet_checker.dart';
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_rspons.dart';
import 'package:news/screens/bloc/stats.dart';
import 'package:news/screens/reposatry/local/repo_local.dart';
import 'package:news/screens/reposatry/remot/repo.dart';

@injectable
class HomeCubit extends Cubit<HomeState>{
  HomeRepoRemote repo;
  HomeRepoLocal localRepo;
  HomeCubit(this.repo,this.localRepo) : super(HomeInitState());

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

      NewsResponse newsResponse =InternetConnectivity().isConnected
          ? await repo.getNewsResponse(sources[selectedIndex].id ?? "")
          : await localRepo.getNewsResponse(sources[selectedIndex].id ?? "") ;
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

      SourcesResponse sourcesResponse =InternetConnectivity().isConnected
          ? await repo.getSourcesResponse(categoryId)
          : await localRepo.getSourcesResponse(categoryId);
      sources = sourcesResponse.sources ?? [];
      emit(GetSourcesSuccessState());
      getNewsData();
    }catch(e){
      emit(GetSourcesErrorState());
    }
  }

}


