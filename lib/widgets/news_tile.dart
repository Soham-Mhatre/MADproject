import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // Correct import
import '../models/news_model.dart';

class NewsTile extends StatelessWidget {
  final News article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text('${article.source} • ${article.publishedAt}'),
      onTap: () async {
        final url = Uri.parse(article.url);
        if (await canLaunchUrl(url)) {  // Check if URL is valid
          await launchUrl(url);  // Open URL in browser
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to open URL')),
          );
        }
      },
    );
  }
}