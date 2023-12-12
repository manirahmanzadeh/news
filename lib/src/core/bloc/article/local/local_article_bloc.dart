import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/save_article.dart';

import 'local_article_event.dart';
import 'local_article_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticleEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticlesBloc(
    this._getSavedArticlesUseCase,
    this._removeArticleUseCase,
    this._saveArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(GetSavedArticles getSavedArticles, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticlesUseCase();
    emit(
      LocalArticlesDone(articles),
    );
  }

  void onRemoveArticle(RemoveArticle removeArticle, Emitter<LocalArticlesState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticlesUseCase();
    emit(
      LocalArticlesDone(articles),
    );
  }

  void onSaveArticle(SaveArticle saveArticle, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticlesUseCase();
    emit(
      LocalArticlesDone(articles),
    );
  }
}
