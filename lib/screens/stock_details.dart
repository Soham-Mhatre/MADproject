import 'package:flutter/material.dart';

class StockDetailsScreen extends StatelessWidget {
  final String stockName;
  final String stockPrice;

  StockDetailsScreen({required this.stockName, required this.stockPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stockName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Current Price: $stockPrice", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to Dashboard"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
