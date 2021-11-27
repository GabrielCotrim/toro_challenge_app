import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:toro_challenge/features/data/datasources/order_stock_remote_data_source.dart';
import 'package:toro_challenge/features/data/datasources/top_trends_remote_data_source.dart';
import 'package:toro_challenge/features/data/repositories/order_stock_repository_impl.dart';
import 'package:toro_challenge/features/data/repositories/top_trends_repository_impl.dart';
import 'package:toro_challenge/features/domain/repositories/order_stock_repository.dart';
import 'package:toro_challenge/features/domain/repositories/top_trends_repository.dart';
import 'package:toro_challenge/features/domain/usecases/get_top_trends.dart';
import 'package:toro_challenge/features/domain/usecases/post_order_stock.dart';
import 'package:toro_challenge/features/presentation/bloc/order_stock_bloc.dart';
import 'package:toro_challenge/features/presentation/bloc/top_trends_bloc.dart';
import 'features/data/datasources/user_position_remote_data_source.dart';
import 'features/data/repositories/user_position_repository_impl.dart';
import 'features/domain/repositories/user_position_repository.dart';
import 'features/domain/usecases/get_user_position.dart';

import 'features/presentation/bloc/user_position_bloc.dart';

// service locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  sl.registerFactory(() => UserPositionBloc(getUserPosition: sl()));
  sl.registerFactory(() => TopTrendsBLoc(getTopTrends: sl()));
  sl.registerFactory(() => OrderStockBloc(postOrderStock: sl()));
  // Use cases
  sl.registerLazySingleton(() => GetUserPosition(sl()));
  sl.registerLazySingleton(() => GetTopTrends(sl()));
  sl.registerLazySingleton(() => PostOrderStock(sl()));
  // Repository
  sl.registerLazySingleton<UserPositionRepository>(
      () => UserPositionRepositoryImpl(userPositionRemoteDataSource: sl()));
  sl.registerLazySingleton<TopTrendsRepository>(
      () => TopTrendsRepositoryImpl(topTrendsRemoteDataSource: sl()));
  sl.registerLazySingleton<OrderStockRepository>(
      () => OrderStockRepositoryImpl(orderStockRemoteDataSource: sl()));
  // Data sources
  sl.registerLazySingleton<UserPositionRemoteDataSource>(
      () => UserPositionRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<TopTrendsRemoteDataSource>(
      () => TopTrendsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<OrderStockRemoteDataSource>(
      () => OrderStockRemoteDataSourceImpl(client: sl()));

  var options = BaseOptions(
    baseUrl: 'http://192.168.0.115:49154/api',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  sl.registerLazySingleton(() => Dio(options));
}
