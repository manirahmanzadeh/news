import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/resources/data_state.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/domain/enums/news_category_enum.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/article_screen.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetArticleUseCase _getArticleUseCase;

  HomeBloc(
    this._getArticleUseCase,
  ) : super(
          const LoadingHomeState(),
        ) {
    on<GetArticlesHomeEvent>(onGetArticles);
  }

  void onGetArticles(GetArticlesHomeEvent event, Emitter<HomeState> emit) async {
    emit(
      const LoadingHomeState(),
    );

    final dataState = await _getArticleUseCase(params: {
      'category': NewsCategoryEnum.general.category,
      'q': '',
    });

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        LoadedHomeState(
          dataState.data!,
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        ErrorHomeState(dataState.error!),
      );
    }
  }

  goToArticle(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(
      context,
      ArticleScreen.routeName,
      arguments: article,
    );
  }
}
