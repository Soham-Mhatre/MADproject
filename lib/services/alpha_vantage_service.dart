import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/stock_model.dart';
import '../models/news_model.dart';

class AlphaVantageService {
  static final String _apiKey = dotenv.env['ALPHA_VANTAGE_API_KEY']!;

  // Get stock data
  Future<Stock> getStockDetails(String symbol) async {
    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['Global Quote'];
      return Stock.fromJson(data);
    } else {
      throw Exception('Failed to load stock data');
    }
  }

  // Get stock news
  Future<List<News>> getStockNews(String symbol) async {
    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&tickers=$symbol&apikey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['feed'] as List;
      return data.map((e) => News.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}