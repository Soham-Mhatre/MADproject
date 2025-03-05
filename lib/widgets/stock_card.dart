import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final String stockName;
  final String stockPrice;
  final String changePercentage;
  final bool isPositive;

  StockCard({
    required this.stockName,
    required this.stockPrice,
    required this.changePercentage,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(stockName, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Price: $stockPrice"),
        trailing: Text(
          changePercentage,
          style: TextStyle(
            color: isPositive ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
