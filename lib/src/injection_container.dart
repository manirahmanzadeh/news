import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/src/core/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/src/core/localization/locale_bloc.dart';
import 'package:news_app/src/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app/src/features/daily_news/presentation/discover/bloc/discover_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/home/bloc/home_bloc.dart';

import 'features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'features/daily_news/data/repoository/article_repository_impl.dart';
import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/domain/usecases/get_article.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  /// Dio
  sl.registerSingleton<Dio>(Dio());

  /// Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  ///UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  ///Blocs
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));

  sl.registerFactory<DiscoverBloc>(() => DiscoverBloc(sl()));

  sl.registerFactory<LocalArticlesBloc>(() => LocalArticlesBloc(sl(), sl(), sl()));

  sl.registerFactory<LocaleBloc>(() => LocaleBloc());
}
