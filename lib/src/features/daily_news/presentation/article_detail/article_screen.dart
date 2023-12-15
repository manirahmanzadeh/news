import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/src/core/bloc/article/local/local_article_event.dart';
import 'package:news_app/src/core/components/image_container.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/bloc/article_detail_bloc.dart';

import 'components/news_body.dart';
import 'components/news_headline.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as ArticleEntity;
    return BlocProvider<ArticleDetailBloc>(
      create: (context) => ArticleDetailBloc(article: article),
      child: const _ArticleScreen(),
    );
  }
}

class _ArticleScreen extends StatelessWidget {
  const _ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final article = BlocProvider.of<ArticleDetailBloc>(context).article;
    return ImageContainer(
      width: double.infinity,
      imageUrl: article.urlToImage ?? '',
      wholeBlur: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            NewsHeadline(article: article),
            NewsBody(article: article),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<LocalArticlesBloc>(context).add(SaveArticle(article));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Article Saved!')));
          },
          child: const Icon(Icons.save_alt),
        ),
      ),
    );
  }
}
