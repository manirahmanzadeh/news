enum NewsCategory {
  general('general'),
  business('business'),
  entertainment('entertainment'),
  science('science'),
  sports('sports'),
  technology('technology'),
  health('health');

  const NewsCategory(this.category);

  final String category;
}
