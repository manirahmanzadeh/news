import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/bloc/article_detail_event.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/bloc/article_detail_state.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailBloc extends Bloc<ArticleDetailEvent, ArticleDetailState> {
  final ArticleEntity article;

  ArticleDetailBloc({required this.article}) : super(DefaultArticleDetailState(article)) {
    on<OpenArticleUrlDetailEvent>(_onOpenArticleUrl);
  }

  _onOpenArticleUrl(OpenArticleUrlDetailEvent event, Emitter<ArticleDetailState> emit) {
    _launchUrl(article.url ?? '');
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
