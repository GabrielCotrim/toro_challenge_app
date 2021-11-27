import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:toro_challenge/core/error/failures.dart';
import 'package:toro_challenge/core/usecases/use_case.dart';
import 'package:toro_challenge/features/domain/entities/position.dart';
import 'package:toro_challenge/features/domain/repositories/order_stock_repository.dart';

class PostOrderStock extends UseCase<void, OrderParams> {
  final OrderStockRepository repository;
  PostOrderStock(this.repository);

  @override
  Future<Either<Failure, Position>?> call(OrderParams params) {
    return repository.postOrderStock(params.symbol, params.amount);
  }

}

class OrderParams extends Equatable {
  final String symbol;
  final int amount;

  const OrderParams({
    required this.symbol,
    required this.amount,
  });

  @override
  List<Object?> get props => [symbol, amount];
}