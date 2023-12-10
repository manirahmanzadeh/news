import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/constants/news_category.dart';
import 'package:news_app/src/core/localization/locale_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';

import '../../../../domain/entities/article.dart';
import '../../../bloc/article/remote/remote_article_bloc.dart';
import '../../../bloc/article/remote/remote_article_state.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
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

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
      builder: (context, state) {
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
          return Column(
            children: [
              _buildBodyTopPart(context, state),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildBodyTopPart(BuildContext context, RemoteArticleState state) {
    final lastArticle = state.articles!.last;
    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
        image: DecorationImage(
          image: CachedNetworkImageProvider(lastArticle.urlToImage!),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            lastArticle.title!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            context.localizations.learnMore,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
