import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../models/user_position_model.dart';

abstract class UserPositionRemoteDataSource {
  Future<UserPositionModel> getUserPosition();
}

class UserPositionRemoteDataSourceImpl implements UserPositionRemoteDataSource {
  final Dio client;
  UserPositionRemoteDataSourceImpl({required this.client});

  @override
  Future<UserPositionModel> getUserPosition() async {
    final response = await client.get('/patrimonio/userPosition?id=1');
    if (response.statusCode == 200) {
      return UserPositionModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
