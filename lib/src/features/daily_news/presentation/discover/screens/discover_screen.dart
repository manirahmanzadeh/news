import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/components/bottom_nav_bar.dart';
import 'package:news_app/src/core/components/drawer.dart';
import 'package:news_app/src/core/components/shimmer/shimmer_screen_widget.dart';
import 'package:news_app/src/features/daily_news/domain/enums/news_category_enum.dart';
import 'package:news_app/src/injection_container.dart';

import '../bloc/discover_bloc.dart';
import '../bloc/discover_event.dart';
import '../bloc/discover_state.dart';
import '../components/category_news.dart';
import '../components/discover_news.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiscoverBloc>(
      create: (context) => sl()..add(GetArticlesDiscoverEvent(initialCategory: NewsCategoryEnum.health.category)),
      child: const _DiscoverScreen(),
    );
  }
}

class _DiscoverScreen extends StatelessWidget {
  const _DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NewsCategoryEnum> tabs = [
      NewsCategoryEnum.health,
      NewsCategoryEnum.business,
      NewsCategoryEnum.entertainment,
      NewsCategoryEnum.science,
      NewsCategoryEnum.sports,
      NewsCategoryEnum.technology,
      NewsCategoryEnum.general,
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ),
        drawer: const AppDrawer(),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: BlocBuilder<DiscoverBloc, DiscoverState>(
          builder: (_, state) {
            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                const DiscoverNews(),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: (state is LoadingDiscoverState)
                      ? ShimmerScreen(
                          enabled: true,
                          child: CategoryNews(tabs: tabs),
                        )
                      : CategoryNews(tabs: tabs),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
