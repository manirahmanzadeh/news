import 'package:equatable/equatable.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';

abstract class ArticleDetailState extends Equatable {
  final ArticleEntity? article;

  const ArticleDetailState({this.article});

  @override
  List<Object> get props => [article!];
}

class DefaultArticleDetailState extends ArticleDetailState {
  const DefaultArticleDetailState(ArticleEntity article) : super(article: article);
}
