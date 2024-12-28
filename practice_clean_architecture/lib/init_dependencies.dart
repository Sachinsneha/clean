import 'package:get_it/get_it.dart';
import 'package:practice_clean_architecture/core/secrets/app_screts.dart';
import 'package:practice_clean_architecture/features/daily_news/data/datasources/auth_remote_data_source.dart';
import 'package:practice_clean_architecture/features/daily_news/data/repository/auth_repository_imp.dart';
import 'package:practice_clean_architecture/features/daily_news/domain/repository/auth_repository.dart';
import 'package:practice_clean_architecture/features/daily_news/domain/usecases/user_singup.dart';
import 'package:practice_clean_architecture/features/daily_news/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppScrets.supabaseUrl,
    anonKey: AppScrets.supabaseAnnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator
      .registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
            serviceLocator(),
          ));

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImp(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(() => UserSingup(
        authRepository: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton(() => AuthBloc(
        userSingup: serviceLocator(),
      ));
}
