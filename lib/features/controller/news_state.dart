import 'package:insights_news/features/model/news_model/news_model.dart';
import 'package:insights_news/features/model/source_model/source_model.dart';

class NewsState {}

// NewsByCategory
class NewsInitialState extends NewsState {}

class NewsByCategoryLoadingState extends NewsState {}

class NewsByCategorySuccessState extends NewsState {
  final NewsModel model;

  NewsByCategorySuccessState(this.model);
}

class NewsByCategoryErrorState extends NewsState {}
  
  //  by search

  class NewsBySearchLoadingState extends NewsState {}

class NewsBySearchSuccessState extends NewsState {
  final NewsModel model;

  NewsBySearchSuccessState(this.model);
}

class NewsBySearchErrorState extends NewsState {}

// NewsBysource
 
   class NewsBySourcessLoadingState extends NewsState {}

class NewsBySourcessSucessState extends NewsState {
  final SourceModel sources;

  NewsBySourcessSucessState({required this.sources});
}

class NewsBySourcesErrorState extends NewsState {}
  


// Articles
 class ArticlesBySourcesLoadingState extends NewsState {}

class ArticlesBySourcesSucessState extends NewsState {
  final NewsModel model;

  ArticlesBySourcesSucessState({required this.model});
}

class ArticlesBySourcesErrorState extends NewsState {}

// img by category
class NewsImageByCategoryLoadingState extends NewsState {}

class NewsImageByCategorySucessState extends NewsState {
  final NewsModel model;

  NewsImageByCategorySucessState({required this.model});
}

class NewsImageByCategoryErrorState extends NewsState {}

