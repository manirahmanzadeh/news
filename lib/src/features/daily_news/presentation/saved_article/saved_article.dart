import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/src/core/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/src/core/bloc/article/local/local_article_event.dart';
import 'package:news_app/src/core/bloc/article/local/local_article_state.dart';
import 'package:news_app/src/core/components/article/saved_article_tile.dart';
import 'package:news_app/src/features/daily_news/domain/entities/article.dart';
import 'package:news_app/src/features/daily_news/presentation/article_detail/article_screen.dart';

class SavedArticles extends StatelessWidget {
  const SavedArticles({Key? key}) : super(key: key);

  static const routeName = '/saved-articles';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocalArticlesBloc>(context).add(const GetSavedArticles());
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _onBackButtonTapped(context),
            child: const Icon(Ionicons.chevron_back, color: Colors.black),
          ),
        ),
        title: const Text('Saved Articles', style: TextStyle(color: Colors.black)),
      ),
      body: BlocBuilder<LocalArticlesBloc, LocalArticlesState>(
        builder: (context, state) {
          if (state is LocalArticlesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LocalArticlesDone) {
            return _buildArticlesList(state.articles!);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED ARTICLES',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return SavedArticleTile(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
          onArticlePressed: (article) => _onArticlePressed(context, article),
        );
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticlesBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, ArticleScreen.routeName, arguments: article);
  }
}
