import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/src/features/daily_news/data/models/article.dart';

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
    required this.lastArticle,
  });

  final ArticleModel lastArticle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00000000), // Transparent black at the top
                  Color(0x80000000), // Black with 0.5 opacity at the bottom
                ],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lastArticle.title!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () => _onLearnMorePressed(context),
                  child: Text(
                    '${AppLocalizations.of(context)!.learnMore} →',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onLearnMorePressed(BuildContext context) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: lastArticle);
  }
}
