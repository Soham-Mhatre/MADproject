import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Market Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Watchlist Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Watchlist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Sample count, replace with actual data
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text('Stock $index'),
                    subtitle: Text('Price: \$100.00'),
                    trailing: Icon(Icons.trending_up, color: Colors.green),
                    onTap: () {
                      // Navigate to Stock Details Screen
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
