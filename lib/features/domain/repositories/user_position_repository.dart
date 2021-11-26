import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/user_position.dart';

abstract class UserPositionRepository {
  Future<Either<Failure, UserPosition>> getUserPosition();
}