class Article {
  Article({
    required this.slugName,
    required this.section,
    required this.title,
    required this.articleAbstract,
    required this.url,
    required this.byline,
    required this.thumbnailStandard,
    required this.publishedDate,
  });

  final String slugName;
  final String section;
  final String title;
  final String articleAbstract;
  final String url;
  final String byline;
  final String thumbnailStandard;
  final DateTime publishedDate;

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      slugName: map['slug_name'] ?? '',
      section: map['section'] ?? '',
      title: map['title'] ?? '',
      articleAbstract: map['abstract'] ?? '',
      url: map['url'] ?? '',
      byline: map['byline'] ?? '',
      thumbnailStandard: map['thumbnail_standard'] ?? '',
      publishedDate: DateTime.parse(map['published_date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slug_name': slugName,
      'section': section,
      'title': title,
      'abstract': articleAbstract,
      'url': url,
      'byline': byline,
      'thumbnail_standard': thumbnailStandard,
      'published_date': publishedDate.toIso8601String(),
    };
  }
}
