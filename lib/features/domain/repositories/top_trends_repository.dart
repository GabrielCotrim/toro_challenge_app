import 'package:dartz/dartz.dart';
import 'package:toro_challenge/core/error/failures.dart';
import 'package:toro_challenge/features/domain/entities/stock.dart';

abstract class TopTrendsRepository {
  Future<Either<Failure, List<Stock>>> getTopTrends();
}