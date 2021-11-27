import 'package:dartz/dartz.dart';
import 'package:toro_challenge/core/error/failures.dart';
import 'package:toro_challenge/core/usecases/use_case.dart';
import 'package:toro_challenge/features/domain/entities/stock.dart';
import 'package:toro_challenge/features/domain/repositories/top_trends_repository.dart';

class GetTopTrends implements UseCase<List<Stock>, NoParams> {
  TopTrendsRepository topTrendsRepository;

  GetTopTrends(this.topTrendsRepository);

  @override
  Future<Either<Failure, List<Stock>>?> call(NoParams params) {
    return topTrendsRepository.getTopTrends();
  }
}
