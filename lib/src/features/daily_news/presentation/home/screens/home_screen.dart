import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/components/bottom_nav_bar.dart';
import 'package:news_app/src/core/components/drawer.dart';
import 'package:news_app/src/core/components/shimmer/shimmer_screen_widget.dart';
import 'package:news_app/src/features/daily_news/presentation/home/bloc/home_state.dart';
import 'package:news_app/src/injection_container.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../components/breaking_news.dart';
import '../components/news_of_day.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

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
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      drawer: const AppDrawer(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: (state is LoadingHomeState)
                ? ShimmerScreen(
                    enabled: true,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: const [
                        NewsOfTheDay(),
                        BreakingNews(),
                      ],
                    ),
                  )
                : ListView(
                    padding: EdgeInsets.zero,
                    children: const [
                      NewsOfTheDay(),
                      BreakingNews(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
