class NewsArticle {
  final String title;
  final String source;
  final String url;
  final DateTime publishedAt;

  NewsArticle({
    required this.title,
    required this.source,
    required this.url,
    required this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      source: json['source'],
      url: json['url'],
      publishedAt: DateTime.parse(json['published_at']),
    );
  }
}