import 'package:dartz/dartz.dart';
import 'package:toro_challenge/core/error/exceptions.dart';
import 'package:toro_challenge/core/error/failures.dart';
import 'package:toro_challenge/features/data/datasources/top_trends_remote_data_source.dart';
import 'package:toro_challenge/features/domain/entities/stock.dart';
import 'package:toro_challenge/features/domain/repositories/top_trends_repository.dart';

class TopTrendsRepositoryImpl implements TopTrendsRepository {
  TopTrendsRemoteDataSource topTrendsRemoteDataSource;

  TopTrendsRepositoryImpl({
    required this.topTrendsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Stock>>> getTopTrends() async {
    try {
      final remoteTopTrends = await topTrendsRemoteDataSource.getTopTrends();
      return Right(remoteTopTrends);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
