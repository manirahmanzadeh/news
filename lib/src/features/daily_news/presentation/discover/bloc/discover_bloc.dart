import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/resources/data_state.dart';
import 'package:news_app/src/features/daily_news/domain/enums/news_category_enum.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/get_article.dart';

import 'discover_event.dart';
import 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetArticleUseCase _getArticleUseCase;

  String q = '';
  String category = NewsCategoryEnum.general.category;
  TextEditingController searchTextField = TextEditingController();

  DiscoverBloc(
    this._getArticleUseCase,
  ) : super(
          const LoadingDiscoverState(),
        ) {
    on<GetArticlesDiscoverEvent>(onGetArticles);
    on<ChangeQDiscoverEvent>(onChangeQ);
    on<ChangeCategoryDiscoverEvent>(onChangeCategory);
  }

  void onChangeQ(ChangeQDiscoverEvent event, Emitter<DiscoverState> emit) async {
    q = event.q;

    await _getArticles(emit);
  }

  void onGetArticles(GetArticlesDiscoverEvent event, Emitter<DiscoverState> emit) async {
    category = event.initialCategory ?? NewsCategoryEnum.general.category;
    await _getArticles(emit);
  }

  void onChangeCategory(ChangeCategoryDiscoverEvent event, Emitter<DiscoverState> emit) async {
    category = event.category;
    q = '';
    searchTextField.clear();

    await _getArticles(emit);
  }

  Future<void> _getArticles(Emitter<DiscoverState> emit) async {
    emit(
      const LoadingDiscoverState(),
    );

    final dataState = await _getArticleUseCase(params: {
      'category': category,
      'q': q,
    });

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        LoadedDiscoverState(
          dataState.data!,
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        ErrorDiscoverState(dataState.error!),
      );
    }
  }
}
