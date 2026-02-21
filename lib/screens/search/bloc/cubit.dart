import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/models/news_response.dart';
import 'package:news/screens/reposatry/repo.dart';
import 'package:news/screens/search/bloc/state.dart';
@injectable
class SearchCubit extends Cubit<SearchState>{
  HomeRepo homeRepo;

  SearchCubit(this.homeRepo) : super(InitSearchState());


  List<Articles> searchList = [];

  void getSearch(String query)async{
    emit(LoadingSearchState());
    if(query.isNotEmpty){
      searchList = [];
      emit(SuccessSearchState());

    }
    try{
      var response = await homeRepo.searchNews(query);
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
