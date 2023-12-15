import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/components/custom_tag.dart';
import 'package:news_app/src/core/components/image_container.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/bloc/article_detail_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/bloc/article_detail_event.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTag(
                backgroundColor: Colors.black,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      article.urlToImage ?? '',
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Text(
                      article.author!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text('${DateTime.now().difference(DateTime.parse(article.publishedAt!)).inHours}h',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            article.title ?? 'Title',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            article.content!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
          ),
          InkWell(
            onTap: () => BlocProvider.of<ArticleDetailBloc>(context).add(const OpenArticleUrlDetailEvent()),
            child: Text(
              'Learn More',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5, color: Colors.blue),
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 2,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
            ),
            itemBuilder: (context, index) {
              return ImageContainer(
                width: MediaQuery.of(context).size.width * 0.42,
                imageUrl: article.urlToImage ?? '',
                gradientBlur: false,
                margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
              );
            },
          )
        ],
      ),
    );
  }
}
