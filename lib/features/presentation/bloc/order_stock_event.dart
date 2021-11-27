part of 'order_stock_bloc.dart';

abstract class OrderStockEvent extends Equatable {
  const OrderStockEvent();

  @override
  List<Object> get props => [];
}

class PostOrderStockEvent extends OrderStockEvent {
  final String symbol;
  final int amount;

  const PostOrderStockEvent({
    required this.symbol,
    required this.amount,
  });
}
