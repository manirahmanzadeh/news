import 'package:flutter/material.dart';
import 'package:news_app/src/features/authentication/presentation/account/screens/changename_screen.dart';
import 'package:news_app/src/features/authentication/presentation/account/screens/changepasword_screen.dart';
import 'package:news_app/src/features/authentication/presentation/account/screens/email_screen.dart';
import 'package:news_app/src/features/authentication/presentation/account/screens/profile_screen.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/forget_password_screen.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/login_screen.dart';
import 'package:news_app/src/features/authentication/presentation/register/screens/signup_screen.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/article_screen.dart';
import 'package:news_app/src/features/daily_news/presentation/discover/screens/discover_screen.dart';
import 'package:news_app/src/features/daily_news/presentation/home/screens/home_screen.dart';
import 'package:news_app/src/features/daily_news/presentation/saved_article/saved_article.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    LoginScreen.routeName: (context) => const LoginScreen(),
    SignUpScreen.routeName: (context) => const SignUpScreen(),
    ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    DiscoverScreen.routeName: (context) => const DiscoverScreen(),
    ProfileScreen.routeName: (context) => const ProfileScreen(),
    ChangeNameScreen.routeName: (context) => const ChangeNameScreen(),
    EmailScreen.routeName: (context) => const EmailScreen(),
    ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
    ArticleScreen.routeName: (context) => const ArticleScreen(),
    SavedArticles.routeName: (context) => const SavedArticles(),
  };
}
