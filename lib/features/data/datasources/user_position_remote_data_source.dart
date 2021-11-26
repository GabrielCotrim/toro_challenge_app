import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/error/exceptions.dart';
import '../models/user_position_model.dart';

abstract class UserPositionRemoteDataSource {
  Future<UserPositionModel> getUserPosition();
}

class UserPositionRemoteDataSourceImpl implements UserPositionRemoteDataSource {
  final http.Client client;
  UserPositionRemoteDataSourceImpl({required this.client});

  @override
  Future<UserPositionModel> getUserPosition() async {
    final response = await client.get(
      Uri.parse('http://localhost:5000/api/patrimonio/userPosition?id=1'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return UserPositionModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
