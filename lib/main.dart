import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/src/core/constants/news_category.dart';
import 'package:news_app/src/core/localization/locale_bloc.dart';
import 'package:news_app/src/core/localization/locale_eevent.dart';
import 'package:news_app/src/core/localization/locale_state.dart';
import 'package:news_app/src/features/daily_news/presentation/pages/home/home_page.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticlesBloc>(
          create: (context) => sl()..add(GetArticles(category: NewsCategory.general.category)),
        ),
        BlocProvider<LocaleBloc>(
          create: (context) => sl()..add(const ChangeLocaleEvent(locale: Locale('en'))),
        ),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (_, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          locale: state.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: const HomePage(),
        ),
      ),
    );
  }
}
