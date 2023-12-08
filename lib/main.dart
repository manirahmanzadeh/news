

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app/src/injection_container.dart';

import 'src/config/routes/routes.dart';
import 'src/config/theme/app_themes.dart';
import 'src/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'src/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const DailyNews()
      ),
    );
  }
}
