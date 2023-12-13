import 'package:flutter/material.dart';
import 'package:news_app/src/core/components/image_container.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/article_screen.dart';

class ArticleTileWide extends StatelessWidget {
  const ArticleTileWide({
    super.key,
    required this.article,
  });

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            ArticleScreen.routeName,
            arguments: article,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(
              width: MediaQuery.of(context).size.width * 0.5,
              imageUrl: article.urlToImage ?? '',
              gradientBlur: false,
            ),
            const SizedBox(height: 10),
            Text(
              article.title ?? 'Title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, height: 1.5),
            ),
            const SizedBox(height: 5),
            Text('${DateTime.now().difference(article.publishedAt!).inHours} hours ago', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 5),
            Text(
              'by ${article.author ?? 'Author'}',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
