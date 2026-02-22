import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/internet_checker.dart';
import 'package:news/models/news_response.dart';
import 'package:news/screens/reposatry/local/repo_local.dart';
import 'package:news/screens/reposatry/remot/repo.dart';
import 'package:news/screens/search/bloc/state.dart';
@injectable
class SearchCubit extends Cubit<SearchState>{
  HomeRepoRemote homeRepo;
  HomeRepoLocal localRepo;
  SearchCubit(this.homeRepo,this.localRepo) : super(InitSearchState());


  List<Articles> searchList = [];

  void getSearch(String query)async{
    emit(LoadingSearchState());
    if(query.isNotEmpty){
      searchList = [];
      emit(SuccessSearchState());

    }
    try{
      var response =InternetConnectivity().isConnected
          ? await homeRepo.searchNews(query)
          : await localRepo.searchNews(query);
      searchList = response.articles ?? [];
      emit(SuccessSearchState());
    }catch(e){
      emit(ErrorSearchState());
    }
  }

  void clearSearch(){
    searchList = [];
    emit(SuccessSearchState());
    }
  }
