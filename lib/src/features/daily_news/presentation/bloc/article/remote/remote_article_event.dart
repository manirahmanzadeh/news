abstract class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

class GetArticles extends RemoteArticlesEvent {
  final String category;

  const GetArticles({
    required this.category,
  });
}

class ChangeQ extends RemoteArticlesEvent {
  final String q;

  const ChangeQ({
    required this.q,
  });
}
