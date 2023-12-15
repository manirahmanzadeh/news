import 'package:flutter/material.dart';
import 'package:news_app/src/core/components/image_container.dart';
import 'package:news_app/src/core/components/shimmer/shimmer_loading_widget.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/article_screen.dart';

class ArticleTileSmall extends StatelessWidget {
  const ArticleTileSmall({super.key, this.article, required this.loading});

  final ArticleEntity? article;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return ShimmerLoading(
        isLoading: true,
        child: Row(
          children: [
            const ImageContainer(
              width: 80,
              height: 80,
              gradientBlur: false,
              margin: EdgeInsets.all(10.0),
              borderRadius: 5,
              imageUrl: '',
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5 - 40,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
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
            imageUrl: article!.urlToImage ?? '',
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article!.title ?? 'Title',
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
                      '${DateTime.now().difference(DateTime.parse(article!.publishedAt!)).inHours} hours ago',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 20),
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
