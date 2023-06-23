import 'package:ada_lovelace/core/constants.dart';
import 'package:ada_lovelace/data/local/local_database_manager.dart';
import 'package:ada_lovelace/domain/repositories/tasks_repo.dart';
import 'package:ada_lovelace/presentation/bloc/tasks/tasks_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/network/api/tasks_api.dart';
import 'data/network/custom_interceptor.dart';
import 'domain/repositories/tasks_repo_impl.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl.registerFactory(() => TasksBloc(sl()));
  sl.registerLazySingleton<TasksRepo>(() => TasksRepoImpl(sl(), sl()));
  sl.registerLazySingleton(() => TasksApi(sl()));

  sl.registerLazySingleton(() => CustomInterceptor());
  
  sl.registerLazySingleton(() => LocalDatabaseManager());

  final dio = Dio(BaseOptions(baseUrl: apiURL));
  dio.interceptors.add(sl.get<CustomInterceptor>());
  sl.registerLazySingleton(() => dio);
}