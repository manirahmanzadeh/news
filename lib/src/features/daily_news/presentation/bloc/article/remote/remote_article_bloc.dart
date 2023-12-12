import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/resources/data_state.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(
    this._getArticleUseCase,
  ) : super(
          const RemoteArticlesLoading(),
        ) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    emit(
      const RemoteArticlesLoading(),
    );

    final dataState = await _getArticleUseCase(params: event.category);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesDone(dataState.data!),
      );
    }

    if (dataState is DataFailed) {
      emit(
        RemoteArticlesError(dataState.error!),
      );
    }
  }
}
