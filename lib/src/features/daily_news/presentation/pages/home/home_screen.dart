import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/bloc/home_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/bloc/home_event.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/components/breaking_news.dart';

import '../../../../../core/components/bottom_nav_bar.dart';
import '../../../../../injection_container.dart';
import 'components/news_of_day.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl()..add(const GetArticlesHomeEvent()),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          NewsOfTheDay(),
          BreakingNews(),
        ],
      ),
    );
  }
}
