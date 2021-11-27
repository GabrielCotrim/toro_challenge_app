import 'package:dio/dio.dart';
import 'package:toro_challenge/core/error/exceptions.dart';
import 'package:toro_challenge/features/data/models/stock_model.dart';

abstract class TopTrendsRemoteDataSource {
  Future<List<StockModel>> getTopTrends();
}

class TopTrendsRemoteDataSourceImpl implements TopTrendsRemoteDataSource {
  final Dio client;

  TopTrendsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<StockModel>> getTopTrends() async {
    final response = await client.get('/ativo/trends');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => StockModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
