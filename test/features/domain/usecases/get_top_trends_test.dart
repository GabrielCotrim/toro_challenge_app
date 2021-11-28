import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:toro_challenge/core/usecases/use_case.dart';
import 'package:toro_challenge/features/domain/entities/stock.dart';
import 'package:toro_challenge/features/domain/repositories/top_trends_repository.dart';
import 'package:toro_challenge/features/domain/usecases/get_top_trends.dart';

import 'get_top_trends_test.mocks.dart';

@GenerateMocks([TopTrendsRepository])
void main() {
  late MockTopTrendsRepository repository;
  late GetTopTrends usecase;
  late List<Stock> stocks;

  setUp(() {
    repository = MockTopTrendsRepository();
    usecase = GetTopTrends(repository);
    stocks = <Stock>[];
  });

  test(
    "Deve obter ações do repositório",
    () async {
      //arrange
      when(repository.getTopTrends())
          .thenAnswer((_) async => Right(stocks));
      //act
      final result = await usecase(NoParams());
      //assert
      expect(result, equals(Right(stocks)));
      verify(repository.getTopTrends());
      verifyNoMoreInteractions(repository);
    },
  );
}
