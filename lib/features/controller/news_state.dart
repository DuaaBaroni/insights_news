import 'package:insights_news/features/model/news_model/news_model.dart';

class NewsState{}
  // NewsByCategory
class NewsInitialState extends NewsState  {}

class NewsByCategoryLoadingState extends NewsState{}

class NewsByCategorySuccessState extends NewsState {
  final NewsModel model;

  NewsByCategorySuccessState(this.model);
}

class NewsByCategoryErrorState extends NewsState{}

