class News {
  final String title;
  final String source;
  final String url;
  final DateTime publishedAt;

  News({
    required this.title,
    required this.source,
    required this.url,
    required this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      source: json['source'],
      url: json['url'],
      publishedAt: DateTime.parse(json['published_at']),
    );
  }
}