import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/alpha_vantage_service.dart';
import '../models/stock_model.dart';

class StockDetailsScreen extends StatefulWidget {
  final String symbol;

  const StockDetailsScreen({super.key, required this.symbol});

  @override
  _StockDetailsScreenState createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen> {
  late Future<Stock> _stockFuture;

  @override
  void initState() {
    super.initState();
    final avService = Provider.of<AlphaVantageService>(context, listen: false);
    _stockFuture = avService.getStockDetails(widget.symbol);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.symbol)),
      body: FutureBuilder<Stock>(
        future: _stockFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final stock = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: \$${stock.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 20),
                Text('Change: ${stock.change.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: stock.change >= 0 ? Colors.green : Colors.red,
                      fontSize: 18,
                    )),
                Text('Market Cap: \$${stock.marketCap.toStringAsFixed(2)}B',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}