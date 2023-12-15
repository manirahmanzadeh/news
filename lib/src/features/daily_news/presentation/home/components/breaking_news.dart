import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/components/article/article_tile_wide.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        if (state is LoadingHomeState) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('More', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const ArticleTileWide(
                        loading: true,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('More', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.articles!.length,
                    itemBuilder: (context, index) {
                      return ArticleTileWide(
                        article: state.articles![index],
                        loading: false,
                      );
                    },
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
