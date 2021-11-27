import '../../domain/entities/action.dart';

class ActionModel extends Action {
  const ActionModel({
    required String symbol,
    required double currentPrice,
  }) : super(
          symbol: symbol,
          currentPrice: currentPrice,
        );

  factory ActionModel.fromJson(Map<String, dynamic> json) {
    return ActionModel(
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
