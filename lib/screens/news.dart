import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/news_model.dart';
import '../services/alpha_vantage_service.dart';
import '../widgets/news_tile.dart';

class NewsScreen extends StatelessWidget {
  final String symbol;

  const NewsScreen({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final avService = Provider.of<AlphaVantageService>(context);
    final newsFuture = avService.getStockNews(symbol);

    return Scaffold(
      appBar: AppBar(title: Text('$symbol News')),
      body: FutureBuilder<List<News>>(
        future: newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return NewsTile(article: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}