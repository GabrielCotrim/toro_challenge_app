import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/user_position.dart';
import '../../domain/repositories/user_position_repository.dart';
import '../datasources/user_position_remote_data_source.dart';

class UserPositionRepositoryImpl implements UserPositionRepository {
  final UserPositionRemoteDataSource userPositionRemoteDataSource;
  UserPositionRepositoryImpl({
    required this.userPositionRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserPosition>> getUserPosition() async {
    try {
      final remoteUserPosition =
          await userPositionRemoteDataSource.getUserPosition();
      return Right(remoteUserPosition);
    } on ServerException {
      return const Left(ServerFailure());
    } catch (_) {
      return const Left(ConnectionFailure());
    }
  }
}
