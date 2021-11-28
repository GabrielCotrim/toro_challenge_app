import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:toro_challenge/features/domain/entities/position.dart';
import 'package:toro_challenge/features/domain/repositories/order_stock_repository.dart';
import 'package:toro_challenge/features/domain/usecases/post_order_stock.dart';

import 'post_order_stock_test.mocks.dart';

@GenerateMocks([OrderStockRepository])
void main() {
  late MockOrderStockRepository repository;
  late PostOrderStock usecase;
  late Position position;

  const String _symbol = "PETR4";
  const int _amount = 1;

  setUp(() {
    repository = MockOrderStockRepository();
    usecase = PostOrderStock(repository);
    position = const Position(
      amount: _amount,
      symbol: _symbol,
      currentPrice: 28.44,
    );
  });

  test(
    "Deve realizar efetuar a compra e retorna a compra",
        () async {
      //arrange
      when(repository.postOrderStock(_symbol, _amount))
          .thenAnswer((_) async => Right(position));
      //act
      final result = await usecase(
        const OrderParams(
          symbol: _symbol,
          amount: _amount,
        ),
      );
      //assert
      expect(result, equals(Right(position)));
      verify(repository.postOrderStock(_symbol, _amount));
      verifyNoMoreInteractions(repository);
    },
  );
}
