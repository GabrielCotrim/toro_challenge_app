import 'package:dartz/dartz.dart';
import 'package:toro_challenge/core/error/exceptions.dart';
import 'package:toro_challenge/core/error/failures.dart';
import 'package:toro_challenge/features/data/datasources/order_stock_remote_data_source.dart';
import 'package:toro_challenge/features/domain/entities/position.dart';
import 'package:toro_challenge/features/domain/repositories/order_stock_repository.dart';

class OrderStockRepositoryImpl implements OrderStockRepository {
  final OrderStockRemoteDataSource orderStockRemoteDataSource;

  OrderStockRepositoryImpl({required this.orderStockRemoteDataSource});

  @override
  Future<Either<Failure, Position>> postOrderStock(
      String symbol, int amount) async {
    try {
      var remote =
          await orderStockRemoteDataSource.postOrderStock(symbol, amount);
      return Right(remote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
