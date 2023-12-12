import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';

import '../../../../../../core/components/article/article_tile_small.dart';
import '../../../../domain/enums/news_category_enum.dart';
import '../../../bloc/article/remote/remote_article_bloc.dart';
import '../../../bloc/article/remote/remote_article_state.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<NewsCategoryEnum> tabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          onTap: (index) {
            BlocProvider.of<RemoteArticlesBloc>(context).add(GetArticles(category: tabs[index].category));
          },
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab.text,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
              .toList(),
        ),
        BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
          builder: (_, state) {
            if (state is RemoteArticlesLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: tabs
                      .map(
                        (tab) => ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.articles!.length,
                          itemBuilder: (context, index) {
                            return ArticleTileSmall(
                              article: state.articles![index],
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
