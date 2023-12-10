import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/src/features/daily_news/presentation/widgets/article_tile.dart';

import '../../../domain/entities/article.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({
    super.key,
    required this.articles,
  });

  final List<ArticleEntity> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.breakingNews,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                AppLocalizations.of(context)!.more,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: ArticleWidget(
                  article: articles[index],
                  onArticlePressed: (article) => _onArticlePressed(context, article),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
