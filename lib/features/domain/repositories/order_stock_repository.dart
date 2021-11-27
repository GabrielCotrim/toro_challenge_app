import 'package:dartz/dartz.dart';
import 'package:toro_challenge/core/error/failures.dart';
import 'package:toro_challenge/features/domain/entities/position.dart';

abstract class OrderStockRepository {
  Future<Either<Failure, Position>> postOrderStock(String symbol, int amount);
}