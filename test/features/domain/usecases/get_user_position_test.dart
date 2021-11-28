import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:toro_challenge/core/usecases/use_case.dart';
import 'package:toro_challenge/features/domain/entities/user_position.dart';
import 'package:toro_challenge/features/domain/repositories/user_position_repository.dart';
import 'package:toro_challenge/features/domain/usecases/get_user_position.dart';

import 'get_user_position_test.mocks.dart';

@GenerateMocks([UserPositionRepository])
void main() {
  late MockUserPositionRepository repository;
  late GetUserPosition usecase;
  late UserPosition userPosition;

  setUp(() {
    repository = MockUserPositionRepository();
    usecase = GetUserPosition(repository);
    userPosition = const UserPosition(
      checkingAccountAmount: 0.0,
      consolidated: 0.0,
      positions: [],
    );
  });

  test(
    "Deve obter património do usuário do repositório",
    () async {
      //arrange
      when(repository.getUserPosition()).thenAnswer((_) async => Right(userPosition));
      //act
      final result = await usecase(NoParams());
      //assert
      expect(result, equals(Right(userPosition)));
      verify(repository.getUserPosition());
      verifyNoMoreInteractions(repository);
    },
  );
}
