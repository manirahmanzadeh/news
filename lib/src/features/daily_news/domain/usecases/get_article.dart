import 'package:news_app/src/core/resources/data_state.dart';
import 'package:news_app/src/core/usecases/usecase.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, Map<String, dynamic>> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({Map<String, dynamic>? params}) {
    return _articleRepository.getNewsArticles(params!['category'], params['q']);
  }
}
