import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final String symbol;
  final double currentPrice;

  const Stock({
    required this.symbol,
    required this.currentPrice,
  });

  @override
  List<Object?> get props => [symbol, currentPrice];
}
