import 'package:flutter/material.dart';
import '../widgets/stock_card.dart';
import '../widgets/news_tile.dart';
import 'stock_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Market Tracker"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Watchlist Section
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Your Watchlist",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StockDetailsScreen(stockName: "Apple Inc.", stockPrice: "\$150.00")),
                    );
                  },
                  child: StockCard(
                    stockName: "Apple Inc. (AAPL)",
                    stockPrice: "\$150.00",
                    changePercentage: "+1.5%",
                    isPositive: true,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StockDetailsScreen(stockName: "Tesla Inc.", stockPrice: "\$700.00")),
                    );
                  },
                  child: StockCard(
                    stockName: "Tesla Inc. (TSLA)",
                    stockPrice: "\$700.00",
                    changePercentage: "-0.8%",
                    isPositive: false,
                  ),
                ),
              ],
            ),
          ),

          // News Section
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Latest News",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                NewsTile(
                  headline: "Stock Market Hits All-Time High",
                  source: "Bloomberg",
                ),
                NewsTile(
                  headline: "Tesla Announces New EV Model",
                  source: "Reuters",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
