import 'package:flutter/material.dart';

import '../../../../domain/entities/article.dart';

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          // CustomTag(
          //   backgroundColor: Colors.grey.withAlpha(150),
          //   children: [
          //     Text(
          //       article.category,
          //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 10),
          Text(
            article.title ?? 'Title',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.25,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            article.description ?? '',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
