import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';

abstract class DiscoverState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? dioException;

  const DiscoverState({this.articles, this.dioException});

  @override
  List<Object> get props => [articles!, dioException!];
}

class LoadingDiscoverState extends DiscoverState {
  const LoadingDiscoverState();
}

class LoadedDiscoverState extends DiscoverState {
  const LoadedDiscoverState(List<ArticleEntity> articles) : super(articles: articles);
}

class ErrorDiscoverState extends DiscoverState {
  const ErrorDiscoverState(DioException dioException) : super(dioException: dioException);
}
