import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

import '../../widgets/home/bottom_nav_bar.dart';
import '../../widgets/home/image_container.dart';
import '../article_detail/article_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Health', 'Politics', 'Art', 'Food', 'Science'];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [const _DiscoverNews(), _CategoryNews(tabs: tabs)],
        ),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  const _CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
              .toList(),
        ),
        BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(builder: (_, state) {
          if (state is RemoteArticlesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
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
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ArticleScreen.routeName,
                                arguments: state.articles![index],
                              );
                            },
                            child: Row(
                              children: [
                                ImageContainer(
                                  width: 80,
                                  height: 80,
                                  margin: const EdgeInsets.all(10.0),
                                  borderRadius: 5,
                                  imageUrl: state.articles![index].urlToImage ?? '',
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.articles![index].title ?? 'Title',
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
                                            '${DateTime.now().difference(state.articles![index].publishedAt!).inHours} hours ago',
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(width: 20),
                                          // const Icon(
                                          //   Icons.visibility,
                                          //   size: 18,
                                          // ),
                                          // const SizedBox(width: 5),
                                          // Text(
                                          //   '${state.articles![index].} views',
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
                        }),
                      ),
                    )
                    .toList(),
              ),
            );
          }
        }),
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 5),
          Text(
            'News from all over the world',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
