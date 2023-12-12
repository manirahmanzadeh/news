import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/discover/bloc/discover_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/discover/bloc/discover_event.dart';

import '../../../../../core/components/bottom_nav_bar.dart';
import '../../../../../injection_container.dart';
import '../../../domain/enums/news_category_enum.dart';
import 'components/category_news.dart';
import 'components/discover_news.dart';

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
          children: [
            const DiscoverNews(),
            CategoryNews(tabs: tabs),
          ],
        ),
      ),
    );
  }
}
