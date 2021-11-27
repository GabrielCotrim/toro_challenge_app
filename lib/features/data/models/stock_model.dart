import '../../domain/entities/stock.dart';

class StockModel extends Stock {
  const StockModel({
    required String symbol,
    required double currentPrice,
  }) : super(
          symbol: symbol,
          currentPrice: currentPrice,
        );

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      symbol: json['symbol'],
      currentPrice: (json['currentPrice'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'currentPrice': currentPrice,
    };
  }
}
