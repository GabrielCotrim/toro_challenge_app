import 'package:equatable/equatable.dart';

class Position extends Equatable {
  final int amount;
  final String symbol;
  final double currentPrice;

  const Position({
    required this.amount,
    required this.symbol,
    required this.currentPrice,
  });

  @override
  List<Object?> get props => [amount, symbol, currentPrice];
}
