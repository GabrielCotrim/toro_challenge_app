import 'package:equatable/equatable.dart';

class Action extends Equatable {
  final String symbol;
  final double currentPrice;

  const Action({
    required this.symbol,
    required this.currentPrice,
  });

  @override
  List<Object?> get props => [symbol, currentPrice];
}
