import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/home_navbar/nav_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/home_navbar/nav_event.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/home_navbar/nav_state.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/tabs/account_tab.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/tabs/discover_tab.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/tabs/home_tab.dart';

import '../../../../../injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NavBloc>(),
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildBody() {
    final tabs = [
      const HomeTab(),
      const DiscoverTab(),
      const AccountTab(),
    ];

    return BlocBuilder<NavBloc, NavState>(
      builder: (_, state) {
        return tabs[state.index];
      },
    );
  }

  _buildBottomNavBar() {
    return BlocBuilder<NavBloc, NavState>(
      builder: (_, state) => Builder(
        builder: (context) => BottomNavigationBar(
          onTap: (int newIndex) {
            _onNavBarItemTap(newIndex, context);
          },
          currentIndex: state.index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Ionicons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Ionicons.search), label: 'Discover'),
            BottomNavigationBarItem(icon: Icon(Ionicons.person), label: 'Account'),
          ],
        ),
      ),
    );
  }

  _onNavBarItemTap(int newIndex, BuildContext context) {
    BlocProvider.of<NavBloc>(context).add(NavChangeIndex(newIndex: newIndex));
  }
}
