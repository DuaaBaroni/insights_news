
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/api_services.dart';
import 'package:insights_news/features/controller/news_state.dart';

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
}