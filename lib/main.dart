import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // Load .env file
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StockScreen(),
    );
  }
}

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  String _stockPrice = "Loading...";
  String _symbol = "AAPL"; // Default stock symbol (Apple Inc.)

  @override
  void initState() {
    super.initState();
    fetchStockPrice(_symbol);
  }

  Future<void> fetchStockPrice(String symbol) async {
    final String apiKey = dotenv.env['ALPHA_VANTAGE_API_KEY']!;
    final String url =
        "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _stockPrice = data["Global Quote"]["05. price"] ?? "N/A";
        });
      } else {
        setState(() {
          _stockPrice = "Error fetching data";
        });
      }
    } catch (e) {
      setState(() {
        _stockPrice = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Stock Price")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Stock Symbol: $_symbol",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Current Price: $_stockPrice",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: "Enter Stock Symbol"),
              onSubmitted: (value) {
                setState(() {
                  _symbol = value.toUpperCase();
                });
                fetchStockPrice(_symbol);
              },
            ),
          ],
        ),
      ),
    );
  }
}
