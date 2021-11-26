import '../../domain/entities/position.dart';

class PositionModel extends Position {
  const PositionModel({
    required String symbol,
    required double currentPrice,
    required int amount,
  }) : super(
          symbol: symbol,
          currentPrice: currentPrice,
          amount: amount,
        );

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      symbol: json['symbol'],
      currentPrice: json['currentPrice'],
      amount: json['amount']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'currentPrice': currentPrice,
    };
  }
}