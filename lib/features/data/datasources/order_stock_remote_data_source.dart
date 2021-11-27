import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toro_challenge/core/error/exceptions.dart';
import 'package:toro_challenge/features/data/models/position_model.dart';

abstract class OrderStockRemoteDataSource {
  Future<PositionModel> postOrderStock(String symbol, int amount);
}

class OrderStockRemoteDataSourceImpl extends OrderStockRemoteDataSource {
  final Dio client;

  OrderStockRemoteDataSourceImpl({required this.client});

  @override
  Future<PositionModel> postOrderStock(String symbol, int amount) async {
    var request = {
      'symbol': symbol,
      'amount': amount,
    };
    final response = await client.post('/ativo/order?id=1', data: jsonEncode(request));
    if (response.statusCode == 200) {
      return PositionModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
