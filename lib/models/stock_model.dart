class Stock {
  final String symbol;
  final String name;
  final double price;
  final double change;
  final double changePercent;
  final double marketCap;

  Stock({
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.marketCap,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['01. symbol'],
      name: json['02. name'] ?? 'N/A',
      price: double.parse(json['05. price']),
      change: double.parse(json['09. change']),
      changePercent: double.parse(json['10. change percent'].replaceAll('%', '')),
      marketCap: double.parse(json['07. market cap'] ?? '0'),
    );
  }
}