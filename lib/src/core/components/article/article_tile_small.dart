import 'package:flutter/material.dart';
import 'package:news_app/src/core/components/image_container.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/article_screen.dart';

class ArticleTileSmall extends StatelessWidget {
  const ArticleTileSmall({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ArticleScreen.routeName,
          arguments: article,
        );
      },
      child: Row(
        children: [
          ImageContainer(
            width: 80,
            height: 80,
            gradientBlur: false,
            margin: const EdgeInsets.all(10.0),
            borderRadius: 5,
            imageUrl: article.urlToImage ?? '',
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title ?? 'Title',
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${DateTime.now().difference(article.publishedAt!).inHours} hours ago',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 20),
                    // const Icon(
                    //   Icons.visibility,
                    //   size: 18,
                    // ),
                    // const SizedBox(width: 5),
                    // Text(
                    //   '${article.} views',
                    //   style: const TextStyle(fontSize: 12),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
