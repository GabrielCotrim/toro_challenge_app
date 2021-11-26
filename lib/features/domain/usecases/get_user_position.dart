import 'package:toro_challenge/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:toro_challenge/core/usecases/use_case.dart';
import 'package:toro_challenge/features/domain/entities/user_position.dart';
import 'package:toro_challenge/features/domain/repositories/user_position_repository.dart';

class GetUserPosition implements UseCase<UserPosition, NoParams> {
  final UserPositionRepository repository;
  GetUserPosition(this.repository);

  @override
  Future<Either<Failure, UserPosition>?> call(NoParams params) async {
    return await repository.getUserPosition();
  }
}
