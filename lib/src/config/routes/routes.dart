import 'package:flutter/material.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/account_screen.dart';

import '../../features/daily_news/presentation/pages/article_detail/article_screen.dart';
import '../../features/daily_news/presentation/pages/discover/discover_screen.dart';
import '../../features/daily_news/presentation/pages/home/home_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
    DiscoverScreen.routeName: (context) => const DiscoverScreen(),
    AccountScreen.routeName: (context) => const AccountScreen(),
    ArticleScreen.routeName: (context) => const ArticleScreen(),
  };
}
