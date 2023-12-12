abstract class DiscoverEvent {
  const DiscoverEvent();
}

class GetArticlesDiscoverEvent extends DiscoverEvent {
  final String? initialCategory;

  const GetArticlesDiscoverEvent({
    this.initialCategory,
  });
}

class ChangeQDiscoverEvent extends DiscoverEvent {
  final String q;

  const ChangeQDiscoverEvent({
    required this.q,
  });
}

class ChangeCategoryDiscoverEvent extends DiscoverEvent {
  final String category;

  const ChangeCategoryDiscoverEvent({
    required this.category,
  });
}
