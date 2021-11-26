import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/data/datasources/user_position_remote_data_source.dart';
import 'features/data/repositories/user_position_repository_impl.dart';
import 'features/domain/repositories/user_position_repository.dart';
import 'features/domain/usecases/get_user_position.dart';

import 'features/presentation/bloc/user_position_bloc.dart';

// service locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Features - NumberTrivia
  sl.registerFactory(() => UserPositionBloc(
        getUserPosition: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetUserPosition(sl()));

  // Repository
  sl.registerLazySingleton<UserPositionRepository>(
      () => UserPositionRepositoryImpl(
            userPositionRemoteDataSource: sl(),
          ));
  // Data sources
  sl.registerLazySingleton<UserPositionRemoteDataSource>(
      () => UserPositionRemoteDataSourceImpl(client: sl()));
  
  sl.registerLazySingleton(() => http.Client());
}
