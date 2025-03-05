import 'package:flutter/material.dart';

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
                ListTile(
                  title: Text("Apple Inc. (AAPL)"),
                  subtitle: Text("Price: \$150.00"),
                  trailing: Text("+1.5%", style: TextStyle(color: Colors.green)),
                ),
                ListTile(
                  title: Text("Tesla Inc. (TSLA)"),
                  subtitle: Text("Price: \$700.00"),
                  trailing: Text("-0.8%", style: TextStyle(color: Colors.red)),
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
                ListTile(
                  title: Text("Stock Market Hits All-Time High"),
                  subtitle: Text("Source: Bloomberg"),
                ),
                ListTile(
                  title: Text("Tesla Announces New EV Model"),
                  subtitle: Text("Source: Reuters"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
