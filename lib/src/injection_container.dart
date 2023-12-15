import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/src/core/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/src/core/localization/locale_bloc.dart';
import 'package:news_app/src/features/authentication/data/data_sources/firebase_auth_service.dart';
import 'package:news_app/src/features/authentication/data/data_sources/firebase_storage_service.dart';
import 'package:news_app/src/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:news_app/src/features/authentication/domain/repository/auth_repository.dart';
import 'package:news_app/src/features/authentication/domain/usecases/edit_user_usecases.dart';
import 'package:news_app/src/features/authentication/domain/usecases/get_current_user_usecase.dart';
import 'package:news_app/src/features/authentication/domain/usecases/send_recovery_email_usecase.dart';
import 'package:news_app/src/features/authentication/domain/usecases/signin_email_password.dart';
import 'package:news_app/src/features/authentication/domain/usecases/signin_facebook_usecase.dart';
import 'package:news_app/src/features/authentication/domain/usecases/signing_google_usecase.dart';
import 'package:news_app/src/features/authentication/domain/usecases/signout.dart';
import 'package:news_app/src/features/authentication/domain/usecases/signup_email_password.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_bloc.dart';
import 'package:news_app/src/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/src/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app/src/features/daily_news/presentation/discover/bloc/discover_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/home/bloc/home_bloc.dart';

import 'features/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'features/daily_news/data/repoository/article_repository_impl.dart';
import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/domain/usecases/get_article.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  /// Dio
  sl.registerSingleton<Dio>(Dio());

  /// Dependencies

  /// News:
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  /// Auth:
  sl.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  sl.registerSingleton<FirebaseStorageService>(FirebaseStorageService());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));

  ///UseCases

  ///Articles:
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  ///Auth:
  sl.registerSingleton<SignInWithEmailAndPasswordUseCase>(SignInWithEmailAndPasswordUseCase(sl()));
  sl.registerSingleton<SignUpWithEmailAndPasswordUseCase>(SignUpWithEmailAndPasswordUseCase(sl()));
  sl.registerSingleton<SignOutUseCase>(SignOutUseCase(sl()));
  sl.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase(sl()));
  sl.registerSingleton<SendRecoveryEmailUseCase>(SendRecoveryEmailUseCase(sl()));
  sl.registerSingleton<SignInWithGoogleUseCase>(SignInWithGoogleUseCase(sl()));
  sl.registerSingleton<SignInWithFacebookUseCase>(SignInWithFacebookUseCase(sl()));
  sl.registerSingleton<ChangeDisplayNameUseCase>(ChangeDisplayNameUseCase(sl()));
  sl.registerSingleton<ChangeEmailUseCase>(ChangeEmailUseCase(sl()));
  sl.registerSingleton<ChangePasswordUseCase>(ChangePasswordUseCase(sl()));
  sl.registerSingleton<SendVerifyEmailUseCase>(SendVerifyEmailUseCase(sl()));
  sl.registerSingleton<ChangeProfilePhotoUseCase>(ChangeProfilePhotoUseCase(sl()));

  ///Blocs

  ///Global:
  sl.registerFactory<LocaleBloc>(() => LocaleBloc());
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl(), sl(), sl(), sl(), sl()));

  ///Features:
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
  sl.registerFactory<DiscoverBloc>(() => DiscoverBloc(sl()));
  sl.registerFactory<LocalArticlesBloc>(() => LocalArticlesBloc(sl(), sl(), sl()));
}
