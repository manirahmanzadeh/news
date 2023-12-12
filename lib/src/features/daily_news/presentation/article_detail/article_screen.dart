import 'package:flutter/material.dart';
import 'package:news_app/src/core/components/image_container.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';

import 'components/news_body.dart';
import 'components/news_headline.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as ArticleEntity;
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
      ),
    );
  }
}
