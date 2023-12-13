import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/src/core/bloc/auth/auth_bloc.dart';
import 'package:news_app/src/core/localization/locale_bloc.dart';
import 'package:news_app/src/core/localization/locale_eevent.dart';
import 'package:news_app/src/core/localization/locale_state.dart';
import 'package:news_app/src/features/authentication/domain/repository/auth_repository.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/login_screen.dart';
import 'package:news_app/src/features/daily_news/presentation/home/screens/home_screen.dart';
import 'package:news_app/src/injection_container.dart';

import 'src/config/routes/routes.dart';
import 'src/config/theme/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  final isLoggedIn = sl<AuthRepository>().isLoggedIn();
  runApp(
    App(
      initialRoute: isLoggedIn ? HomeScreen.routeName : LoginScreen.routeName,
    ),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.initialRoute,
  });

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(
          create: (context) => sl()..add(const ChangeLocaleEvent(locale: Locale('en'))),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => sl(),
        ),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (_, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routes: AppRoutes.routes,
          locale: state.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          initialRoute: initialRoute,
        ),
      ),
    );
  }
}
