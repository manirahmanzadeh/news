enum NewsCategoryEnum {
  general('general', 'General'),
  business('business', 'Business'),
  entertainment('entertainment', 'Entertainment'),
  science('science', 'Science'),
  sports('sports', 'Sports'),
  technology('technology', 'Technology'),
  health('health', 'Health');

  const NewsCategoryEnum(this.category, this.text);

  final String category;
  final String text;
}
