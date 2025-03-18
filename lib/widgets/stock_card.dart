import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/alpha_vantage_service.dart';
import '../models/stock_model.dart';

class StockCard extends StatelessWidget {
  final String symbol;
  final String companyName;

  const StockCard({
    super.key,
    required this.symbol,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    final avService = Provider.of<AlphaVantageService>(context);

    return FutureBuilder<Stock>(
      future: avService.getStockDetails(symbol),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ListTile(
            title: Text('Loading...'),
            trailing: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return ListTile(
            title: Text(symbol),
            subtitle: const Text('Failed to load data'),
          );
        }

        final stock = snapshot.data!;
        return ListTile(
          title: Text(symbol),
          subtitle: Text(companyName),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$${stock.price.toStringAsFixed(2)}'),
              Text(
                '${stock.changePercent.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: stock.changePercent >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}