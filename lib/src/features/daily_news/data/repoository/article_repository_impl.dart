import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/src/core/constants/constants.dart';
import 'package:news_app/src/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/enums/news_category_enum.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/local/app_database.dart';
import '../models/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles(String? category, String? q) async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        category: category ?? NewsCategoryEnum.general.category,
        country: countryQuery,
        q: q,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final articlesList = httpResponse.data
            .where(
              (element) => element.title != '[Removed]' && element.urlToImage != null,
            )
            .toList();
        return DataSuccess(articlesList);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: httpResponse.response,
          ),
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDao.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDao.insertArticle(ArticleModel.fromEntity(article));
  }
}
