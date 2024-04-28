// ignore_for_file: unused_import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/api_services.dart';
import 'package:insights_news/features/controller/news_state.dart';
import 'package:insights_news/features/model/news_model/news_model.dart';
import 'package:insights_news/features/model/news_model/source.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  getNewsByCategory(String category) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices.getNewsByCategory(category).then((value) {
        emit(NewsByCategorySuccessState(value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState());
    }
  }

//by search
  getNewsBySearch(String query) {
    emit(NewsBySearchLoadingState());
    try {
      ApiServices.getNewsBySearch(query).then((value) {
        emit(NewsBySearchSuccessState(value!));
      });
    } catch (e) {
      emit(NewsBySearchErrorState());
    }
  }

  // by source

getNewsBySource (){
    emit(NewsBySourcessLoadingState());
    try{
      ApiServices.getNewsBySources().then((value){
        emit(NewsBySourcessSucessState(sources: value!));
      } ) ;
    }catch(e){    emit(NewsBySourcesErrorState());
}
  }

// news by source
  getArticlesBySource(String sourceId) {
    emit(ArticlesBySourcesLoadingState());
    try {
      ApiServices.getArticlesBySources(sourceId).then((value) {
        emit(ArticlesBySourcesSucessState(model: value!));
      });
    } catch (e) {
      emit(ArticlesBySourcesErrorState());
    }
  }

  // img by category
  getNewsImageByCategory() {
    emit(NewsImageByCategoryLoadingState());

    try {
      ApiServices.getNewsByCategoryImageGeneral().then((value) {
        emit(NewsImageByCategorySucessState(model: value!));
      });
    } catch (e) {
      emit(NewsImageByCategoryErrorState());
    }
  }
}

