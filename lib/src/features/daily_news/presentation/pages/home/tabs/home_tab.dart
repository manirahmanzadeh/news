import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/constants/news_category.dart';
import 'package:news_app/src/features/daily_news/data/models/article.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/src/features/daily_news/presentation/widgets/home/bottom_part.dart';
import 'package:news_app/src/features/daily_news/presentation/widgets/home/top_part.dart';

import '../../../bloc/article/remote/remote_article_bloc.dart';
import '../../../bloc/article/remote/remote_article_state.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return Center(
            child: IconButton(
              onPressed: () => BlocProvider.of<RemoteArticlesBloc>(context).add(
                GetArticles(
                  category: NewsCategory.general.category,
                ),
              ),
              icon: const Icon(Icons.refresh),
            ),
          );
        }
        if (state is RemoteArticlesDone) {
          return ListView(
            children: [
              TopPart(
                lastArticle: ArticleModel.fromEntity(state.articles!.last),
              ),
              BottomPart(
                articles: state.articles!,
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
