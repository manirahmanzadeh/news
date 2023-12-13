import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';

abstract class HomeState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? dioException;

  const HomeState({this.articles, this.dioException});

  @override
  List<Object> get props => [articles!, dioException!];
}

class LoadingHomeState extends HomeState {
  const LoadingHomeState();
}

class LoadedHomeState extends HomeState {
  const LoadedHomeState(List<ArticleEntity> articles) : super(articles: articles);
}

class ErrorHomeState extends HomeState {
  const ErrorHomeState(DioException dioException) : super(dioException: dioException);
}
