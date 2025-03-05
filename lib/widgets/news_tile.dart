import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String headline;
  final String source;

  NewsTile({required this.headline, required this.source});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(headline, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Source: $source"),
      ),
    );
  }
}
