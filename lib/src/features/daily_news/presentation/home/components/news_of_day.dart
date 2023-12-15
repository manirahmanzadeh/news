import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/components/custom_tag.dart';
import 'package:news_app/src/core/components/image_container.dart';
import 'package:news_app/src/core/components/shimmer/shimmer_loading_widget.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class NewsOfTheDay extends StatelessWidget {
  const NewsOfTheDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        if (state is LoadingHomeState) {
          return ShimmerLoading(
            isLoading: true,
            child: ImageContainer(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              imageUrl: '',
              gradientBlur: true,
              child: Container(),
            ),
          );
        } else {
          final article = state.articles!.first;
          return ImageContainer(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            imageUrl: article.urlToImage ?? '',
            gradientBlur: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTag(
                  backgroundColor: Colors.grey.withAlpha(150),
                  children: [
                    Text(
                      'News of the Day',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  article.title ?? 'Title',
                  style:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, height: 1.25, color: Colors.white),
                ),
                TextButton(
                  onPressed: () => BlocProvider.of<HomeBloc>(context).goToArticle(context, article),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Row(
                    children: [
                      Text(
                        'Learn More',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
