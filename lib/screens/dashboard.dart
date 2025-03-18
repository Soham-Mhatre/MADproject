import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firebase_service.dart';
import '../widgets/stock_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddStockDialog(context),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getWatchlist(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              return StockCard(
                symbol: doc['symbol'],
                companyName: doc['name'],
              );
            },
          );
        },
      ),
    );
  }

  void _showAddStockDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Stock'),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Enter stock symbol'),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              Provider.of<FirestoreService>(context, listen: false)
                  .addToWatchlist(value.toUpperCase(), value);
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}