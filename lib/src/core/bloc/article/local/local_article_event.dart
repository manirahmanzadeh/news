import 'package:equatable/equatable.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object?> get props => [article];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}
